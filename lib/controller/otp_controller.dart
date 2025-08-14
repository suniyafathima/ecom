import 'package:ecom/core/services/login_api_services.dart';
import 'package:flutter/material.dart';

class OTPController {
  final String email;
  final TextEditingController otpController = TextEditingController();
  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  OTPController({required this.email});

  void init(String prefilledOtp) {
    otpController.text = prefilledOtp;
  }

  Future<bool> verifyOtp(BuildContext context) async {
    final otp = otpController.text.trim();

    if (otp.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter the OTP")),
      );
      return false;
    }

    isLoading.value = true;

    final isVerified = await LoginApiService.verifyOtp(
      email: email,
      otp: otp,
    );

    isLoading.value = false;

    if (!isVerified) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid OTP. Please try again.")),
      );
    }

    return isVerified;
  }

  void dispose() {
    otpController.dispose();
    isLoading.dispose();
  }
}
