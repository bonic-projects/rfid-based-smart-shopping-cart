import 'package:flutter/material.dart';
import 'package:shopmate/app/validators.dart';
import 'package:shopmate/ui/common/app_colors.dart';
import 'package:shopmate/ui/common/ui_helpers.dart';
import 'package:shopmate/ui/views/login/login_view.form.dart';
import 'package:shopmate/ui/views/widgets/customButton.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'login_viewmodel.dart';

@FormView(fields: [
  FormTextField(
    name: 'email',
    validator: FormValidators.validateEmail,
  ),
  FormTextField(
    name: 'password',
    validator: FormValidators.validatePassword,
  ),
])
class LoginView extends StackedView<LoginViewModel> with $LoginView {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
              // const Text(
              //   "Login",
              //   style: TextStyle(
              //     fontSize: 32,
              //     fontWeight: FontWeight.w900,
              //   ),
              // ),
              Form(
                // key: F,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 350,
                        ),
                        child: TextField(
                          autofocus: true,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            errorText: viewModel.emailValidationMessage,
                            errorMaxLines: 2,
                          ),
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          focusNode: emailFocusNode,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 350,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Password',
                            errorText: viewModel.passwordValidationMessage,
                            errorMaxLines: 2,
                          ),
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          focusNode: passwordFocusNode,
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        onTap: viewModel.authenticateUser,
                        text: 'Login',
                        isLoading: viewModel.isBusy,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();

  @override
  void onViewModelReady(LoginViewModel viewModel) {
    syncFormWithViewModel(viewModel);
    viewModel.onModelReady();
  }

  @override
  void onDispose(LoginViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }
}
