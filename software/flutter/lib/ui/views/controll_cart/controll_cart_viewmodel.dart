import 'package:shopmate/app/app.locator.dart';
import 'package:shopmate/models/cart_control.dart';
import 'package:shopmate/services/cart_controll_database_service.dart';
import 'package:stacked/stacked.dart';

class ControllCartViewModel extends ReactiveViewModel {
    final _deviceDatabaseService = locator<CartControllDatabaseService>();


  @override
  List<ListenableServiceMixin> get listenableServices =>
      [_deviceDatabaseService];

  void onModelReady() {
    _deviceDatabaseService.setDeviceData(DeviceMovement(direction: 's'));
    
  }

  void isBoatMovement(String value) {
    _deviceDatabaseService.setDeviceData(DeviceMovement(
      direction: value,
    ));
  }
}
