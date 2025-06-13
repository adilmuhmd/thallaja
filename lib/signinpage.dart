import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled1/accountcreation.dart';
import 'package:untitled1/homescreen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDF7FB),
      body: SafeArea(
        child: Column(
          children: [
            // Black top section
            SizedBox(
              height: 47,
            ),
            Image.asset(
              'assets/Image Start.png',
              height: 280,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
        
            SizedBox(
              height: 50.5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 29,
                    color: Color(0xFF4A5568),
                    fontWeight: FontWeight.bold, // default text style
                  ),
                  children: [
                    const TextSpan(
                        text:
                            'Your one-stop platform\nfor all '), // line break here
                    TextSpan(
                      text: 'refrigeration needs.',
                      style: TextStyle(
                        color:
                            Color(0xFF0087D0), // blue color for "refrigeration"
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24,),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  OnboardingScreen()),
                );
                // Your onPressed logic
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(361, 52),
                padding: const EdgeInsets.symmetric(horizontal: 16), // Balanced side padding
                backgroundColor: const Color(0xFF232831),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Continue with Mobile',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Rubik',
                    ),
                  ),
                  const SizedBox(width: 12), // Spacing between icon and text
                  SvgPicture.asset(
                    'icons/iphone.svg', // Path to your SVG
                    height: 24,
                    width: 24,
                  ),
                ],
              ),
            ),
            SizedBox(height: 9),

            // Mobile Sign-In Button
            SizedBox(height: 9),
        
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  OnboardingScreen()),
                );
                // Your onPressed logic
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(361, 52),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                backgroundColor: const Color(0xFF0087D0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16), // Use your actual variable
                ),
                elevation: 0, // Remove if you want default elevation
              ),
              child: const Text(
                'Create a account',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16, // Or Variables.HeadingSizeBase
                  fontWeight: FontWeight.w500, // Or Variables.HeadingFontWeight
                  fontFamily: 'Rubik', // Make sure Rubik is added in pubspec.yaml
                ),
              ),
            ),

            SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Container(
                    width: 164.05922,
                    height: 0.96375,
                    color: const Color(0xFFD2DDEA),
                  ),
                ),
                const Text(
                  textAlign: TextAlign.center,
                  'or',
                  style:
                      TextStyle(
                          fontSize: 16,
                          fontFamily: "Rubik",
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF4A5568)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Container(
                    width: 164.05922,
                    height: 0.96375,
                    color: const Color(0xFFD2DDEA),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  OnboardingScreen()),
                );
                // Your onPressed logic
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(361, 52),
                padding: const EdgeInsets.symmetric(horizontal: 16), // Balanced side padding
                backgroundColor: const Color(0xFFFFFFFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/Google.png', // Path to your SVG
                    height: 24,
                    width: 24,
                  ),
                  const SizedBox(width: 12), // Spacing between icon and text
                  const Text(
                    'Continue with Google',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF50585F),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Rubik',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24,),
            RichText(
              textAlign: TextAlign.center, // center if needed
              text: TextSpan(
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: "Rubik",
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF131313), // default text color
                ),
                children: [
                  const TextSpan(
                      text:
                          'By pressing on “Continue with..” you agree to our\n'),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: TextStyle(
                      color: Color(0xFF0087D0), // blue color
                      fontFamily: "Rubik",
                      fontWeight: FontWeight.w400,
                    ),
                    // You can add gesture recognizer for taps here if needed
                  ),
                  const TextSpan(text: ' and '),
                  TextSpan(
                    text: 'Terms and conditions',
                    style: TextStyle(
                      color: Color(0xFF0087D0), // blue color
                      fontFamily: "Rubik",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
        
          ],
        ),
      ),
    );
  }
}
