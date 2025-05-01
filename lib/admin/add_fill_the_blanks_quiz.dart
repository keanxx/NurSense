import 'package:flutter/material.dart';
import 'package:nursense/admin/add_multiple_choice_quiz.dart';
import 'package:nursense/admin/admin_components/add_button.dart';
import 'package:nursense/admin/admin_components/admin_textfield.dart';
import 'package:nursense/admin/admin_components/quiz_added_successful_dialog.dart';
import 'package:nursense/admin/admin_components/quiz_type_dialog.dart';
import 'package:nursense/admin/my_subjects.dart';

class AddFillTheBlanksQuiz extends StatelessWidget {
  const AddFillTheBlanksQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF47CEFF), // Light blue background
      resizeToAvoidBottomInset: false, // Prevents layout from resizing when the keyboard appears
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Stack(
            children: [
              // Main content at the top
              Column(
                children: [
                  const SizedBox(height: 15),

                  // Main white card with fields
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        AdminTextField(hint: "Quiz Title"),
                        const Divider(color: Color(0xFF47CEFF)),
                        AdminTextField(hint: "Question"),
                        AdminTextField(hint: "Correct Answer"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),

              // Expanded content at the bottom
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Shrinks the column to fit its content
                  children: [
                    AdminAddButton(onPressed: () {}),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                         quizAddedSuccessfulDialog(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF47CEFF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Text(
                          "Save Quiz",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}