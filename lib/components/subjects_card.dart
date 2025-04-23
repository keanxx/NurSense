import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SubjectsCard extends StatefulWidget {
  final String label;
  final Widget destinationPage;
  final String icon; // Accept dynamic icon (e.g., from Iconify)
  final VoidCallback? onTap; // Callback for custom actions (e.g., open bottom sheet)

  const SubjectsCard({
    super.key,
    required this.icon,
    required this.label,
    required this.destinationPage,
    this.onTap, // Optional callback for custom actions
  });

  @override
  SubjectCardState createState() => SubjectCardState();
}

class SubjectCardState extends State<SubjectsCard> {
  bool isPressed = false; 


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: widget.onTap ??
              () {
                // Default behavior: Navigate to the destination page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => widget.destinationPage),
                );
              },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.90,
            height: 70,
            padding: const EdgeInsets.only(top: 15, bottom: 15, left: 25, right: 15),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment(0.00, 0.50),
                end: Alignment(1.00, 0.50),
                colors: [Color(0xFF82DEFF), Color(0xFF05BCFF)],
              ),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  widget.icon,
                  width: 35,
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: Text(
                    widget.label,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right_outlined,
                  color: Colors.white,
                  size: 40, // Display the chevron icon without interfering with onTap
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20), // Add spacing below the card
      ],
    );
  }
}