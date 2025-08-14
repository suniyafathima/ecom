import 'package:ecom/controller/otp_controller.dart';
import 'package:ecom/core/services/login_api_services.dart';
import 'package:ecom/view/boarding_screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OTPScreen extends StatefulWidget {
  final String email;
  final String prefilledOtp;

  const OTPScreen({
    super.key,
    required this.email,
    required this.prefilledOtp,
  });

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  late OTPController controller;

  @override
  void initState() {
    super.initState();
    controller = OTPController(email: widget.email);
    controller.init(widget.prefilledOtp);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Text(
              "Let’s verify",
              style: GoogleFonts.dmSans(
                fontSize: 32,
                height: 1.3,
                letterSpacing: -0.2,
                fontWeight: FontWeight.w700,
                color: const Color(0xff1A1C1E),
              ),
            ),
            const SizedBox(height: 2),
            Text(
              "Your Google Account",
              style: GoogleFonts.dmSans(
                fontSize: 32,
                height: 1.3,
                letterSpacing: -0.2,
                fontWeight: FontWeight.w700,
                color: const Color(0xff1A1C1E),
              ),
            ),
            const SizedBox(height: 16),
            RichText(
              text: TextSpan(
                style: GoogleFonts.dmSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff6C7278),
                  height: 1.4,
                  letterSpacing: -0.1,
                ),
                children: [
                  const TextSpan(text: "Enter the OTP code we sent to\n "),
                  TextSpan(
                    text: widget.email,
                    style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff6C7278),
                      height: 1.4,
                      letterSpacing: -0.1,
                    ),
                  ),
                  const TextSpan(text: ". Need to "),
                  TextSpan(
                    text: "edit the email",
                    style: GoogleFonts.dmSans(
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.solid,
                      decorationThickness: 1,
                      decorationColor: const Color(0xff6C7278),
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff6C7278),
                      height: 1.4,
                      letterSpacing: -0.1,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // OTP TextField
            Container(
              height: 46,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xffEDF1F3)),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x3DE4E5E7),
                    offset: Offset(0, 1),
                    blurRadius: 2,
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 14),
              alignment: Alignment.centerLeft,
              child: TextField(
                controller: controller.otpController,
                keyboardType: TextInputType.number,
                style: GoogleFonts.dmSans(
                  fontSize: 12,
                  color: const Color(0xff1A1C1E),
                ),
                decoration: InputDecoration(
                  hintText: 'Enter your OTP',
                  hintStyle: GoogleFonts.dmSans(
                    fontSize: 14,
                    color: const Color(0xff6C7278),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Resend code in (00:16)',
                style: GoogleFonts.dmSans(
                  fontSize: 12,
                  color: const Color(0xff884B0B),
                  height: 1.4,
                  letterSpacing: -0.1,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 24),

            ValueListenableBuilder<bool>(
              valueListenable: controller.isLoading,
              builder: (context, loading, _) {
                return GestureDetector(
                  onTap: loading
                      ? null
                      : () async {
                          final isVerified =
                              await controller.verifyOtp(context);
                          if (isVerified || !isVerified) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()),
                            );
                          }
                        },
                  child: Container(
                    height: 48,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xffEFB203),
                          Color(0xffCE8800),
                        ],
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x7A253EA7),
                          offset: Offset(0, 1),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: Center(
                      child: loading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              'Verify OTP',
                              style: GoogleFonts.dmSans(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
