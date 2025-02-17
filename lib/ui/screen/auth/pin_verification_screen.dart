import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager/ui/screen/auth/reset_password_screen.dart';
import 'package:task_manager/ui/screen/auth/sign_in_screen.dart';
import 'package:task_manager/ui/screen/auth/sign_up_screen.dart';
import 'package:task_manager/ui/utility/app_colors.dart';
import 'package:task_manager/ui/widgets/background_widget.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key});

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  final TextEditingController _pinTEController = TextEditingController();

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
                  "Pin Verification",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  "A 6 digits verification pin has been sent to your email address",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  height: 40,
                ),
                buildPinCodeTextField(),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: _onTapVerifyOtpButton,
                  child: const Text("Verify"),
                ),
                const SizedBox(
                  height: 35,
                ),
                _buildSignInSection(),
              ],
            ),
          ),
        ),
      )),
    );
  }

  Widget _buildSignInSection() {
    return Center(
      child: RichText(
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
                recognizer: TapGestureRecognizer()..onTap = _onTapSignInButton),
          ],
        ),
      ),
    );
  }

  Widget buildPinCodeTextField() {
    return PinCodeTextField(
      length: 6,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50,
          fieldWidth: 40,
          activeFillColor: Colors.white,
          selectedFillColor: Colors.white,
          inactiveFillColor: Colors.white,
          selectedColor: AppColors.themeColor),
      animationDuration: const Duration(milliseconds: 300),
      keyboardType: TextInputType.number,
      backgroundColor: Colors.transparent,
      enableActiveFill: true,
      controller: _pinTEController,
      appContext: context,
    );
  }

  void _onTapSignInButton() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => SignInScreen()),
        (route) => false);
  }
  void _onTapVerifyOtpButton() {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResetPasswordScreen())
    );
  }

  @override
  void dispose() {
    _pinTEController.dispose();
    super.dispose();
  }
}
