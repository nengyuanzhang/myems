import re
from datetime import datetime, timedelta, timezone

import falcon
import mysql.connector
import simplejson as json

import config
from core.useractivity import user_logger, access_control

class WorkingCalendarCollection:
    @staticmethod
    def __init__():
        """"Initializes WorkingCalendarCollection"""
        pass

    @staticmethod
    def on_options(req, resp):
        resp.status = falcon.HTTP_200

    @staticmethod
    def on_get(req, resp):
        
        cnx = mysql.connector.connect(**config.myems_system_db)
        cursor = cnx.cursor()

        cursor.execute(" SELECT id, name, description"
                       " FROM tbl_working_calendars ")

        rows_calendars = cursor.fetchall()

        result = list()
        if rows_calendars is not None and len(rows_calendars) > 0:
            for row in rows_calendars:
                meta_result = {"id": row[0],
                               "name": row[1],
                               "description": row[2]}
                result.append(meta_result)
    
        cursor.close()
        cnx.close()
        resp.text = json.dumps(result)

    @staticmethod
    def on_post(req, resp):
        """Handles POST requests"""
        try:
            raw_json = req.stream.read().decode('utf-8')
            new_values = json.loads(raw_json)
        except Exception as ex:
            raise falcon.HTTPError(falcon.HTTP_400, title='API.ERROR', description=str(ex))

        if 'name' not in new_values['data'].keys() or \
                not isinstance(new_values['data']['name'], str) or \
                len(str.strip(new_values['data']['name'])) == 0:
            raise falcon.HTTPError(falcon.HTTP_400, title='API.BAD_REQUEST',
                                   description='API.INVALID_WORKING_CALENDAR_NAME')
        name = str.strip(new_values['data']['name'])

        if 'description' in new_values['data'].keys() and \
                new_values['data']['description'] is not None and \
                len(str(new_values['data']['description'])) > 0:
            description = str.strip(new_values['data']['description'])
        else:
            description = None

        cnx = mysql.connector.connect(**config.myems_system_db)
        cursor = cnx.cursor()

        cursor.execute(" SELECT name "
                       " FROM tbl_working_calendars "
                       " WHERE name = %s ", (name,))
        if cursor.fetchone() is not None:
            cursor.close()
            cnx.close()
            raise falcon.HTTPError(falcon.HTTP_400, title='API.BAD_REQUEST',
                                   description='API.WORKING_CALENDAR_NAME_IS_ALREADY_IN_USE')

        add_values = (" INSERT INTO tbl_working_calendars "
                      " (name, description) "
                      " VALUES (%s, %s) ")
        cursor.execute(add_values, (name,
                                    description))
        new_id = cursor.lastrowid
        cnx.commit()
        cursor.close()
        cnx.close()

        resp.status = falcon.HTTP_201
        resp.location = '/workingcalendar/' + str(new_id)

