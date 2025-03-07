-- MyEMS System Database Demo Data

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_combined_equipments`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_combined_equipments`
(`id`, `name`, `uuid`,  `is_input_counted`, `is_output_counted`, `cost_center_id`, `description` )
VALUES
(1, 'CombinedEquipment1', '48aab70f-2e32-4518-9986-a6b7395acf58', 1, 0, 1, 'description'),
(2, 'CombinedEquipment2', 'c235e68c-e1be-4d7a-84e7-976c83ff6e44', 1, 0, 1,  'description');

COMMIT;


-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_combined_equipments_equipments`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_combined_equipments_equipments`
(`id`, `combined_equipment_id`, `equipment_id`)
VALUES
(1, 1, 1);

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_combined_equipments_meters`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_combined_equipments_meters`
(`id`, `combined_equipment_id`, `meter_id`, `is_output`)
VALUES
(1, 1, 1, 0);

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_combined_equipments_offline_meters`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_combined_equipments_offline_meters`
(`id`, `combined_equipment_id`, `offline_meter_id`, `is_output`)
VALUES
(1, 1, 1, 0);

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_combined_equipments_parameters`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_combined_equipments_parameters`
(`id`, `combined_equipment_id`, `name`, `parameter_type`, `constant`, `point_id`, `numerator_meter_uuid`, `denominator_meter_uuid`)
VALUES
(1, 1, 'serial number', 'constant', 'bfa8b106', NULL, NULL, NULL),
(2, 1, 'manufacturer', 'constant', 'York', NULL, NULL, NULL),
(3, 1, 'maintainer', 'constant', 'Johnson Controls', NULL, NULL, NULL),
(4, 1, 'use life start', 'constant', '2016-01-01', NULL, NULL, NULL),
(5, 1, 'use life end', 'constant', '2025-12-31', NULL, NULL, NULL),
(6, 1, 'model number', 'constant', 'CH01', NULL, NULL, NULL),
(7, 1, 'nominal cooling capacity', 'constant', '90.000 kW', NULL, NULL, NULL),
(8, 1, 'nominal cooling input power', 'constant', '100.000 kW', NULL, NULL, NULL),
(9, 1, 'nominal cooling cop', 'constant', '5', NULL, NULL, NULL),
(10, 1, 'nominal cooling operating current', 'constant', '120.000 A', NULL, NULL, NULL),
(11, 1, 'rated input power', 'constant', '100.000 kW', NULL, NULL, NULL),
(12, 1, 'nominal chilled water flow rate', 'constant', '30 m2/h', NULL, NULL, NULL),
(13, 1, 'nominal cooling water flow_rate', 'constant', '50 m2/h', NULL, NULL, NULL),
(14, 1, 'status', 'point', NULL, 1, NULL, NULL),
(15, 1, 'inlet chilled water temperature', 'point', NULL, 2, NULL, NULL),
(16, 1, 'chilled_water instantaneous flow rate', 'point', NULL, 3, NULL, NULL),
(17, 1, 'instantaneous power', 'point', NULL, 4, NULL, NULL),
(18, 1, 'COP', 'fraction', NULL, NULL, '5ca47bc5-22c2-47fc-b906-33222191ea40', '719acf65-b932-4176-94e5-e9fe420abc68');

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_combined_equipments_virtual_meters`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_combined_equipments_virtual_meters`
(`id`, `combined_equipment_id`, `virtual_meter_id`, `is_output`)
VALUES
(1, 1, 1, 0);

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_contacts`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;
INSERT INTO `myems_system_db`.`tbl_contacts`(`id`, `name`, `uuid`, `email`, `phone`, `description`)
VALUES
(1, 'John', '5c5ce6e8-8d00-46b3-9602-4e1520a8b43f',  'john@myems.io', '+8613888888888', 'Building #1'),
(2, 'Sample Tenant', '102b654d-e831-4365-bb1e-dbd55e897851',  'sample.tenant@myems.io', '+8613666666666', 'Sample Tenant');
COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_cost_centers`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_cost_centers`
(`id`, `name`, `uuid`, `external_id`)
VALUES
(1, 'Cost Center 1', 'd97b9736-c4f9-4005-a534-6af3487303ad', NULL);
COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_cost_centers_tariffs`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;
INSERT INTO `myems_system_db`.`tbl_cost_centers_tariffs`
(`id`, `cost_center_id`, `tariff_id`)
VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3);

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_data_sources`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_data_sources`
(`id`, `name`, `uuid`,`gateway_id`, `protocol`,  `connection`)
VALUES
(1, 'Example ModbusTCP Data Source', 'b3ace9d4-b63b-419b-818f-0f6d1d0603a4', 1, 'modbus-tcp', '{"host":"192.168.0.1", "port":502}'),
(2, 'Example ModbusRTU Data Source', 'b903f0af-9115-448c-9d46-8caf5f9995f3', 1, 'modbus-rtu', '{"port": "/dev/ttyUSB0","slaveaddress": 1, "baudrate": 9600,"bytesize": 8,"parity": "N","stopbits": 1,"timeout": 0.05,"mode": "rtu"}'),
(3, 'Example Bacnet/IP Data Source', 'e2d5b30b-b554-4ebe-8ce7-f377ab380d19', 1, 'bacnet-ip', '{"host":"192.168.0.3", "port":47808}'),
(4, 'Example S7 Data Source', '9eb0d705-d02a-43f8-9c62-7e5ef508b255', 1, 's7', '{"host":"192.168.0.4", "port":102, "rack": 0, "slot": 2}'),
(5, 'Example ControlLogix Data Source', 'd1dc9792-7861-4dd3-9b01-07511dae16c1', 1, 'controllogix', '{"host":"192.168.0.5","port":44818,"processorslot":3}'),
(6, 'Example OPU UA Data Source', '56e1c642-8032-495b-af2e-18a77ca75e0f', 1, 'opc-ua', '{"url":"opc.tcp://192.168.0.6:49320/OPCUA/SimulationServer/"}'),
(7, 'Example Weather Data Source', '9bff8e95-c7c9-4002-b040-08a96ae196b5', 1, 'weather', '{"base_url":"WEATHER_API_URL", "location":"beijing", "key":"APPKEY"}'),
(8, 'Example MySQL Data Source', '409439d0-3e0a-4ab3-865a-a5c0329925f8', 1, 'mysql', '{"host":"192.168.0.8", "port":3306, "user":"myems", "password":"!MyEMS1", "database":"myems_ingestion_db" }'),
(9, 'Example SQL Server Data Source', '025f0429-5088-4f2a-85a3-dff9b4523692', 1, 'sqlserver', '{"host":"192.168.0.9", "port":1433, "user":"myems", "password":"!MyEMS1", "database":"myems_ingestion_db" }'),
(10, 'Example PostgreSQL Data Source', 'd89b81e6-4917-4a84-b0e9-c2e939599d3a', 1, 'postgresql', '{"host":"192.168.0.10", "port":5432, "user":"myems", "password":"!MyEMS1", "database":"myems_ingestion_db" }'),
(11, 'Example Oracle Data Source', '1bdf4db8-ea71-433e-ad16-b637275073d7', 1, 'oracle', '{"dsn":"192.168.0.11:1521/myems", "user":"myems", "password":"!MyEMS1"}'),
(12, 'Example MongoDB Data Source', 'c211fbad-d1d4-465c-bdf5-242f5593682e', 1, 'mongodb', '{"host":"192.168.0.12", "port":27017, "user":"myems", "password":"!MyEMS1", "database":"myems_ingestion_db" }'),
(13, 'Example InfluxDB Data Source', '79cb60ff-c683-4289-ac69-bd13e1f970d1', 1, 'influxdb', '{"url":"http://192.168.0.13:8086", "token":"MYEMSINFLUXDBTOKEN", "org":"myems", "bucket":"myems"}'),
(14, 'Example MQTT Data Source', 'e3d56e11-00da-4957-ab0b-1d761dc8b89f', 1, 'mqtt', '{"host":"192.168.0.14","port":1883,"user":"myems", "password":"!MyEMS1", "topic":"70B3D5100995","qos":2}');
COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_distribution_circuits`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_distribution_circuits`
(`id`, `name`, `uuid`, `distribution_system_id`, `distribution_room`, `switchgear`, `peak_load`, `peak_current`, `customers`, `meters`)
VALUES
(1, 'AHa01', '52f7abe1-ba0e-47a6-a327-4faac42a1d11', 1, '1ES', 'AHa01', 5100, 1250, '11#电源进线1WHj2', 'AHa01');

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_distribution_circuits_points`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_distribution_circuits_points`
(`id`, `distribution_circuit_id`, `point_id`)
VALUES (1, 1, 1);
COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_distribution_systems`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_distribution_systems`
(`id`, `name`, `uuid`, `svg`,  `description`)
VALUES
(1, 'Example Distribution System', '95652719-56fa-44cc-9bef-7aa47664d4ff', '<?xml version="1.0" encoding="UTF-8"?><svg width="5cm" height="4cm" version="1.1" xmlns="http://www.w3.org/2000/svg"><desc>Four separate rectangles</desc><rect x=".5cm" y=".5cm" width="2cm" height="1cm"/></svg>', 'demo distribution system');

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_energy_categories`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_energy_categories`
(`id`, `name`, `uuid`, `unit_of_measure`, `kgce`, `kgco2e`)
VALUES
(1, 'Electricity', '6d0753ed-8b43-4332-b6fd-d2f5813831d3', 'kWh', 0.122, 0.928),
(2, 'Water', '3dbfa598-fccc-4d60-bf11-14bd55540c66', 'm³', 0.085, 0.910),
(3, 'Natural Gas', '6d0753ed-8b43-4332-b6fd-d2f5813831d3', 'm³', 1.330, 2.162),
(4,'4℃ Chilled Water','d2a3021a-4911-4611-856e-80133000f1d5','m³',1.000,1.000),
(5,'7℃ Chilled Water','c1ad0696-e1ab-4e0c-a342-b194c0bc27e0','m³',1.000,1.000),
(6,'Steam','ac91a5c4-4ae5-4a73-8e3f-044591f42eef','T',1.000,1.000),
(7,'Compressed Air','ff238e98-cd35-47c5-88a3-00617587775d','m³',1.000,1.000),
(8,'Circulating Water','7e159a34-b2e6-4fd3-ba76-897d134abe06','m³',1.000,1.000),
(9, 'Heat','549f9cad-8db7-49d2-9473-95e37a3fc46a','KJ',1.000,1.000),
(10, 'Cold','05aa257b-3cf6-4f19-808d-92e7dbf52b16','KJ',1.000,1.000),
(11, 'Recycled Water','df6161b6-4a1b-46e7-b7c8-337b5b52d717','m³',1.000,1.000);
COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_energy_items`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;
INSERT INTO myems_system_db.tbl_energy_items
(id, name, uuid, energy_category_id)
VALUES
(1, 'Power for lighting and sockets', 'cade4e78-2b85-4bea-ab6e-0d6accc88d03', 1),
(2, 'Power for corridor and emergency lighting', '7a6dc086-ce08-4d66-ba75-f69af92b32f4', 1),
(3, 'Power for outdoor landscape lighting', 'abcebbd1-b770-4e7c-ae54-8434d724522c', 1),
(4, 'Power for cooling and heating station', '97cdea54-04c7-4a6a-b4c2-df15874b2f49', 1),
(5, 'Power for air conditioning terminal', '84ab7262-33fb-43a1-9880-9287cc268cc0', 1),
(6, 'Power for Elevator', '26a5fc62-3da1-41b0-bcb1-0056e25ee121', 1),
(7, 'Power for Water pump', 'fc6079f5-01a4-434f-9004-9382e8c3dd47', 1),
(8, 'Power for Fan', 'a4bf68cd-6ae1-48dd-b281-07c95312921d', 1),
(9, 'Special Usage Electricity', '1990d151-02ff-4fd6-b298-2b2edee4e0ea', 1);
COMMIT;


-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_energy_flow_diagrams`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_energy_flow_diagrams`
(`id`, `name`, `uuid`)
VALUES
(1, 'Example Energy Flow Diagram', '3ccbc9c6-9575-4212-a63a-a688d1154302');

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_energy_flow_diagrams_links`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_energy_flow_diagrams_links`
(`id`, `energy_flow_diagram_id`, `source_node_id`, `target_node_id`, `meter_uuid`)
VALUES
(1, 1, 1, 3, '5ca47bc5-22c2-47fc-b906-33222191ea40'),
(2, 1, 2, 4, '5d4d2f06-6200-4671-b182-4cf32cd9228f'),
(3, 1, 2, 5, '7897665b-66ac-481d-9c31-2ab2ecbda16c'),
(4, 1, 2, 6, 'f0c278ec-eb32-4c5e-a35f-88643b00c367'),
(5, 1, 3, 7, '9918aa6c-79e9-4579-8f2e-a76eb9fe4e3e'),
(6, 1, 3, 8, '831cbc8c-1429-4840-946e-f0b389b2253e'),
(7, 1, 4, 9, 'd2fc8464-3f13-42a9-8a57-63f95f677f0f'),
(8, 1, 4, 10, '7e4b3831-887b-40e2-b7f8-4d77c6f206a9');

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_energy_flow_diagrams_nodes`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_energy_flow_diagrams_nodes`
(`id`, `energy_flow_diagram_id`, `name`)
VALUES
(1, 1, '10KVInput#1'),
(2, 1, '10KVInput#2'),
(3, 1, 'Rental Area'),
(4, 1, 'Public Area'),
(5, 1, 'Hotel'),
(6, 1, 'Car Park'),
(7, 1, 'Food and Beverage'),
(8, 1, 'Retail'),
(9, 1, 'Lighting'),
(10, 1, 'Elevator');

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_equipments`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_equipments`
(`id`, `name`, `uuid`,  `is_input_counted`, `is_output_counted`, `cost_center_id`,  `description` )
VALUES
(1, 'Equipment1', 'bfa8b106-89a1-49ca-9b2b-a481ac41a873', 1, 0, 1, 'description'),
(2, 'Equipment2', 'ad5798ec-d827-43d9-bf08-fc7516f9c4c8', 1, 0, 1, 'description');

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_equipments_meters`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_equipments_meters`
(`id`, `equipment_id`, `meter_id`, `is_output`)
VALUES
(1, 1, 1, 0);

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_equipments_offline_meters`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_equipments_offline_meters`
(`id`, `equipment_id`, `offline_meter_id`, `is_output`)
VALUES
(1, 1, 1, 0);

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_equipments_parameters`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_equipments_parameters`
(`id`, `equipment_id`, `name`, `parameter_type`, `constant`, `point_id`, `numerator_meter_uuid`, `denominator_meter_uuid`)
VALUES
(1, 1, 'serial number', 'constant', 'bfa8b106', NULL, NULL, NULL),
(2, 1, 'manufacturer', 'constant', 'York', NULL, NULL, NULL),
(3, 1, 'maintainer', 'constant', 'Johnson Controls', NULL, NULL, NULL),
(4, 1, 'use life start', 'constant', '2016-01-01', NULL, NULL, NULL),
(5, 1, 'use life end', 'constant', '2025-12-31', NULL, NULL, NULL),
(6, 1, 'model number', 'constant', 'CH01', NULL, NULL, NULL),
(7, 1, 'nominal cooling capacity', 'constant', '90.000 kW', NULL, NULL, NULL),
(8, 1, 'nominal cooling input power', 'constant', '100.000 kW', NULL, NULL, NULL),
(9, 1, 'nominal cooling cop', 'constant', '5', NULL, NULL, NULL),
(10, 1, 'nominal cooling operating current', 'constant', '120.000 A', NULL, NULL, NULL),
(11, 1, 'rated input power', 'constant', '100.000 kW', NULL, NULL, NULL),
(12, 1, 'nominal chilled water flow rate', 'constant', '30 m2/h', NULL, NULL, NULL),
(13, 1, 'nominal cooling water flow_rate', 'constant', '50 m2/h', NULL, NULL, NULL),
(14, 1, 'status', 'point', NULL, 1, NULL, NULL),
(15, 1, 'inlet chilled water temperature', 'point', NULL, 2, NULL, NULL),
(16, 1, 'chilled_water instantaneous flow rate', 'point', NULL, 3, NULL, NULL),
(17, 1, 'instantaneous power', 'point', NULL, 4, NULL, NULL),
(18, 1, 'COP', 'fraction', NULL, NULL, '5ca47bc5-22c2-47fc-b906-33222191ea40', '719acf65-b932-4176-94e5-e9fe420abc68');

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_equipments_virtual_meters`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_equipments_virtual_meters`
(`id`, `equipment_id`, `virtual_meter_id`, `is_output`)
VALUES
(1, 1, 1, 0);

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_gateways`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_gateways`
(`id`, `name`, `uuid`, `token`,  `last_seen_datetime_utc`)
VALUES
(2, 'MyEMS Gateway 2', '8f75c0ab-9296-49c7-9058-8139febd0c31', 'd3860971-e6e0-4c98-9eba-5492869c5b19', null);

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_knowledge_files`
-- ---------------------------------------------------------------------------------------------------------------------

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_meters`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_meters`
(`id`, `name`, `uuid`, `energy_category_id`, `is_counted`, `hourly_low_limit`, `hourly_high_limit`, `cost_center_id`, `energy_item_id`, `master_meter_id`, `description`)
VALUES
(1, 'Example Meter 1', '5ca47bc5-22c2-47fc-b906-33222191ea40', 1, 1, 0.000, 999.999, 1, 1, null, 'meter1'),
(2, 'Example Meter 2', '5ca47bc5-22c2-47fc-b906-33222191ea40', 1, 1, 0.000, 999.999, 1, 1, 1,  'meter2'),
(3, 'Example Meter 3', '6db58cd6-33d3-58ed-a095-22333202fb51', 1, 1, 0.000, 999.999, 1, 1, 1,  'meter3');

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_meters_points`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_meters_points`
(`id`, `meter_id`, `point_id`)
VALUES (1, 1, 1);

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_offline_meters`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_offline_meters`
(`id`, `name`, `uuid`, `energy_category_id`, `is_counted`, `hourly_low_limit`, `hourly_high_limit`, `cost_center_id`, `energy_item_id`, `description`)
VALUES
(1, 'Example Offline Meter', '62f473e0-1a35-41f3-9c30-8110d75d65bb', 1, 1, 0.0, 999.999, 1, 1, 'offlinemeter1');

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_points`
-- ---------------------------------------------------------------------------------------------------------------------
-- List of Object Type
-- ENERGY_VALUE
-- ANALOG_VALUE
-- DIGITAL_VALUE

START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_points`
(`id`, `name`, `data_source_id`, `object_type`, `units`, `high_limit`, `low_limit`, `ratio`, `is_trend`, `is_virtual`, `address`, `description` )
VALUES
(1, 'Active Energy Import Tariff 1', 1, 'ENERGY_VALUE', 'kWh', 99999999999, 0, 1.000, 1, 0,
  '{\"slave_id\":1, \"function_code\":3, \"offset\":801, \"number_of_registers\":4, \"format\":\"=d\", \"byte_swap\":false}', null),

