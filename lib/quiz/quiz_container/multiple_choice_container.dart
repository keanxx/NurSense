import 'package:flutter/material.dart';

class QuestionContainer extends StatelessWidget {
  final String subject;
  final String question;
  final List<Widget> children;

  const QuestionContainer({
    super.key,
    required this.subject,
    required this.question,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      width: MediaQuery.of(context).size.width * 0.9, // Keep the width fixed
      // Removed the height property to allow the container to wrap its content
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xFFC3EFFF),
                  width: 2.0,
                ),
              ),
            ),
            child: Row(
              children: [
                const Text(
                  "Subject: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xFF47CEFF),
                  ),
                ),
                Text(
                  subject,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xFF47CEFF),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "1.",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF24C5FF),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Flexible(
                      child: Text(
                        question,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF24C5FF),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                ...children, // Add custom child widgets (e.g., answer rows)
              ],
            ),
          ),
        ],
      ),
    );
  }
}