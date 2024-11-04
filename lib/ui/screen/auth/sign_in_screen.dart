import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/data/models/login_model.dart';
import 'package:task_manager/data/network_caller/network_caller.dart';
import 'package:task_manager/ui/controllers/auth_controller.dart';
import 'package:task_manager/ui/screen/auth/email_verification_screen.dart';
import 'package:task_manager/ui/screen/auth/sign_up_screen.dart';
import 'package:task_manager/ui/screen/main_bottom_nav_screen.dart';
import 'package:task_manager/ui/utility/app_colors.dart';
import 'package:task_manager/ui/widgets/background_widget.dart';
import 'package:task_manager/ui/widgets/snack_bar_message.dart';

import '../../../data/models/network_response.dart';
import '../../../data/utilities/urls.dart';
import '../../utility/app_constants.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _signInApiInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
          child: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      Text(
                        "Get Started with",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        controller: _emailTEController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(hintText: "Email"),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (String? value) {
                          if (value?.trim().isEmpty ?? true) {
                            return "Enter your email";
                          }
                          if (AppConstants.emailRegExp.hasMatch(value!) == false) {
                            return "Enter a valid address";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _passwordTEController,
                        decoration: const InputDecoration(hintText: "Password"),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (String? value) {
                          if (value?.trim().isEmpty ?? true) {
                            return "Enter your password";
                          }

                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Visibility(
                        visible: _signInApiInProgress == false,
                        replacement: const Center(
                          child: CircularProgressIndicator(),
                        ),
                        child: ElevatedButton(
                          onPressed: _onTapNextButton,
                          child: const Icon(Icons.arrow_circle_right),
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      TextButton(
                        onPressed: _onTapForgotPasswordButton,
                        child: const Text(
                          "Password forgotten",
                        ),
                      ),
                      Column(
                        children: [
                          Column(
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6),
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.4),
                                  text: "Don't have an account? ",
                                  children: [
                                    TextSpan(
                                        text: "Sign up",
                                        style: const TextStyle(
                                            color: AppColors.themeColor),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = _onTapSignUpButton),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }

  void _onTapNextButton() {
    if (_formKey.currentState!.validate()) {
      _signUp();
    }
  }

  Future<void> _signUp()async{
    _signInApiInProgress = true;
    if(mounted) {
      setState(() {});
    }
    Map<String,dynamic> requestData = {
      "email":_emailTEController.text.trim(),
      "password":_passwordTEController.text
    };

    final NetworkResponse response =
    await NetworkCaller.postRequest(Urls.login,body: requestData);
    _signInApiInProgress = false;
    if(mounted) {
      setState(() {});
    }


    if (response.isSuccess) {
      LoginModel loginModel =LoginModel.fromJson(response.responseData);
      await AuthController.saveUserAccessToken(loginModel.token!);
      await AuthController.saveUserData(loginModel.userModel!);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MainBottomNavScreen(),
        ),
      );
    } else {
      showSnackBarMessage(
          context, response.errorMessage ?? "Email/Password not correct. try again");
    }
  }

  void _onTapSignUpButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SignUpScreen(),
      ),
    );
  }

  void _onTapForgotPasswordButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EmailVerificationScreen(),
      ),
    );
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