(2, 'Working hours counter', 1, 'ANALOG_VALUE',  'S', 999999999, 0, 1.000, 1, 0,
  '{\"slave_id\":1, \"function_code\":3, \"offset\":209, \"number_of_registers\":2, \"format\":\"=L\", \"byte_swap\":true}', null),

(3, 'Current a', 1, 'ANALOG_VALUE',  'A', 5, 0, 1.000, 1, 0,
  '{\"slave_id\":1, \"function_code\":3, \"offset\":13, \"number_of_registers\":2, \"format\":\"=f\", \"byte_swap\":false}', null),

(4, 'Active Power a', 1, 'ANALOG_VALUE',  'W', 3450, 0, 1.000, 1, 0,
  '{\"slave_id\":1, \"function_code\":3, \"offset\":25, \"number_of_registers\":2, \"format\":\"=f\", \"byte_swap\":false}', null),

(5, 'Power Factor a', 1, 'ANALOG_VALUE',  'W', 1, 0, 1.000, 1, 0,
  '{\"slave_id\":1, \"function_code\":3, \"offset\":37, \"number_of_registers\":2, \"format\":\"=f\", \"byte_swap\":false}', null),

(6, 'Example ModbusTCP Point 6', 2, 'ENERGY_VALUE',  'Wh', 99999999999, 0, 1.000, 1, 0,
  '{\"slave_id\":1, \"function_code\":3, \"offset\":40001, \"number_of_registers\":2, \"format\":\"=f\", \"byte_swap\":false}', null),

