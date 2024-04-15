import 'package:shopmate/app/app.locator.dart';
import 'package:shopmate/services/database_service.dart';
import 'package:stacked/stacked.dart';

import '../../../models/device.dart';

class ControllCartViewModel extends ReactiveViewModel {
    final _deviceDatabaseService = locator<DatabaseService>();


  @override
  List<ListenableServiceMixin> get listenableServices =>
      [_deviceDatabaseService];


  void onModelReady() {
    _deviceDatabaseService.setDeviceData(DeviceData(direction: 's', l1: 'Movement Control', l2: ''));
  }

  void isBoatMovement(String value) {
    _deviceDatabaseService.setDeviceData(DeviceData(
      direction: value, l1: 'Moving Direction', l2: value,
    ));
  }
}
