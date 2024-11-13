import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screen/auth/pin_verification_screen.dart';
import 'package:task_manager/ui/screen/auth/sign_in_screen.dart';
import 'package:task_manager/ui/screen/auth/sign_up_screen.dart';
import 'package:task_manager/ui/utility/app_colors.dart';
import 'package:task_manager/ui/widgets/background_widget.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() =>
      _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _confirmPasswordTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
          child: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 60,
                ),
                Text(
                  "Set Password",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  "Minimum length password 8 character with Latter and number combination",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  height: 40,
                ),
                TextField(
                  controller: _passwordTEController,
                  decoration: const InputDecoration(hintText: "Password"),
                ),
                const SizedBox(
                  height: 10,
                ), TextField(
                  controller: _confirmPasswordTEController,
                  decoration: const InputDecoration(hintText: "Confirm Password"),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: _onTapConfirmButton,
                  child: const Text("Confirm"),
                ),
                const SizedBox(
                  height: 35,
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.4),
                    text: "have account? ",
                    children: [
                      TextSpan(
                          text: "Sign in",
                          style: const TextStyle(color: AppColors.themeColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = _onTapSignInButton),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  void _onTapSignInButton() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => SignInScreen()),
            (route) => false);
  }

  void _onTapConfirmButton() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => SignInScreen()),
            (route) => false);
  }

  @override
  void dispose() {
    _passwordTEController.dispose();
    _confirmPasswordTEController.dispose();
    super.dispose();
  }
}
