import 'package:ecom/view/boarding_screens/authentication/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  OnboardingScreenState createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      'image': 'assets/images/Illustration.png',
      'title': 'Welcome to ecom',
      'subtitle': 'Lorem Ipsum is simply dummy text of the printing and typesetting !',
    },
    {
      'image': 'assets/images/Illustration (1).png',
      'title': 'Lorem Ipsum is simply dummy text of the printing !',
      'subtitle': 'Lorem Ipsum is simply dummy text of the printing and typesetting !',
    },
    {
      'image': 'assets/images/Illustration (2).png',
      'title': 'It is a long established fact',
      'subtitle': 'Lorem Ipsum is simply dummy text of the printing and typesetting !',
    },
  ];

  void nextPage() {
  if (currentPage < onboardingData.length - 1) {
    _pageController.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  } else {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignInScreen()),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemCount: onboardingData.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  // Image Positioned
                  Positioned(
                    top: 170,
                    left: 49,
                    child: Image.asset(
                      onboardingData[index]['image']!,
                      width: 294.43,
                      height: 267.16,
                      fit: BoxFit.contain,
                    ),
                  ),
    
                  // Text Positioned
                  Positioned(
                    top: 478,
                    left: 49,
                    child: SizedBox(
                      width: 295,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            onboardingData[index]['title']!,
                            style: GoogleFonts.dmSans(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff2D2B2E),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 12),
                          Text(
                            onboardingData[index]['subtitle']!,
                           style: GoogleFonts.dmSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff2D2B2E),
                          ),
                           textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
    
                  // Skip / Dots / Next
                  Positioned(
                    top: 754,
                    left: 45,
                    child: SizedBox(
                      width: 303,
                      height: 48,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Skip",
                              style: GoogleFonts.dmSans(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: Color(0xff2D2B2E).withAlpha(65),
                              ),
                            ),
                          ),
                          Row(
                            children: List.generate(
                              onboardingData.length,
                              (index) => Container(
                                margin: EdgeInsets.symmetric(horizontal: 4),
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: currentPage == index ? Colors.black : Colors.grey,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: nextPage,
                            child: Text(
                              "Next",
                              style: GoogleFonts.dmSans(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: Color(0xff2D2B2E),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
