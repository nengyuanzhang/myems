'use strict';

app.controller('StoreController', function(
    $scope,
    $window,
    $translate,
    $uibModal,
    CostCenterService,
    ContactService,
    StoreService,
    StoreTypeService,
    toaster,
    SweetAlert) {
	$scope.cur_user = JSON.parse($window.localStorage.getItem("myems_admin_ui_current_user"));
	$scope.getAllCostCenters = function() {
		CostCenterService.getAllCostCenters(function (response) {
			if (angular.isDefined(response.status) && response.status === 200) {
				$scope.costcenters = response.data;
			} else {
				$scope.costcenters = [];
			}
		});
	};

	$scope.getAllContacts = function() {
		ContactService.getAllContacts(function (response) {
			if (angular.isDefined(response.status) && response.status === 200) {
				$scope.contacts = response.data;
			} else {
				$scope.contacts = [];
			}
		});
	};

	$scope.getAllStores = function() {
		StoreService.getAllStores(function (response) {
			if (angular.isDefined(response.status) && response.status === 200) {
				$scope.stores = response.data;
			} else {
				$scope.stores = [];
			}
		});
	};

    $scope.getAllStoreTypes = function() {
        StoreTypeService.getAllStoreTypes(function (response) {
            if (angular.isDefined(response.status) && response.status === 200) {
                $scope.storetypes = response.data;
            } else {
                $scope.storetypes = [];
            }
        });
    };

	$scope.addStore = function() {
		var modalInstance = $uibModal.open({
			templateUrl: 'views/settings/store/store.model.html',
			controller: 'ModalAddStoreCtrl',
			windowClass: "animated fadeIn",
			resolve: {
				params: function() {
					return {
						stores:angular.copy($scope.stores),
						storetypes: angular.copy($scope.storetypes),
						costcenters: angular.copy($scope.costcenters),
						contacts: angular.copy($scope.contacts),
					};
				}
			}
		});
		modalInstance.result.then(function(store) {
	    	store.store_type_id=store.store_type.id;
			store.cost_center_id=store.cost_center.id;
			store.contact_id=store.contact.id;
			if (angular.isDefined(store.is_input_counted) == false) {
				store.is_input_counted = false;
			}
			let headers = { "User-UUID": $scope.cur_user.uuid, "Token": $scope.cur_user.token };
			StoreService.addStore(store, headers, function(response) {
				if (angular.isDefined(response.status) && response.status === 201) {
					toaster.pop({
						type: "success",
						title: $translate.instant("TOASTER.SUCCESS_TITLE"),
						body: $translate.instant("TOASTER.SUCCESS_ADD_BODY", {template: $translate.instant("COMMON.STORE")}),
						showCloseButton: true,
					});
					$scope.$emit('handleEmitStoreChanged');
				} else {
					toaster.pop({
						type: "error",
						title: $translate.instant("TOASTER.ERROR_ADD_BODY", { template: $translate.instant("COMMON.STORE") }),
						body: $translate.instant(response.data.description),
						showCloseButton: true,
					});
				}
			});
		}, function() {

		});
	};

	$scope.editStore = function(store) {
		var modalInstance = $uibModal.open({
			windowClass: "animated fadeIn",
			templateUrl: 'views/settings/store/store.model.html',
			controller: 'ModalEditStoreCtrl',
			resolve: {
				params: function() {
					return {
						store: angular.copy(store),
						storetypes:angular.copy($scope.storetypes),
						costcenters:angular.copy($scope.costcenters),
						contacts:angular.copy($scope.contacts)
					};
				}
			}
		});

		modalInstance.result.then(function(modifiedStore) {
	    	modifiedStore.store_type_id=modifiedStore.store_type.id;
			modifiedStore.cost_center_id=modifiedStore.cost_center.id;
			modifiedStore.contact_id=modifiedStore.contact.id;
			if (angular.isDefined(store.is_input_counted) == false) {
				store.is_input_counted = false;
			}
			let headers = { "User-UUID": $scope.cur_user.uuid, "Token": $scope.cur_user.token };
			StoreService.editStore(modifiedStore, headers, function(response) {
				if (angular.isDefined(response.status) && response.status === 200) {
					toaster.pop({
						type: "success",
						title: $translate.instant("TOASTER.SUCCESS_TITLE"),
						body: $translate.instant("TOASTER.SUCCESS_UPDATE_BODY", {template: $translate.instant("COMMON.STORE")}),
						showCloseButton: true,
					});
					$scope.$emit('handleEmitStoreChanged');
				} else {
					toaster.pop({
						type: "error",
						title: $translate.instant("TOASTER.ERROR_UPDATE_BODY", {template: $translate.instant("COMMON.STORE")}),
						body: $translate.instant(response.data.description),
						showCloseButton: true,
					});
				}
			});
		}, function() {
			//do nothing;
		});
	};

	$scope.deleteStore=function(store){
		SweetAlert.swal({
		        title: $translate.instant("SWEET.TITLE"),
		        text: $translate.instant("SWEET.TEXT"),
		        type: "warning",
		        showCancelButton: true,
		        confirmButtonColor: "#DD6B55",
		        confirmButtonText: $translate.instant("SWEET.CONFIRM_BUTTON_TEXT"),
		        cancelButtonText: $translate.instant("SWEET.CANCEL_BUTTON_TEXT"),
		        closeOnConfirm: true,
		        closeOnCancel: true },
		    function (isConfirm) {
		        if (isConfirm) {
					let headers = { "User-UUID": $scope.cur_user.uuid, "Token": $scope.cur_user.token };
		            StoreService.deleteStore(store, headers, function(response) {
		            	if (angular.isDefined(response.status) && response.status === 204) {
							toaster.pop({
								type: "success",
								title: $translate.instant("TOASTER.SUCCESS_TITLE"),
								body: $translate.instant("TOASTER.SUCCESS_DELETE_BODY", {template: $translate.instant("COMMON.STORE")}),
								showCloseButton: true,
							});
							$scope.$emit('handleEmitStoreChanged');
						}else {
							toaster.pop({
								type: "error",
								title: $translate.instant("TOASTER.ERROR_DELETE_BODY", {template: $translate.instant("COMMON.STORE")}),
								body: $translate.instant(response.data.description),
								showCloseButton: true,
							});
		            	}
		            });
		        }
		    });
	};
	$scope.getAllStores();
	$scope.getAllStoreTypes();
	$scope.getAllCostCenters();
	$scope.getAllContacts();
	$scope.$on('handleBroadcastStoreChanged', function(event) {
  		$scope.getAllStores();
	});
});

app.controller('ModalAddStoreCtrl', function($scope, $uibModalInstance,params) {

	$scope.operation = "SETTING.ADD_STORE";
	$scope.storetypes=params.storetypes;
	$scope.costcenters=params.costcenters;
	$scope.contacts=params.contacts;
	$scope.ok = function() {
		$uibModalInstance.close($scope.store);
	};

    $scope.cancel = function() {
		$uibModalInstance.dismiss('cancel');
	};
});

app.controller('ModalEditStoreCtrl', function($scope, $uibModalInstance, params) {
	$scope.operation = "SETTING.EDIT_STORE";
	$scope.store = params.store;
	$scope.storetypes=params.storetypes;
	$scope.costcenters=params.costcenters;
	$scope.contacts=params.contacts;
	$scope.ok = function() {
		$uibModalInstance.close($scope.store);
	};

	$scope.cancel = function() {
		$uibModalInstance.dismiss('cancel');
	};
});
