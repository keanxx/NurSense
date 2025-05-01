import 'package:flutter/material.dart';
import 'package:nursense/quiz/quiz_container/fill__in_the_container.dart';
import 'package:nursense/quiz/quiz_container/multiple_choice_container.dart';

class PreviewAnswers extends StatefulWidget {
  const PreviewAnswers({super.key});

  @override
  State<PreviewAnswers> createState() => _PreviewAnswersState();
}

class _PreviewAnswersState extends State<PreviewAnswers> {
  final TextEditingController _answerController = TextEditingController();

  @override
  void dispose() {
    _answerController.dispose(); // Dispose of the controller to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF47CEFF), // Your blue color
        elevation: 0,
        titleSpacing: 0.0,
        title: const Text(
          "Back",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            size: 35,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: const Color(0xFF47CEFF), // Background color
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(15),
                children: [
                  QuestionContainer(
                    subject: "Medical Terms",
                    question: "What is the medical term for inflammation of the liver?",
                    children: [
                      _buildAnswerRow(0, "Hepatitis"),
                      const SizedBox(height: 15),
                      _buildAnswerRow(1, "Nephritis"),
                      const SizedBox(height: 15),
                      _buildAnswerRow(2, "Gastritis"),
                      const SizedBox(height: 15),
                      _buildAnswerRow(3, "Arthritis"),
                    ],
                  ),
               
                  QuestionContainer(
                    subject: "Anatomy",
                    question: "What is the largest organ in the human body?",
                    children: [
                      _buildAnswerRow(0, "Skin"),
                      const SizedBox(height: 15),
                      _buildAnswerRow(1, "Liver"),
                      const SizedBox(height: 15),
                      _buildAnswerRow(2, "Heart"),
                      const SizedBox(height: 15),
                      _buildAnswerRow(3, "Lungs"),
                    ],
                  ),
               
                  FillInBlanksLayout(
                    subject: "Medical Terms",
                    question: "The medical term for inflammation of the liver is",
                    answerController: _answerController,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnswerRow(int index, String answerText) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: index == 0
                  ? const Color(0xFF00B5F6) // Highlight correct answer
                  : Colors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: const Color(0xFFBEEEFF)),
            ),
            height: 40,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  answerText,
                  style: TextStyle(
                    color: index == 0
                        ? Colors.white // Highlight correct answer text
                        : const Color(0xFF00B5F6),
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}