import 'package:ecom/controller/signin_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignInController(),
      child: Consumer<SignInController>(
        builder: (context, controller, _) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 32),
                        Text(
                          'Sign in to your\nAccount',
                          style: GoogleFonts.dmSans(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff1A1C1E),
                            height: 1.3,
                            letterSpacing: -0.2,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Enter your email and password to log in',
                          style: GoogleFonts.dmSans(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff6C7278),
                            height: 1.4,
                            letterSpacing: -0.1,
                          ),
                        ),
                        const SizedBox(height: 24),
                        _buildLabel('Email'),
                        _buildTextField(
                          hint: 'Loisbecket@gmail.com',
                          controller: controller.emailController,
                        ),
                        const SizedBox(height: 16),
                        _buildLabel('Password'),
                        _buildTextField(
                          hint: '*******',
                          obscure: true,
                          controller: controller.passwordController,
                          controllerState: controller,
                        ),
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forgot Password ?',
                              style: GoogleFonts.dmSans(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xff884B0B),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        _buildGradientButton('Log In', () => controller.login(context)),
                        const SizedBox(height: 16),
                        const Center(child: Text('Or')),
                        const SizedBox(height: 16),
                        _buildSocialButton('Continue with Google', 'assets/images/google.png'),
                        const SizedBox(height: 12),
                        _buildSocialButton('Continue with Facebook', 'assets/images/face.png'),
                        const Spacer(),
                        Center(
                          child: Text.rich(
                            TextSpan(
                              text: "Don’t have an account? ",
                              style: GoogleFonts.dmSans(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff6C7278),
                              ),
                              children: [
                                TextSpan(
                                  text: "Sign Up",
                                  style: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xff884B0B),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                    if (controller.isLoading)
                      const Positioned.fill(
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Color(0xffEFB203),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: GoogleFonts.dmSans(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: const Color(0xff6C7278),
          height: 1.6,
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hint,
    required TextEditingController controller,
    bool obscure = false,
    SignInController? controllerState,
  }) {
    return Container(
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
            spreadRadius: 0,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      alignment: Alignment.centerLeft,
      child: TextField(
        controller: controller,
        obscureText: obscure ? controllerState?.obscurePassword ?? true : false,
        style: GoogleFonts.dmSans(
          fontSize: 14,
          color: const Color(0xFF1A1C1E),
          letterSpacing: -.1,
          height: 1.4,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.dmSans(
            fontSize: 14,
            color: const Color(0xFF1A1C1E),
            letterSpacing: -.1,
            height: 1.4,
            fontWeight: FontWeight.w500,
          ),
          border: InputBorder.none,
          suffixIcon: obscure
              ? IconButton(
                  icon: Icon(
                    controllerState?.obscurePassword ?? true
                        ? Icons.visibility_off
                        : Icons.visibility,
                    size: 16,
                    color: const Color(0xFFACB5BB),
                  ),
                  onPressed: () => controllerState?.togglePasswordVisibility(),
                )
              : null,
        ),
      ),
    );
  }

  Widget _buildGradientButton(String text, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 48,
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
          child: Text(
            text,
            style: GoogleFonts.dmSans(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(String text, String iconPath) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffDADADA)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconPath, height: 20),
          const SizedBox(width: 8),
          Text(
            text,
            style: GoogleFonts.dmSans(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: const Color(0xff1A1C1E),
            ),
          ),
        ],
      ),
    );
  }
}
