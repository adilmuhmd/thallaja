import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'homescreen.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentStep = 0;
  final _phoneController = TextEditingController(text: '');
  final _otpController = TextEditingController();
  final _nameController = TextEditingController();
  final _companyController = TextEditingController();

  void updateStep(int step) {
    setState(() {
      _currentStep = step;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 0.0,right: 0),
            child: Container(
              width: 40,
              height: 40,
              padding: const EdgeInsets.all(10), // Matches: padding(start = 10.dp, top = 10.dp, ...)
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF), // White background
                borderRadius: BorderRadius.circular(16), // Replace with Variables.CornerLarge if defined
                border: Border.all(
                  color: const Color(0xFFCED4DA), // Matches Figma border color
                  width: 1,
                ),
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  if (_currentStep > 0) {
                    setState(() {
                      _currentStep--;
                    });
                  }
                },
                splashRadius: 20,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(), // Removes default IconButton size constraints
              ),
            ),
        
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
      ),


      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Progress Bar
                      SizedBox(height: 16),
                      SegmentedProgressBar(
                        totalSteps: 3,
                        currentStep: _currentStep,
                        gapWidth: 8,
                        height: 8,
                        fillColor: Color(0xFF0087D0),
                        backgroundColor: Colors.grey[300]!,
                      ),

                      SizedBox(height: 28),
                      if (_currentStep == 0) ...[
                        Text(
                          "What's your mobile number?",
                          style: TextStyle(
                              fontSize: 24,
                            fontFamily: "Rubik",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "We'll use it to keep your account secure, safe and seamless login.",
                          style: TextStyle(fontSize: 16,
                              color: Color((0xFF6D7579)),
                            fontFamily: "Rubik",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 32),
                        Row(
                          children: [
                            Container(
                              width: 116,
                              height: 52,
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFFFFF),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: const Color(0xFFCAD5E2),
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      // Replace with your actual flag asset or SVG
                                      SvgPicture.asset(
                                        'icons/uaeflag.svg',
                                        width: 24,
                                        height: 16,
                                        fit: BoxFit.cover,
                                      ),
                                      const SizedBox(width: 8),
                                      const Text(
                                        '+971',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "Rubik",
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF232831),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Icon(
                                    Icons.keyboard_arrow_down_sharp,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 8,right: 8),
                              child: Container(
                                width: 237,
                                height: 52,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 16,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF4F6F8),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: const TextField(
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '05xxxxxxx',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    isDense: true, // Reduces vertical padding
                                    contentPadding: EdgeInsets.zero, // Avoid double padding
                                  ),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),

                        SizedBox(height: 100), // Spacer for button
                      ] else if (_currentStep == 1) ...[
                        Text(
                          "Confirm your number",
                          style: TextStyle(fontSize: 24,
                              fontFamily: "Rubik",
                              fontWeight: FontWeight.w700,
                            color: Color(0xFF232831)
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Enter the code we sent over SMS to +971 5880325",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Rubik",
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF6D7579)),
                        ),
                        SizedBox(height: 32),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(4, (index) {
                            final focusNode = FocusNode(); // Create a FocusNode for each TextField
                            return StatefulBuilder(
                              builder: (context, setState) {
                                // Listen to focus changes to update the container's border
                                focusNode.addListener(() {
                                  setState(() {});
                                });
                                return Container(
                                  width: 84.25,
                                  height: 92,
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF7F9FC), // Light background for modern look
                                    borderRadius: BorderRadius.circular(12), // Slightly reduced radius
                                    border: Border.all(
                                      color: focusNode.hasFocus ? Color(0xFF019DDC) : Color(0xFFF7F9FC), // Dynamic border color
                                      width: 4, // Slightly thicker border for emphasis
                                    ),
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //     color: Colors.black.withOpacity(0.05), // Subtle shadow
                                    //     blurRadius: 8,
                                    //     offset: Offset(0, 2),
                                    //     spreadRadius: 1,
                                    //   ),
                                    // ],
                                  ),
                                  child: TextField(
                                    showCursor: true, // Explicitly hide cursor
                                    cursorColor: Colors.black45, // Ensure no cursor color
                                    controller: index == 3 ? _otpController : null,
                                    focusNode: focusNode, // Assign FocusNode
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    maxLength: 1,
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontFamily: "Rubik",
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF232831),
                                    ),
                                    decoration: const InputDecoration(
                                      counterText: '',
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                    ),
                                    onChanged: (value) {
                                      if (value.isNotEmpty && index < 3) {
                                        FocusScope.of(context).nextFocus();
                                      }
                                    },
                                  ),
                                );
                              },
                            );
                          }),
                        ),
                        SizedBox(height: 32),
                        Text("Didn't get the code?", style: TextStyle(
                          fontFamily: "Rubik",
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xFF232831)
                        )
                        ),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(fontSize: 14),
                            children: [
                              TextSpan(
                                text: '30s',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "Rubik",
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF0087D0)), // your chosen color for "30s"
                              ),
                              TextSpan(
                                text: ' before you can resend',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "Rubik",
                                    fontWeight: FontWeight.w400,
                                    color: Color((0xFFA5A5A5))), // blue color for the rest
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 100),
                      ] else if (_currentStep == 2) ...[
                        Text(
                          "Tell us about yourself",
                          style: TextStyle(fontSize: 24,
                              fontFamily: "Rubik",
                              fontWeight: FontWeight.w700,
                            color: Color(0xFF232831),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Just your name and company to get started.",
                          style: TextStyle(
                              fontFamily: "Rubik",
                              fontWeight: FontWeight.w400,
                              fontSize: 16, color: Color(0xFF6D7579)),
                        ),
                        SizedBox(height: 32),

                        RichText(
                          text: TextSpan(
                            style: TextStyle(fontSize: 14),
                            children: [
                              TextSpan(
                                text: 'Your Name',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Rubik",
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF232831)), // your chosen color for "30s"
                              ),
                              TextSpan(
                                text: ' *',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Rubik",
                                      fontWeight: FontWeight.w500,
                                      color: Colors.redAccent)                              ),
                            ],
                          ),
                        ),


                        Container(
                          width: 361,
                          height: 52,
                          decoration: BoxDecoration(
                            color: Color(0xFFF4F6F8),
                            borderRadius: BorderRadius.circular(16), // Variables.cardPadding equivalent
                          ),
                          padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
                          child: TextField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              hintText: 'Name',
                              border: InputBorder.none, // No border since it's styled via Container
                            ),
                            style: TextStyle(fontSize: 14), // optional, adjust as needed
                          ),
                        ),




                        SizedBox(height: 16),

                        RichText(
                          text: TextSpan(
                            style: TextStyle(fontSize: 14),
                            children: [
                              TextSpan(
                                text: 'Company Name',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Rubik",
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF232831)), // your chosen color for "30s"
                              ),
                              TextSpan(
                                  text: ' ',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Rubik",
                                      fontWeight: FontWeight.w500,
                                      color: Colors.redAccent)                              ),
                            ],
                          ),
                        ),


                        Container(
                          width: 361,
                          height: 52,
                          decoration: BoxDecoration(
                            color: Color(0xFFF4F6F8),
                            borderRadius: BorderRadius.circular(16), // Variables.cardPadding equivalent
                          ),
                          padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
                          child: TextField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              hintText: 'Name',
                              border: InputBorder.none, // No border since it's styled via Container
                            ),
                            style: TextStyle(fontSize: 14), // optional, adjust as needed
                          ),
                        ),

                        SizedBox(height: 100),
                      ],
                    ],
                  ),
                ),
              ),
              // Bottom Button
              Padding(
                padding: EdgeInsets.only(
                  bottom: padding.bottom > 0 ? padding.bottom : 16,
                  left: 16,
                  right: 16,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    if (_currentStep == 0) {
                      updateStep(1);
                    } else if (_currentStep == 1) {
                      updateStep(2);
                    } else {
                      // Navigate to home screen after last step
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    }
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0087D0),
                    foregroundColor: Colors.white,
                    minimumSize: Size(double.infinity, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    _currentStep == 2 ? 'Continue' : _currentStep == 1 ? 'Confirm' : 'Send OTP',
                    style: TextStyle(
                      fontSize: 16,
                        fontFamily: "Rubik",
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(height: 8),
            ],
          );
        },
      ),
    );
  }
}


class SegmentedProgressBar extends StatelessWidget {
  final int totalSteps;
  final int currentStep;
  final double gapWidth;
  final double height;
  final Color fillColor;
  final Color backgroundColor;

  const SegmentedProgressBar({
    Key? key,
    required this.totalSteps,
    required this.currentStep,
    this.gapWidth = 8.0,
    this.height = 8.0,
    this.fillColor = const Color(0xFF0087D0),
    this.backgroundColor = const Color(0xFFE0E0E0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Total width is divided between segments and gaps
    return LayoutBuilder(
      builder: (context, constraints) {
        final totalGapWidth = (totalSteps - 1) * gapWidth;
        final segmentWidth = (constraints.maxWidth - totalGapWidth) / totalSteps;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(totalSteps, (index) {
            bool isActive = index <= currentStep;
            return Container(
              width: segmentWidth,
              height: height,
              decoration: BoxDecoration(
                color: isActive ? fillColor : backgroundColor,
                borderRadius: BorderRadius.circular(height / 2),
              ),
            );
          }),
        );
      },
    );
  }
}

