'use strict';

app.controller('StoreWorkingCalendarController', function(
    $scope ,
    $window,
    $timeout,
    $translate,
    StoreService,
    WorkingCalendarService,
    StoreWorkingCalendarService, toaster,SweetAlert) {
    $scope.stores = [];
    $scope.currentStoreID = 1;
    $scope.storeworkingcalendars = [];
    $scope.cur_user = JSON.parse($window.localStorage.getItem("myems_admin_ui_current_user"));

    $scope.changeStore=function(item,model){
      $scope.currentStore=item;
      $scope.currentStore.selected=model;
      $scope.getWorkingCalendarsByStoreID($scope.currentStore.id);
    };

  $scope.getAllStores = function(id) {
		StoreService.getAllStores(function (response) {
			if (angular.isDefined(response.status) && response.status === 200) {
				$scope.stores = response.data;
				} else {
				$scope.stores = [];
			 }
		});
	};

	$scope.getWorkingCalendarsByStoreID = function(id) {
		$scope.storeworkingcalendars=[];
      StoreWorkingCalendarService.getWorkingCalendarsByStoreID(id, function (response) {
            if (angular.isDefined(response.status) && response.status === 200) {
              $scope.storeworkingcalendars = response.data;
            }
      });
	};

	$scope.getAllWorkingCalendars = function() {
		WorkingCalendarService.getAllWorkingCalendars(function (response) {
			if (angular.isDefined(response.status) && response.status === 200) {
				$scope.workingcalendars = response.data;
			} else {
				$scope.workingcalendars = [];
			}
		});

	};

	$scope.pairWorkingCalendar=function(dragEl,dropEl){
		var workingcalendarid=angular.element('#'+dragEl).scope().workingcalendar.id;
    var storeid = $scope.currentStore.id;
    let headers = { "User-UUID": $scope.cur_user.uuid, "Token": $scope.cur_user.token };
		StoreWorkingCalendarService.addPair(storeid, workingcalendarid, headers, function (response) {
			if (angular.isDefined(response.status) && response.status === 201) {
					toaster.pop({
						type: "success",
						title: $translate.instant("TOASTER.SUCCESS_TITLE"),
						body: $translate.instant("TOASTER.BIND_WORKING_CALENDAR_SUCCESS"),
						showCloseButton: true,
					});
					$scope.getWorkingCalendarsByStoreID(storeid);
				} else {
          toaster.pop({
              type: "error",
              title: $translate.instant(response.data.title),
              body: $translate.instant(response.data.description),
              showCloseButton: true,
          });
				}
		});
	};

	$scope.deleteWorkingCalendarPair=function(dragEl,dropEl){
		if(angular.element('#'+dragEl).hasClass('source')){
			return;
        }
        var storeworkingcalendarid = angular.element('#' + dragEl).scope().storeworkingcalendar.id;
        var storeid = $scope.currentStore.id;
        let headers = { "User-UUID": $scope.cur_user.uuid, "Token": $scope.cur_user.token };
        StoreWorkingCalendarService.deletePair(storeid, storeworkingcalendarid, headers, function (response) {
            if (angular.isDefined(response.status) && response.status === 204) {
                toaster.pop({
                    type: "success",
                    title: $translate.instant("TOASTER.SUCCESS_TITLE"),
                    body: $translate.instant("TOASTER.UNBIND_WORKING_CALENDAR_SUCCESS"),
                    showCloseButton: true,
                });
                $scope.getWorkingCalendarsByStoreID(storeid);
            } else {
                toaster.pop({
                    type: "error",
                    title: $translate.instant(response.data.title),
                    body: $translate.instant(response.data.description),
                    showCloseButton: true,
                });
            }
		});
	};

    $scope.getAllStores();
    $scope.getAllWorkingCalendars();

	$scope.$on('handleBroadcastStoreChanged', function(event) {
    $scope.storeworkingcalendars = [];
    $scope.getAllStores();
	});

});