class WorkingCalendarItem:
    @staticmethod
    def __init__():
        """"Initializes WorkingCalendarItem"""
        pass

    @staticmethod
    def on_options(req, resp):
        resp.status = falcon.HTTP_200

    @staticmethod
    def on_get(req, resp, id_):
        if not id_.isdigit() or int(id_) <= 0:
            raise falcon.HTTPError(falcon.HTTP_400, title='API.BAD_REQUEST',
                                   description='API.INVALID_WORKING_CALENDAR_ID')
        
        cnx = mysql.connector.connect(**config.myems_system_db)
        cursor = cnx.cursor()

        cursor.execute(" SELECT id, name, description"
                       " FROM tbl_working_calendars "
                       " WHERE id = %s ", (id_,))
        row = cursor.fetchone()
        cursor.close()
        cnx.close()

        meta_result = {}
        if row is None:
            raise falcon.HTTPError(falcon.HTTP_404, title='API.NOT_FOUND',
                                   description='API.WORKING_CALENDAR_NOT_FOUND')
    
        meta_result = {"id": row[0],
                        "name": row[1],
                        "description": row[2]}
        resp.text = json.dumps(meta_result)

    @staticmethod
    def on_delete(req, resp, id_):
        if not id_.isdigit() or int(id_) <= 0:
            raise falcon.HTTPError(falcon.HTTP_400, title='API.BAD_REQUEST',
                                   description='API.INVALID_WORKING_CALENDAR_ID')
        
        cnx = mysql.connector.connect(**config.myems_system_db)
        cursor = cnx.cursor()

        cursor.execute(" SELECT id "
                       " FROM tbl_working_calendars "
                       " WHERE id = %s ", (id_,))
        if cursor.fetchone() is None:
            cursor.close()
            cnx.close()
            raise falcon.HTTPError(falcon.HTTP_404, title='API.NOT_FOUND',
                                   description='API.WORKING_CALENDAR_NOT_FOUND')

        # check relation with space
        cursor.execute(" SELECT id FROM tbl_spaces_working_calendars"
                       " WHERE working_calendar_id = %s ", (id_,))

        rows_non_working_days = cursor.fetchall()
        if rows_non_working_days is not None and len(rows_non_working_days) > 0:
            cursor.close()
            cnx.close()
            raise falcon.HTTPError(falcon.HTTP_400,
                                   title='API.BAD_REQUEST',
                                   description='API.THERE_IS_RELATION_WITH_SPACES')

        # check relation with stores
        cursor.execute(" SELECT tenant_id "
                       " FROM tbl_tenants_working_calendars "
                       " WHERE working_calendar_id = %s ", (id_,))
        rows_tenants = cursor.fetchall()
        if rows_tenants is not None and len(rows_tenants) > 0:
            cursor.close()
            cnx.close()
            raise falcon.HTTPError(falcon.HTTP_400,
                                   title='API.BAD_REQUEST',
                                   description='API.THERE_IS_RELATION_WITH_TENANTS')

        # check relation with stores
        cursor.execute(" SELECT store_id "
                       " FROM tbl_stores_working_calendars "
                       " WHERE working_calendar_id = %s ", (id_,))
        rows_stores = cursor.fetchall()
        if rows_stores is not None and len(rows_stores) > 0:
            cursor.close()
            cnx.close()
            raise falcon.HTTPError(falcon.HTTP_400,
                                   title='API.BAD_REQUEST',
                                   description='API.THERE_IS_RELATION_WITH_STORES')
        
        # check relation with shopfloors
        cursor.execute(" SELECT shopfloor_id "
                       " FROM tbl_shopfloors_working_calendars "
                       " WHERE working_calendar_id = %s ", (id_,))
        rows_shopfloors = cursor.fetchall()
        if rows_shopfloors is not None and len(rows_shopfloors) > 0:
            cursor.close()
            cnx.close()
            raise falcon.HTTPError(falcon.HTTP_400,
                                   title='API.BAD_REQUEST',
                                   description='API.THERE_IS_RELATION_WITH_SHOPFLOORS')

        # check relation with non working days
        cursor.execute(" SELECT id FROM tbl_working_calendars_non_working_days"
                       " WHERE working_calendar_id = %s ", (id_,))
                
        rows_non_working_days = cursor.fetchall()
        if rows_non_working_days is not None and len(rows_non_working_days) > 0:
            cursor.close()
            cnx.close()
            raise falcon.HTTPError(falcon.HTTP_400,
                                   title='API.BAD_REQUEST',
                                   description='API.THERE_IS_RELATION_WITH_NON_WORKING_DAYS')

        cursor.execute(" DELETE FROM tbl_working_calendars WHERE id = %s ", (id_,))
        cnx.commit()

        cursor.close()
        cnx.close()

        resp.status = falcon.HTTP_204

    @staticmethod
    def on_put(req, resp, id_):
        """Handles PUT requests"""
        try:
            raw_json = req.stream.read().decode('utf-8')
        except Exception as ex:
            raise falcon.HTTPError(falcon.HTTP_400, title='API.EXCEPTION', description=str(ex))

        if not id_.isdigit() or int(id_) <= 0:
            raise falcon.HTTPError(falcon.HTTP_400, title='API.BAD_REQUEST',
                                   description='API.INVALID_WORKING_CALENDAR_ID')

        new_values = json.loads(raw_json)

        if 'name' not in new_values['data'].keys() or \
                not isinstance(new_values['data']['name'], str) or \
                len(str.strip(new_values['data']['name'])) == 0:
            raise falcon.HTTPError(falcon.HTTP_400, title='API.BAD_REQUEST',
                                   description='API.INVALID_WORKING_CALENDAR_NAME')
        name = str.strip(new_values['data']['name'])

        if 'description' in new_values['data'].keys() and \
                new_values['data']['description'] is not None and \
                len(str(new_values['data']['description'])) > 0:
            description = str.strip(new_values['data']['description'])
        else:
            description = None

        cnx = mysql.connector.connect(**config.myems_system_db)
        cursor = cnx.cursor()

        cursor.execute(" SELECT name "
                       " FROM tbl_working_calendars "
                       " WHERE id = %s ", (id_,))
        if cursor.fetchone() is None:
            cursor.close()
            cnx.close()
            raise falcon.HTTPError(falcon.HTTP_404, title='API.NOT_FOUND',
                                   description='API.WORKING_CALENDAR_NOT_FOUND')

        cursor.execute(" SELECT name "
                       " FROM tbl_working_calendars "
                       " WHERE name = %s AND id != %s ", (name, id_))
        if cursor.fetchone() is not None:
            cursor.close()
            cnx.close()
            raise falcon.HTTPError(falcon.HTTP_400, title='API.BAD_REQUEST',
                                   description='API.WORKING_CALENDAR_NAME_IS_ALREADY_IN_USE')

        update_row = (" UPDATE tbl_working_calendars "
                      " SET name = %s, description = %s "
                      " WHERE id = %s ")
        cursor.execute(update_row, (name, description, id_))
        cnx.commit()

        cursor.close()
        cnx.close()

        resp.status = falcon.HTTP_200

