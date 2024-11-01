import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/utility/app_colors.dart';
import 'package:task_manager/ui/widgets/background_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

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
                  "Join with Us",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 40,
                ),
                TextField(
                  controller: _emailTEController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(hintText: "Email"),
                ),
                const SizedBox(
                  height: 10,
                ),TextField(
                  controller: _firstNameTEController,
                  decoration: const InputDecoration(hintText: "First Name"),
                ),
                const SizedBox(
                  height: 10,
                ),TextField(
                  controller: _lastNameTEController,
                  decoration: const InputDecoration(hintText: "Last Name"),
                ),
                const SizedBox(
                  height: 10,
                ),TextField(
                  controller: _mobileTEController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: "Mobile"),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _passwordTEController,
                  decoration: const InputDecoration(hintText: "Password"),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Icon(Icons.arrow_circle_right),
                ),
                const SizedBox(
                  height: 35,
                ),

                _buildBackToSignInSection(),
              ],
            ),
          ),
        ),
      )),
    );
  }

  Widget _buildBackToSignInSection() {
    return Center(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.6),
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.4),
                    text: "Don't have an account? ",
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
  void _onTapSignInButton(){
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
