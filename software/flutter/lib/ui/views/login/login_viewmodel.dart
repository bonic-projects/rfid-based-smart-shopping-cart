import 'package:shopmate/app/app.locator.dart';
import 'package:shopmate/app/app.logger.dart';
import 'package:shopmate/app/app.router.dart';
import 'package:shopmate/models/appuser.dart';
import 'package:shopmate/services/user_service.dart';
import 'package:shopmate/ui/views/login/login_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends FormViewModel {
  final log = getLogger('LoginViewModel');

  final FirebaseAuthenticationService _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();
  final _snackBarService = locator<SnackbarService>();

  void onModelReady() {}

  void authenticateUser() async {
    if (isFormValid && emailValue != null && passwordValue != null) {
      setBusy(true);
      log.i("email and pass valid");
      log.i(emailValue!);
      log.i(passwordValue!);
      FirebaseAuthenticationResult result =
          await _firebaseAuthenticationService.loginWithEmail(
        email: emailValue!,
        password: passwordValue!,
      );
      if (result.user != null) {
        AppUser? user = await _userService.fetchUser();
        if (user != null && user.userRole == "user") {
          _navigationService.pushNamedAndRemoveUntil(Routes.homeView);
        } else if (user != null) {
          _navigationService.pushNamedAndRemoveUntil(Routes.adminView);
        }
      } else {
        log.e("Error: ${result.errorMessage}");

        _snackBarService.showSnackbar(
            message:
                "Error: ${result.errorMessage ?? "Enter valid credentials"}");
      }
    }
    setBusy(false);
  }
}
