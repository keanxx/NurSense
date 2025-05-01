import 'package:flutter/material.dart';
import 'package:nursense/admin/admin_components/button.dart';
import 'package:nursense/admin/my_subjects.dart';

class Levels extends StatelessWidget {
  const Levels({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF47CEFF), // blue background
      body: SafeArea(
        child: Stack(
          children: [
            // ADMINISTRATOR title at the top-left
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "| ADMINISTRATOR",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
            // Centered content
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Shrinks the column to fit its content
                  crossAxisAlignment: CrossAxisAlignment.center, // Centers content horizontally
                  children: [
                    // MY LEVELS centered
                    const Text(
                      "MY LEVELS",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Level 1 button
                    AdminButton(
                      name: "Level 1",
                      onDelete: () {
                        // handle delete Level 1
                      },
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MySubjects()));
                      },
                    ),
                    const SizedBox(height: 20),
                    // Level 2 button
                    AdminButton(
                      name: "Level 2",
                      onDelete: () {
                        // handle delete Level 2
                      },
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MySubjects()));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}