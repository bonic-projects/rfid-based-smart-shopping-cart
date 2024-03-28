import 'package:shopmate/models/appuser.dart';
import 'package:shopmate/services/database_service.dart';
import 'package:shopmate/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:shopmate/app/app.locator.dart';
import 'package:shopmate/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _databaseService = locator<DatabaseService>();
  final _userService = locator<UserService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    _databaseService.setupNodeListening();
    await Future.delayed(const Duration(seconds: 3));

    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic

    if (_userService.hasLoggedInUser) {
      AppUser? user = await _userService.fetchUser();
      if (user != null && user.userRole == "user") {
        _navigationService.replaceWithHomeView();
      } else if (user != null) {
        _navigationService.replaceWithAdminView();
      } else {
        _navigationService.replaceWithLoginRegisterView();
      }
    } else {
      await Future.delayed(const Duration(seconds: 1));
      _navigationService.replaceWithLoginRegisterView();
    }
  }
}
