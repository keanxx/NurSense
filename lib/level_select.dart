import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nursense/dashboard.dart';

class LevelSelect extends StatefulWidget {
  const LevelSelect({super.key});

  @override
  State<LevelSelect> createState() => _LevelSelectState();
}

class _LevelSelectState extends State<LevelSelect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(5),
        child: AppBar(
          backgroundColor: const Color(0xFF47CEFF),
        ),
      ),
      body: Container(
        color: const Color(0xFF47CEFF), // Background color added
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "SELECT YOUR LEVEL",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),
              _buildButton(context, "Level 1", () {
                _showLoadingAndNavigate(context, Dashboard());
              }),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Reminder:",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "This level is preferred for first-year nursing students.",
                        style: TextStyle(
                          fontSize: 10.5,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              _buildButton(context, "Level 2", () {
                _showLoadingAndNavigate(context, Dashboard());
              }),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Reminder:",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "This level is preferred for first-year nursing students.",
                        style: TextStyle(
                          fontSize: 10.5,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ✅ Reusable Button Function
  Widget _buildButton(
      BuildContext context, String text, VoidCallback onPressed) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Color(0xFF16C1FF),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

 void _showLoadingAndNavigate(BuildContext context, Widget nextPage) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent, // Make the dialog background transparent
        insetPadding: EdgeInsets.zero, // Remove default padding
        child: Container(
          width: MediaQuery.of(context).size.width, // Full width
          height: MediaQuery.of(context).size.height, // Full height
          color: const Color(0xFF47CEFF), // Background color
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/images/nursenseLogo.svg", // Path to your SVG logo
                width: 100, // Adjust the size as needed
                height: 100,
              ),
              const SizedBox(height: 15),
              const Text(
                "LOADING SUBJECTS AND REVIEWS",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 8, // Adjust the height as needed
                    child: LinearProgressIndicator(
                      color: Colors.white,
                      backgroundColor: const Color(0xFF007EAC),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );

  // Delay navigation
  Future.delayed(const Duration(seconds: 2), () {
    if (!mounted) return; // Ensure the widget is still mounted

    // Close the dialog and navigate to the next page
    if (Navigator.canPop(context)) {
      Navigator.pop(context); // Close the loading dialog
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => nextPage),
    );
  });
}
}