class NonWorkingDayCollection:
    @staticmethod
    def __init__():
        """"Initializes NonWorkingDayCollection"""
        pass

    @staticmethod
    def on_options(req, resp, id_):
        resp.status = falcon.HTTP_200

    @staticmethod
    def on_get(req, resp, id_):
        if not id_.isdigit() or int(id_) <= 0:
            raise falcon.HTTPError(falcon.HTTP_400, title='API.BAD_REQUEST',
                                   description='API.INVALID_NON_WORKING_DAY_ID')
                                   
        cnx = mysql.connector.connect(**config.myems_system_db)
        cursor = cnx.cursor()

        cursor.execute( " SELECT id, working_calendar_id, date_local, description"
                        " FROM tbl_working_calendars_non_working_days "
                        " WHERE working_calendar_id = %s ", (id_,))
        rows_date_local = cursor.fetchall()

        meta_result = list()
        if rows_date_local is not None and len(rows_date_local) > 0:
            for row in rows_date_local:
                date_local_dict = { 'id': row[0], 
                                    'working_calendar_id': row[1],
                                    'date_local': row[2].strftime('%Y-%m-%d'),
                                    'description': row[3]}
                meta_result.append(date_local_dict)

        cursor.close()
        cnx.close()
       

        resp.text = json.dumps(meta_result)

    @staticmethod
    def on_post(req, resp, id_):
        """Handles POST requests"""
        try:
            raw_json = req.stream.read().decode('utf-8')
            new_values = json.loads(raw_json)
        except Exception as ex:
            raise falcon.HTTPError(falcon.HTTP_400, title='API.ERROR', description=str(ex))

        if not id_.isdigit() or int(id_) <= 0:
            raise falcon.HTTPError(falcon.HTTP_400, title='API.BAD_REQUEST',
                                   description='API.INVALID_WORKING_CALENDAR_ID')
        working_calendar_id = id_

        if 'date_local' not in new_values['data'].keys() or \
                new_values['data']['date_local'] is None or \
                len(str(new_values['data']['date_local'])) <= 0:
            raise falcon.HTTPError(falcon.HTTP_400, title='API.BAD_REQUEST',
                                description='API.INVALID_DATE_LOCAL')
        date_local = str.strip(new_values['data']['date_local'])

        if 'description' in new_values['data'].keys() and \
                new_values['data']['description'] is not None and \
                len(str(new_values['data']['description'])) > 0:
            description = str.strip(new_values['data']['description'])
        else:
            description = None

        cnx = mysql.connector.connect(**config.myems_system_db)
        cursor = cnx.cursor()

        cursor.execute(" SELECT id "
                       " FROM tbl_working_calendars_non_working_days "
                       " WHERE working_calendar_id = %s AND date_local = %s ",
                        (working_calendar_id, date_local))
        if cursor.fetchone() is not None:
            cursor.close()
            cnx.close()
            raise falcon.HTTPError(falcon.HTTP_400, title='API.BAD_REQUEST',
                                   description='API.DATE_LOCAL_IN_WORKING_CALENDAR')

        add_values = (" INSERT INTO tbl_working_calendars_non_working_days "
                      " (working_calendar_id, date_local, description) "
                      " VALUES (%s, %s, %s) ")
        cursor.execute(add_values, (working_calendar_id, date_local, description))
        new_id = cursor.lastrowid
        cnx.commit()
        cursor.close()
        cnx.close()

        resp.status = falcon.HTTP_201
        resp.location = '/nonworkingday/' + str(new_id)

