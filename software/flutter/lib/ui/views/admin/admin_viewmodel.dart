import 'package:flutter/material.dart';
import 'package:shopmate/app/app.dialogs.dart';
import 'package:shopmate/app/app.locator.dart';
import 'package:shopmate/app/app.logger.dart';
import 'package:shopmate/app/app.router.dart';
import 'package:shopmate/models/appuser.dart';
import 'package:shopmate/models/device.dart';
import 'package:shopmate/models/product.dart';
import 'package:shopmate/services/database_service.dart';
import 'package:shopmate/services/firestore_service.dart';
import 'package:shopmate/services/user_service.dart';
import 'package:shopmate/ui/views/admin/admin_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AdminViewModel extends StreamViewModel<List<Product>> {
  final log = getLogger('AdminViewModel');
  final _dialogService = locator<DialogService>();

  // final _snackBarService = locator<SnackbarService>();
  final _navigationService = locator<NavigationService>();
  final _dbService = locator<DatabaseService>();
  final _userService = locator<UserService>();
  final _firestoreService = locator<FirestoreService>();

  AppUser? get user => _userService.user;

  void logout() {
    _userService.logout();
    _navigationService.replaceWithLoginRegisterView();
  }

  DeviceReading? get node => _dbService.node;

  @override
  List<DatabaseService> get listenableServices => [_dbService];

  @override
  Stream<List<Product>> get stream => _firestoreService.getAllProducts();

  //Device data
  DeviceData _deviceData = DeviceData(l1: "", l2: "");

  DeviceData get deviceData => _deviceData;

  void setDeviceData() {
    _dbService.setDeviceData(_deviceData);
  }

  final bool _isShopping = false;

  bool get isShopping => _isShopping;

  void getDeviceData() async {
    setBusy(true);
    DeviceData? deviceData = await _dbService.getDeviceData();
    if (deviceData != null) {
      _deviceData = DeviceData(
        l1: deviceData.l1,
        l2: deviceData.l2,
      );
    } else {
      _deviceData = DeviceData(l1: "", l2: "");
    }
    setBusy(false);
  }

  void setMessageLine1(String value) {
    _deviceData.l1 = value;
    notifyListeners();
    setDeviceData();
  }

  void setMessageLine2(String value) {
    _deviceData.l2 = value;
    notifyListeners();
    setDeviceData();
  }

  void showAddProductBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => ProductAddBottomSheet(
        rfid: node?.rfid ?? "",
        onProductAdded: (product) async {
          // Handle the newly added product here
          bool success = await _firestoreService.addProduct(product);
          if (success) {
            log.i('Repair added to service successfully');
            showDialog(title: "Success", description: "Product added!");
          } else {
            showDialog(title: "Error", description: "Please try again!");
            log.e('Failed to add repair to service');
          } // You can use the product data as needed, e.g., add it to Firestore
        },
      ),
    );
  }

  void showDialog({required String title, required String description}) {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: title,
      description: description,
    );
  }

  void openPurchaseView() {
    _navigationService.navigateToPurchasesView();
  }

  void openCartControlView() {
    _navigationService.navigateToControllCartView();
  }
}
