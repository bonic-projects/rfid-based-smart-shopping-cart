import 'package:shopmate/services/cart_controll_database_service.dart';
import 'package:shopmate/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:shopmate/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:shopmate/ui/views/home/home_view.dart';
import 'package:shopmate/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:shopmate/services/firestore_service.dart';
import 'package:shopmate/services/database_service.dart';
import 'package:shopmate/services/user_service.dart';
import 'package:shopmate/ui/views/login_register/login_register_view.dart';
import 'package:shopmate/ui/views/login/login_view.dart';
import 'package:shopmate/ui/views/register/register_view.dart';
import 'package:shopmate/ui/views/admin/admin_view.dart';
import 'package:shopmate/ui/views/purchases/purchases_view.dart';
import 'package:shopmate/ui/views/controll_cart/controll_cart_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginRegisterView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: RegisterView),
    MaterialRoute(page: AdminView),
    MaterialRoute(page: PurchasesView),
    MaterialRoute(page: ControllCartView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: FirestoreService),
    LazySingleton(classType: DatabaseService),
    LazySingleton(classType: UserService),
    LazySingleton(classType: FirebaseAuthenticationService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: CartControllDatabaseService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
  logger: StackedLogger(),
)
class App {}
