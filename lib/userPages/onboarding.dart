import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nursense/userPages/level_select.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(15), // Specify the height of the AppBar
        child: AppBar(
          backgroundColor: const Color(0xFF47CEFF),
        ),
      ),
      body: Stack(
        children: [
          // PageView for onboarding pages
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const BouncingScrollPhysics(),
              children: [
                _buildPage("USER", "ACCESS", "assets/images/onboarding1.svg",
                    "Nursing students can log in to explore study materials, take quizzes, and track their progress, making learning more organized and accessible."),
                _buildPage(
                    "OFFLINE",
                    "FUNCTIONALITY",
                    "assets/images/onboarding2.svg",
                    "Students can keep learning and taking quizzes even without an internet connection, so their studies never have to be interrupted."),
                _buildPage(
                    "CLOUD",
                    "INTERGRATION",
                    "assets/images/onboarding3.svg",
                    "Admins can easily upload their own questions, customizing them to fit specific topics or exam formats."),
                _buildPage(
                    "LET'S GET",
                    "STARTED",
                    "assets/images/onboarding4.svg",
                    "Welcome to the Nursing Quiz App, where you can test your knowledge, enhance your skills, and challenge yourself with engaging nursing-related questions"),
              ],
            ),
          ),

          // Page Indicator
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize:
                  MainAxisSize.min, // Ensures the column takes minimal space
              children: [
                // Page Indicator
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 4,
                  effect: ExpandingDotsEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    activeDotColor: const Color(0xFF00BBFF),
                    dotColor: Colors.blue.withAlpha(
                        128), // Replaced withOpacity(0.5) with withAlpha(128)
                  ),
                ),
                const SizedBox(
                    height: 30), // Space between indicator and button
                // Button
                Container(
                  width:
                      MediaQuery.of(context).size.width * 0.9, // Button width
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF7DDDFF),
                        Color(0xFF0BBEFF)
                      ], // Gradient colors
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LevelSelect()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.transparent, // Transparent to show gradient
                      shadowColor: Colors.transparent, // Remove default shadow
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Proceed to Level Selection",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // White text for contrast
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(
      String title1, String title2, String imagePath, String description) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFF47CEFF),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title1,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          title2,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: -3,
                  right: 0,
                  child: SvgPicture.asset(
                    imagePath,
                    height: 200, // Adjust size as needed
                  ),
                ),
              ],
            ),
          ),

          // 🔹 Lower White Section
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue[300],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
