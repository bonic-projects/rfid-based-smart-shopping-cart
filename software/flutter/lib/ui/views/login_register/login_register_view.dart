import 'package:flutter/material.dart';
import 'package:shopmate/ui/common/app_colors.dart';
import 'package:shopmate/ui/common/ui_helpers.dart';
import 'package:shopmate/ui/views/widgets/loginRegister.dart';
import 'package:stacked/stacked.dart';

import 'login_register_viewmodel.dart';

class LoginRegisterView extends StackedView<LoginRegisterViewModel> {
  const LoginRegisterView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginRegisterViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                'assets/logo.png',
                height: 150,
              ),
            ),
            const Text(
              "Shopmate",
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                  color: kcPrimaryColor),
            ),
            verticalSpaceSmall,
            LoginRegisterWidget(
              onLogin: viewModel.openLoginView,
              onRegister: viewModel.openRegisterView,
              loginText: "Existing Doctor",
              registerText: "Doctor registration",
            ),
          ],
        ),
      ),
    );
  }

  @override
  LoginRegisterViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginRegisterViewModel();
}
