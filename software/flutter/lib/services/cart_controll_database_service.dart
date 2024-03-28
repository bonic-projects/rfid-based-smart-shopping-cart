import 'package:firebase_database/firebase_database.dart';
import 'package:shopmate/app/app.logger.dart';
import 'package:shopmate/models/cart_control.dart';
import 'package:stacked/stacked.dart';

const dbCode = 'XFT0Hyr6GrYzASiOh4jkGLOo89k2';

class CartControllDatabaseService with ListenableServiceMixin {
  final log = getLogger('AdminViewModel');
  final FirebaseDatabase _db = FirebaseDatabase.instance;

  DeviceMovement? _node;
  DeviceMovement? get node => _node;

  void setUpNodeListening() {
    DatabaseReference startCountRef = _db.ref('/devices/$dbCode/signal');

    try {
      startCountRef.onValue.listen((DatabaseEvent event) {
        if (event.snapshot.exists) {
          _node = DeviceMovement.fromMap(event.snapshot.value as Map);
          notifyListeners();
        }
      });
    } catch (e) {
      log.e(e);
    }
  }

  void setDeviceData(DeviceMovement data) {
    DatabaseReference dataRef = _db.ref('/devices/$dbCode/signal');

    dataRef.update(data.toJson());

    //dataRef.update(data.toJson());
    //print(data.direction);
  }
}