(7, 'Example Point 7', 2, 'ANALOG_VALUE',  'V', 690, 0, 1.000, 1, 0,
  '{\"slave_id\":1, \"function_code\":3, \"offset\":40002, \"number_of_registers\":2, \"format\":\"=f\", \"byte_swap\":false}', null),

(8, 'BACnet Example Point 1', 3, 'ANALOG_VALUE',  'V', 690, 0, 1.000, 1, 0,
  '{\"object_type\":\"analogValue\", \"object_id\":3004860, \"property_name\":\"presentValue\", \"property_array_index\":null}', null),
-- BACnet Object Type
-- analogValue, analogInput, analogOutput, binaryValue, binaryInput, binaryOutput

(9, 'S7 Example Point1', 4, 'ANALOG_VALUE',  'kWh', 99999999999, 0, 1.000, 1, 0,
  '{\"area\":\"DB\", \"db_number\":700, \"start\":8, \"size\":4}', null);
-- # S7 Area
-- 'PE', 'PA', 'MK', 'DB', 'CT', 'TM'

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_sensors`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_sensors`
(`id`, `name`, `uuid`, `description`)
VALUES
(1, 'Example 传感器', 'ba450606-6f39-41e0-8caf-75b528635511', 'sensor description');

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_sensors_points`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_sensors_points`
(`id`, `sensor_id`, `point_id`)
VALUES (1, 1, 1);

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_shopfloors`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_shopfloors`
(`id`, `name`, `uuid` , `area`, `contact_id`, `is_input_counted`,  `cost_center_id`, `description`)
VALUES
(1, 'MyEMS Shopfloor', 'd03837fd-9d30-44fe-9443-154f7c7e15f1',  99999.999, 1, 1, 1,  'MyEMS Project');
COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_shopfloors_equipments`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_shopfloors_equipments`
(`id`, `shopfloor_id`, `equipment_id`)
VALUES
(1, 1, 1);

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_shopfloors_meters`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_shopfloors_meters`
(`id`, `shopfloor_id`, `meter_id`)
VALUES
(1, 1, 1);

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_shopfloors_offline_meters`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_shopfloors_offline_meters`
(`id`, `shopfloor_id`, `offline_meter_id`)
VALUES
(1, 1, 1);

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_shopfloors_sensors`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_shopfloors_sensors`
(`id`, `shopfloor_id`, `sensor_id`)
VALUES
(1, 1, 1);

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_shopfloors_virtual_meters`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_shopfloors_virtual_meters`
(`id`, `shopfloor_id`, `virtual_meter_id`)
VALUES
(1, 1, 1);

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_shopfloors_points`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_shopfloors_points`
(`id`, `shopfloor_id`, `point_id`)
VALUES
(1, 3, 2000001),
(2, 3, 2000002),
(3, 3, 2000003),
(4, 3, 2000006);

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_spaces`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_spaces`
(`id`, `name`, `uuid`, `parent_space_id`, `area`, `timezone_id`, `contact_id`, `is_input_counted`, `is_output_counted`, `cost_center_id`, `description`)
VALUES
(2, 'MyEMS Building #1', '8f25b33b-db93-49b3-b0f8-b01e0c19df29', 1, 88888.888, 56, 1, 1, 1, 1,  'MyEMS Project'),
(3, 'MyEMS Building #2', '195d7ea8-17b4-4e9c-bb37-546428155438', 1, 66666.666, 56, 1, 1, 1, 1, 'MyEMS Project'),
(10000, 'Debugging Space', '2c44a292-eb0c-49a3-a50e-4fc03858dc0c', 1, 88888.888, 56, 1, 1, 1, 1,  'MyEMS Project');
COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_spaces_combined_equipments`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_spaces_combined_equipments`
(`id`, `space_id`, `combined_equipment_id`)
VALUES
(1, 10000, 1),
(2, 10000, 2);

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_spaces_equipments`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_spaces_equipments`
(`id`, `space_id`, `equipment_id`)
VALUES
(1, 10000, 1),
(2, 10000, 2);

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_spaces_meters`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_spaces_meters`
(`id`, `space_id`, `meter_id`)
VALUES
(1, 1, 1);

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_spaces_offline_meters`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_spaces_offline_meters`
(`id`, `space_id`, `offline_meter_id`)
VALUES
(1, 1, 1);

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_spaces_sensors`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_spaces_sensors`
(`id`, `space_id`, `sensor_id`)
VALUES
(1, 1, 1);

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_spaces_shopfloors`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_spaces_shopfloors`
(`id`, `space_id`, `shopfloor_id`)
VALUES
(1, 1, 1);

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_spaces_stores`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_spaces_stores`
(`id`, `space_id`, `store_id`)
VALUES
(1, 1, 1);

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_spaces_tenants`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_spaces_tenants`
(`id`, `space_id`, `tenant_id`)
VALUES
(1, 1, 1);

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_spaces_virtual_meters`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_spaces_virtual_meters`
(`id`, `space_id`, `virtual_meter_id`)
VALUES
(1, 1, 1);

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_spaces_points`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_spaces_points`
(`id`, `space_id`, `point_id`)
VALUES
(1, 3, 2000001),
(2, 3, 2000002),
(3, 3, 2000003),
(4, 3, 2000006);

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_tariffs`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_tariffs`
(`id`, `name`, `uuid`, `energy_category_id`, `tariff_type`, `unit_of_price`, `valid_from_datetime_utc`, `valid_through_datetime_utc`)
VALUES
(1, '2020TimeOfUse1-6',    '590efb36-8587-42a9-ae6f-c715d21496d6', 1, 'timeofuse', 'USD/kWh', '2019-12-31 16:00:00', '2020-06-30 15:59:59'),
(2, '2020TimeOfUse7-9',    'f5966640-18fc-437a-9efd-cbc0c58b6373', 1, 'timeofuse', 'USD/kWh', '2020-06-30 16:00:00', '2020-09-30 15:59:59'),
(3, '2020TimeOfUse10-12',  '21727a1b-4b27-4186-b72e-db46e6e2d980', 1, 'timeofuse', 'USD/kWh', '2020-09-30 16:00:00', '2020-12-31 15:59:59'),
(4, '2021TimeOfUse1-6',    'fe65e443-0ec2-4a16-823e-2365885e2598', 1, 'timeofuse', 'USD/kWh', '2020-12-31 16:00:00', '2021-06-30 15:59:59'),
(5, '2021TimeOfUse7-9',    'd1285c81-4612-4d7c-9436-ed11b4e7abe4', 1, 'timeofuse', 'USD/kWh', '2021-06-30 16:00:00', '2021-09-30 15:59:59'),
(6, '2021TimeOfUse10-12',  'e6c275b4-47eb-4f5d-bc59-edbe45c2a407', 1, 'timeofuse', 'USD/kWh', '2021-09-30 16:00:00', '2021-12-31 15:59:59'),
(7, '2022TimeOfUse1-6',    'ca359f72-48ad-46a7-82af-cecbe98450e8', 1, 'timeofuse', 'USD/kWh', '2021-12-31 16:00:00', '2022-06-30 15:59:59'),
(8, '2022TimeOfUse7-9',    '9fdda603-0f8f-4452-ad59-c5df54bc35f4', 1, 'timeofuse', 'USD/kWh', '2022-06-30 16:00:00', '2022-09-30 15:59:59'),
(9, '2022TimeOfUse10-12',  'fb0442e7-4d44-4bfd-8b20-cad3f77a2480', 1, 'timeofuse', 'USD/kWh', '2022-09-30 16:00:00', '2022-12-31 15:59:59'),
(10, '2023TimeOfUse1-6',   '3fa6e1f2-7d08-4f5a-bcbf-beb041d569c0', 1, 'timeofuse', 'USD/kWh', '2022-12-31 16:00:00', '2023-06-30 15:59:59'),
(11, '2023TimeOfUse7-9',   '787240fb-1694-403e-a0a7-83d7be1cc0b8', 1, 'timeofuse', 'USD/kWh', '2023-06-30 16:00:00', '2023-09-30 15:59:59'),
(12, '2023TimeOfUse10-12', 'a07fdf76-edcf-4124-96e7-ab733a5a4b70', 1, 'timeofuse', 'USD/kWh', '2023-09-30 16:00:00', '2023-12-31 15:59:59'),
(13, 'Water',  '6fcbc77e-effb-4d43-9b30-77b062435d34', 2, 'timeofuse', 'USD/m³',    '2019-12-31 16:00:00', '2023-12-31 15:59:59'),
(14, 'Natural Gas', '6a4c56ff-b3e1-4555-9b1c-87d05bcfa4d9', 3, 'timeofuse', 'USD/m³',    '2019-12-31 16:00:00', '2023-12-31 15:59:59'),
(15, 'BlockOfUSEElectricity', 'd1b81d2f-d387-43d3-affd-d796b7236b60', 1, 'block',     'USD/kWh', '2019-12-31 16:00:00', '2023-12-31 15:59:59');

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_tariffs_timeofuses`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_tariffs_timeofuses`
(`id`, `tariff_id`, `start_time_of_day`, `end_time_of_day`, `peak_type`, `price`)
VALUES
-- '2020TimeOfUse1-6'
(1,  1, '00:00:00', '05:59:59', 'offpeak', 0.345),
(2,  1, '06:00:00', '07:59:59', 'midpeak', 0.708),
(3,  1, '08:00:00', '10:59:59', 'onpeak', 1.159),
(4,  1, '11:00:00', '17:59:59', 'midpeak', 0.708),
(5,  1, '18:00:00', '20:59:59', 'onpeak', 1.159),
(6,  1, '21:00:00', '21:59:59', 'midpeak', 0.708),
(7,  1, '22:00:00', '23:59:59', 'offpeak', 0.345),
-- '2020TimeOfUse7-9'
(8,  2, '00:00:00', '05:59:59', 'offpeak', 0.345),
(9,  2, '06:00:00', '07:59:59', 'midpeak', 0.708),
(10, 2, '08:00:00', '10:59:59', 'offpeak', 1.159),
(11, 2, '11:00:00', '12:59:59', 'midpeak', 0.708),
(12, 2, '13:00:00', '14:59:59', 'onpeak', 1.159),
(13, 2, '15:00:00', '17:59:59', 'midpeak', 0.708),
(14, 2, '18:00:00', '20:59:59', 'onpeak', 1.159),
(15, 2, '21:00:00', '21:59:59', 'midpeak', 0.708),
(16, 2, '22:00:00', '23:59:59', 'offpeak', 0.345),
-- '2020TimeOfUse10-12'
(17, 3, '00:00:00', '05:59:59', 'offpeak', 0.345),
(18, 3, '06:00:00', '07:59:59', 'midpeak', 0.708),
(19, 3, '08:00:00', '10:59:59', 'onpeak', 1.159),
(20, 3, '11:00:00', '17:59:59', 'midpeak', 0.708),
(21, 3, '18:00:00', '20:59:59', 'onpeak', 1.159),
(22, 3, '21:00:00', '21:59:59', 'midpeak', 0.708),
(23, 3, '22:00:00', '23:59:59', 'offpeak', 0.345),
-- '2021TimeOfUse1-6'
(24, 4, '00:00:00', '05:59:59', 'offpeak', 0.345),
(25, 4, '06:00:00', '07:59:59', 'midpeak', 0.708),
(26, 4, '08:00:00', '10:59:59', 'onpeak', 1.159),
(27, 4, '11:00:00', '17:59:59', 'midpeak', 0.708),
(28, 4, '18:00:00', '20:59:59', 'onpeak', 1.159),
(29, 4, '21:00:00', '21:59:59', 'midpeak', 0.708),
(30, 4, '22:00:00', '23:59:59', 'offpeak', 0.345),
-- '2021TimeOfUse7-9'
(31, 5, '00:00:00', '05:59:59', 'offpeak', 0.345),
(32, 5, '06:00:00', '07:59:59', 'midpeak', 0.708),
(33, 5, '08:00:00', '10:59:59', 'offpeak', 1.159),
(34, 5, '11:00:00', '12:59:59', 'midpeak', 0.708),
(35, 5, '13:00:00', '14:59:59', 'onpeak', 1.159),
(36, 5, '15:00:00', '17:59:59', 'midpeak', 0.708),
(37, 5, '18:00:00', '20:59:59', 'onpeak', 1.159),
(38, 5, '21:00:00', '21:59:59', 'midpeak', 0.708),
(39, 5, '22:00:00', '23:59:59', 'offpeak', 0.345),
-- '2021TimeOfUse10-12'
(40, 6, '00:00:00', '05:59:59', 'offpeak', 0.345),
(41, 6, '06:00:00', '07:59:59', 'midpeak', 0.708),
(42, 6, '08:00:00', '10:59:59', 'onpeak', 1.159),
(43, 6, '11:00:00', '17:59:59', 'midpeak', 0.708),
(44, 6, '18:00:00', '20:59:59', 'onpeak', 1.159),
(45, 6, '21:00:00', '21:59:59', 'midpeak', 0.708),
(46, 6, '22:00:00', '23:59:59', 'offpeak', 0.345),
-- '2022TimeOfUse1-6'
(47, 7, '00:00:00', '05:59:59', 'offpeak', 0.345),
(48, 7, '06:00:00', '07:59:59', 'midpeak', 0.708),
(49, 7, '08:00:00', '10:59:59', 'onpeak', 1.159),
(50, 7, '11:00:00', '17:59:59', 'midpeak', 0.708),
(51, 7, '18:00:00', '20:59:59', 'onpeak', 1.159),
(52, 7, '21:00:00', '21:59:59', 'midpeak', 0.708),
(53, 7, '22:00:00', '23:59:59', 'offpeak', 0.345),
-- '2022TimeOfUse7-9'
(54, 8, '00:00:00', '05:59:59', 'offpeak', 0.345),
(55, 8, '06:00:00', '07:59:59', 'midpeak', 0.708),
(56, 8, '08:00:00', '10:59:59', 'offpeak', 1.159),
(57, 8, '11:00:00', '12:59:59', 'midpeak', 0.708),
(58, 8, '13:00:00', '14:59:59', 'onpeak', 1.159),
(59, 8, '15:00:00', '17:59:59', 'midpeak', 0.708),
(60, 8, '18:00:00', '20:59:59', 'onpeak', 1.159),
(61, 8, '21:00:00', '21:59:59', 'midpeak', 0.708),
(62, 8, '22:00:00', '23:59:59', 'offpeak', 0.345),
-- '2022TimeOfUse10-12'
(63, 9, '00:00:00', '05:59:59', 'offpeak', 0.345),
(64, 9, '06:00:00', '07:59:59', 'midpeak', 0.708),
(65, 9, '08:00:00', '10:59:59', 'onpeak', 1.159),
(66, 9, '11:00:00', '17:59:59', 'midpeak', 0.708),
(67, 9, '18:00:00', '20:59:59', 'onpeak', 1.159),
(68, 9, '21:00:00', '21:59:59', 'midpeak', 0.708),
(69, 9, '22:00:00', '23:59:59', 'offpeak', 0.345),
-- '2023TimeOfUse1-6'
(70, 10, '00:00:00', '05:59:59', 'offpeak', 0.345),
(71, 10, '06:00:00', '07:59:59', 'midpeak', 0.708),
(72, 10, '08:00:00', '10:59:59', 'onpeak', 1.159),
(73, 10, '11:00:00', '17:59:59', 'midpeak', 0.708),
(74, 10, '18:00:00', '20:59:59', 'onpeak', 1.159),
(75, 10, '21:00:00', '21:59:59', 'midpeak', 0.708),
(76, 10, '22:00:00', '23:59:59', 'offpeak', 0.345),
-- '2023TimeOfUse7-9'
(77, 11, '00:00:00', '05:59:59', 'offpeak', 0.345),
(78, 11, '06:00:00', '07:59:59', 'midpeak', 0.708),
(79, 11, '08:00:00', '10:59:59', 'offpeak', 1.159),
(80, 11, '11:00:00', '12:59:59', 'midpeak', 0.708),
(81, 11, '13:00:00', '14:59:59', 'onpeak', 1.159),
(82, 11, '15:00:00', '17:59:59', 'midpeak', 0.708),
(83, 11, '18:00:00', '20:59:59', 'onpeak', 1.159),
(84, 11, '21:00:00', '21:59:59', 'midpeak', 0.708),
(85, 11, '22:00:00', '23:59:59', 'offpeak', 0.345),
-- '2023TimeOfUse10-12'
(86, 12, '00:00:00', '05:59:59', 'offpeak', 0.345),
(87, 12, '06:00:00', '07:59:59', 'midpeak', 0.708),
(88, 12, '08:00:00', '10:59:59', 'onpeak', 1.159),
(89, 12, '11:00:00', '17:59:59', 'midpeak', 0.708),
(90, 12, '18:00:00', '20:59:59', 'onpeak', 1.159),
(91, 12, '21:00:00', '21:59:59', 'midpeak', 0.708),
(92, 12, '22:00:00', '23:59:59', 'offpeak', 0.345),
-- '自来水'
-- 'Water'
(93, 13, '00:00:00', '23:59:59', 'midpeak', 5.95),
-- '天然气'
-- 'Natural Gas'
(94, 14, '00:00:00', '23:59:59', 'midpeak', 3.50);
COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_tariffs_blocks`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_tariffs_blocks`
(`id`, `tariff_id`, `start_amount`, `end_amount`, `price`)
VALUES
-- '分量阶梯电价'
-- 'Block tariff of electrical'
(1, 15, 0, 10000, 0.345),
(2, 15, 10000, 30000, 0.456),
(3, 15, 30000, 100000, 0.567),
(4, 15, 100000, 1000000000, 0.678);

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_stores`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_stores`
(`id`, `name`, `uuid`, `address`, `latitude`, `longitude`, `area`, `store_type_id`, `is_input_counted`, `contact_id`, `cost_center_id`, `description`)
VALUES
(1, 'McDonald\'s (delisu store on Qinian Street)', 'd8a24322-4bab-4ba2-aedc-5d55a84c3db8', 'No. 7, East Damochang Street, Dongcheng District, Beijing', 39.899493, 116.412041, 500.000, 1, 1, 1, 1,  'MacDonalds');
COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_store_types`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_store_types`
(`id`, `name`, `uuid`, `description`, `simplified_code`)
VALUES
(1, 'Restaurant', '494d7d5e-e139-4629-b957-99ea4caf0401', '餐饮', 'RS'),
(2, 'Retail', '1f556579-9d5c-45ce-9bd8-f2dc1d033470', '零售', 'RT'),
(3, 'Hotel', 'cae697aa-ceca-435d-91bf-492b46607eb0', '酒店', 'HT');

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_stores_meters`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_stores_meters`
(`id`, `store_id`, `meter_id`)
VALUES
(1, 1, 1);

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_stores_offline_meters`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_stores_offline_meters`
(`id`, `store_id`, `offline_meter_id`)
VALUES
(1, 1, 1);

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_stores_points`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_stores_points`
(`id`, `store_id`, `point_id`)
VALUES
(1, 3, 2000001),
(2, 3, 2000002),
(3, 3, 2000003),
(4, 3, 2000006);

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_stores_sensors`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_stores_sensors`
(`id`, `store_id`, `sensor_id`)
VALUES
(1, 1, 1);

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_stores_virtual_meters`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_stores_virtual_meters`
(`id`, `store_id`, `virtual_meter_id`)
VALUES
(1, 1, 1);

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_tenants`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_tenants`
(`id`, `name`, `uuid`, `buildings`, `floors`, `rooms`, `area`, `tenant_type_id`, `is_input_counted`, `is_key_tenant`,
   `lease_number`, `lease_start_datetime_utc`, `lease_end_datetime_utc`, `is_in_lease`, `contact_id`, `cost_center_id`, `description`)
