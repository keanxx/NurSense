import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
 @override
  void initState() {
    super.initState();
    // Navigate to the Onboarding screen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) { // Check if the widget is still mounted
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF47CEFF) ,
      ),
      body: Container(
        color: const Color(0xFF47CEFF), // Background color
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min, // Keeps the column centered
            children: [
              SvgPicture.asset(
                "assets/images/nursenseLogo.svg",
                height: 75,
                width: 75,
              ),
              const SizedBox(height: 10), // Adds spacing between logo & text
              const Text(
                "NurSense",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Makes text readable
                ),
              ),
              const SizedBox(height: 15),
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: 10, // Custom height
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      width: 2), // Border color & thickness
                  borderRadius: BorderRadius.circular(5), // Rounded corners
                ),
                child: const LinearProgressIndicator(
                  color: Color.fromARGB(255, 255, 255, 255),
                  backgroundColor: Color(0xFF007EAC),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}