class NonWorkingDayItem:
    @staticmethod
    def __init__():
        """"Initializes NonWorkingDayItem"""
        pass

    @staticmethod
    def on_options(req, resp):
        resp.status = falcon.HTTP_200

    @staticmethod
    def on_get(req, resp, id_):
        if not id_.isdigit() or int(id_) <= 0:
            raise falcon.HTTPError(falcon.HTTP_400, title='API.BAD_REQUEST',
                                   description='API.INVALID_NON_WORKING_DAY_ID')
        
        cnx = mysql.connector.connect(**config.myems_system_db)
        cursor = cnx.cursor()

        cursor.execute(" SELECT id, working_calendar_id, date_local, description"
                       " FROM tbl_working_calendars_non_working_days "
                       " WHERE id = %s ", (id_,))
        row = cursor.fetchone()
        cursor.close()
        cnx.close()

        if row is None:
            raise falcon.HTTPError(falcon.HTTP_404, title='API.NOT_FOUND',
                                   description='API.NON_WORKING_DAY_NOT_FOUND')
        else:
            meta_result = {"id": row[0],
                           "working_calendar_id": row[1],
                           "date_local": row[2].strftime('%Y-%m-%d'),
                           "description": row[3],}
        resp.text = json.dumps(meta_result)

    @staticmethod
    def on_delete(req, resp, id_):
        if not id_.isdigit() or int(id_) <= 0:
            raise falcon.HTTPError(falcon.HTTP_400, title='API.BAD_REQUEST',
                                   description='API.INVALID_NON_WORKING_DAY_ID')
        
        cnx = mysql.connector.connect(**config.myems_system_db)
        cursor = cnx.cursor()

        cursor.execute(" SELECT id "
                       " FROM tbl_working_calendars_non_working_days "
                       " WHERE id = %s ", (id_,))
        if cursor.fetchone() is None:
            cursor.close()
            cnx.close()
            raise falcon.HTTPError(falcon.HTTP_404, title='API.NOT_FOUND',
                                   description='API.NON_WORKING_DAY_NOT_FOUND')

        cursor.execute(" DELETE FROM tbl_working_calendars_non_working_days WHERE id = %s ", (id_,))
        cnx.commit()

        cursor.close()
        cnx.close()

        resp.status = falcon.HTTP_204

    @staticmethod
    def on_put(req, resp, id_):
        """Handles PUT requests"""
        try:
            raw_json = req.stream.read().decode('utf-8')
        except Exception as ex:
            raise falcon.HTTPError(falcon.HTTP_400, title='API.EXCEPTION', description=str(ex))

        if not id_.isdigit() or int(id_) <= 0:
            raise falcon.HTTPError(falcon.HTTP_400, title='API.BAD_REQUEST',
                                   description='API.NON_WORKING_DAY_NOT_FOUND')

        new_values = json.loads(raw_json)

        if 'working_calendar_id' not in new_values['data'].keys() or \
                not isinstance(new_values['data']['working_calendar_id'], int) or \
                new_values['data']['working_calendar_id'] <= 0:
            raise falcon.HTTPError(falcon.HTTP_400, title='API.BAD_REQUEST',
                                   description='API.INVALID_WORKING_CALENDAR_ID')
        working_calendar_id = new_values['data']['working_calendar_id']

        if 'date_local' in new_values['data'].keys() and \
                new_values['data']['date_local'] is not None and \
                len(str(new_values['data']['date_local'])) > 0:
            date_local = str.strip(new_values['data']['date_local'])

        if 'description' in new_values['data'].keys() and \
                new_values['data']['description'] is not None and \
                len(str(new_values['data']['description'])) > 0:
            description = str.strip(new_values['data']['description'])
        else:
            description = None

        cnx = mysql.connector.connect(**config.myems_system_db)
        cursor = cnx.cursor()

        cursor.execute(" SELECT date_local "
                       " FROM tbl_working_calendars_non_working_days "
                       " WHERE id = %s ", (id_,))
        if cursor.fetchone() is None:
            cursor.close()
            cnx.close()
            raise falcon.HTTPError(falcon.HTTP_404, title='API.NOT_FOUND',
                                   description='API.DATE_LOCAL_NOT_FOUND')

        cursor.execute(" SELECT id "
                       " FROM tbl_working_calendars_non_working_days "
                       " WHERE working_calendar_id = %s AND date_local = %s AND description = %s",
                        (working_calendar_id, date_local, description))
        if cursor.fetchone() is not None:
            cursor.close()
            cnx.close()
            raise falcon.HTTPError(falcon.HTTP_400, title='API.BAD_REQUEST',
                                   description='API.DATE_LOCAL_IN_WORKING_CALENDAR')

        update_row = (" UPDATE tbl_working_calendars_non_working_days "
                      " SET working_calendar_id = %s, date_local = %s, description = %s "
                      " WHERE id = %s ")
        cursor.execute(update_row, (working_calendar_id, date_local, description, id_))
        cnx.commit()

        cursor.close()
        cnx.close()

        resp.status = falcon.HTTP_200