VALUES
(1, 'Starbucks星巴克', '6b0da806-a4cd-431a-8116-2915e90aaf8b', 'Building #1', 'L1 L2 L3', '1201b+2247+3F', 418.8, 9, 1, 1,
 '6b0da806',  '2019-12-31 16:00:00', '2022-12-31 16:00:00', 1, 1, 1,  'my description');
COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_tenant_types`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_tenant_types`
(`id`, `name`, `uuid`, `description`, `simplified_code`)
VALUES
(1, 'Food and Beverage', '83fffba1-9e22-4397-a93a-3742772c3753', 'Food and Beverage', 'FNB'),
(2, 'Food and Beverage (Gas)', 'ad95ed16-1c57-49a9-a85e-71e389393089', 'Food and Beverage (Gas)', 'FNBGas'),
(3, 'Food and Beverage (Electrical)', '1dc21e83-4333-40f8-9e25-ea049becba37', 'Food and Beverage (Electrical)', 'FNBElec'),
(4, 'High Illuminance Tenant', '4208a60d-d8e6-4fe5-8cea-a55109e9b397', 'High Illuminance Tenant', 'HighIllu'),
(5, 'Anchor Tenant', 'fc4ae534-544a-4a22-b83b-9f4aa99494aa', 'Anchor Tenant', 'ANCH'),
(6, 'Normal Tenant', '6d1dca30-1cbe-463d-8a78-cdd5e0f8ac8b', 'Normal Tenant', 'Normal'),
(7, 'Other Retail Tenants', '2078e1c0-3936-4ae7-9253-08e0aa1d84b6', 'Other Retail Tenants', 'Other'),
(8, 'Whole Floor Office Tenant', 'b2a580a3-edc9-4838-ae1d-7b7265860a9a', 'Whole Floor Office Tenant', 'WhFlr'),
(9, 'None-Whole Floor Office Tenant', '55bbcba7-d8a0-44a0-9a9f-2f085e3cb044', 'None-Whole Floor Office Tenant', 'NonWhFlr');

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_tenants_meters`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_tenants_meters`
(`id`, `tenant_id`, `meter_id`)
VALUES
(1, 1, 1);

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_tenants_offline_meters`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_tenants_offline_meters`
(`id`, `tenant_id`, `offline_meter_id`)
VALUES
(1, 1, 1);

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_tenants_points`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_tenants_points`
(`id`, `tenant_id`, `point_id`)
VALUES
(1, 3, 2000001),
(2, 3, 2000002),
(3, 3, 2000003),
(4, 3, 2000006);

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_tenants_sensors`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_tenants_sensors`
(`id`, `tenant_id`, `sensor_id`)
VALUES
(1, 1, 1);

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_tenants_virtual_meters`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_tenants_virtual_meters`
(`id`, `tenant_id`, `virtual_meter_id`)
VALUES
(1, 1, 1);

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_virtual_meters`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;

INSERT INTO `myems_system_db`.`tbl_virtual_meters`
(`id`, `name`, `uuid`, `equation`, `energy_category_id`, `is_counted`, `cost_center_id`, `energy_item_id`, `description`)
VALUES
(1, 'Example Virtual Meter', '3fff2cfb-f755-44c8-a919-6135205a8573', 'x1+x2+x3', 1, 1, 1, 1, 'virtual description');

COMMIT;

-- ---------------------------------------------------------------------------------------------------------------------
-- Demo Data for table `myems_system_db`.`tbl_variables`
-- ---------------------------------------------------------------------------------------------------------------------
START TRANSACTION;
USE `myems_system_db`;
-- meter_type = {'meter', 'virtual_meter', 'offline_meter'}
INSERT INTO `myems_system_db`.`tbl_variables`
(`id`, `name`, `virtual_meter_id`, `meter_type`, `meter_id`)
VALUES
(1, 'x1', 1, 'meter', 1),
(2, 'x2', 1, 'meter', 2),
(3, 'x3', 1, 'meter', 3);

COMMIT;

