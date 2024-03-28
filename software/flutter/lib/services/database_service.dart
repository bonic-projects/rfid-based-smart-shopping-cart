import 'package:firebase_database/firebase_database.dart';
import 'package:shopmate/app/app.logger.dart';
import 'package:shopmate/models/device.dart';
import 'package:stacked/stacked.dart';

class DatabaseService with ListenableServiceMixin {
  final log = getLogger('RealTimeDB_Service');

  final FirebaseDatabase _db = FirebaseDatabase.instance;

  DeviceReading? _node;
  DeviceReading? get node => _node;

  void setupNodeListening() {
    DatabaseReference starCountRef =
        _db.ref('/devices/34KJA0u4EMdle7wfHfGM12mRq4t2/reading');
    log.i("R ${starCountRef.key}");
    try {
      starCountRef.onValue.listen((DatabaseEvent event) {
        log.i("Reading..");
        if (event.snapshot.exists) {
          _node = DeviceReading.fromMap(event.snapshot.value as Map);
          log.v(_node?.rfid); //data['time']
          notifyListeners();
        }
      });
    } catch (e) {
      log.e("Error: $e");
    }
  }

  Future<DeviceData?> getDeviceData() async {
    DatabaseReference dataRef =
        _db.ref('/devices/34KJA0u4EMdle7wfHfGM12mRq4t2/data');
    final value = await dataRef.once();
    if (value.snapshot.exists) {
      return DeviceData.fromMap(value.snapshot.value as Map);
    }
    return null;
  }

  void setDeviceData(DeviceData data) {
    DatabaseReference dataRef =
        _db.ref('/devices/34KJA0u4EMdle7wfHfGM12mRq4t2/data');
    dataRef.update(data.toJson());
  }
}
