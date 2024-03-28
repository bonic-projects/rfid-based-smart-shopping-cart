import 'package:shopmate/app/app.locator.dart';
import 'package:shopmate/app/app.logger.dart';
import 'package:shopmate/models/purchase.dart';
import 'package:shopmate/services/firestore_service.dart';
import 'package:stacked/stacked.dart';

class PurchasesViewModel extends StreamViewModel<List<Purchase>> {
  final log = getLogger('AdminViewModel');

  final _firestoreService = locator<FirestoreService>();

  @override
  Stream<List<Purchase>> get stream => _firestoreService.getAllPurchases();
}
