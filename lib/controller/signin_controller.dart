import 'dart:convert';
import 'package:ecom/core/services/login_api_services.dart';
import 'package:ecom/view/boarding_screens/authentication/otp_screen.dart';
import 'package:flutter/material.dart';

class SignInController extends ChangeNotifier {
  bool obscurePassword = true;
  bool isLoading = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  Future<void> login(BuildContext context) async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Please enter email and password')));
      return;
    }

    isLoading = true;
    notifyListeners();

    final loginResponse = await LoginApiService.login(email: email, password: password);

    isLoading = false;
    notifyListeners();

    if (loginResponse != null) {
      final Map<String, dynamic> result = jsonDecode(loginResponse);
      final accessToken = result['access_token'];

      // Request OTP
      final otpData = await LoginApiService.requestOtp(
        email: email,
        accessToken: accessToken, // optional
      );

      if (otpData != null && otpData['status'] == true) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OTPScreen(
              email: email,
              prefilledOtp: otpData['otp'].toString(),
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Failed to send OTP.')));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Login failed. Check your credentials.')));
    }
  }
}

