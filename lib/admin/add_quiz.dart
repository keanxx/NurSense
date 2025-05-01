import 'package:flutter/material.dart';
import 'package:nursense/admin/add_fill_the_blanks_quiz.dart';
import 'package:nursense/admin/add_multiple_choice_quiz.dart';
import 'package:nursense/admin/admin_components/add_button.dart';
import 'package:nursense/admin/admin_components/button.dart';
import 'package:nursense/admin/admin_components/quiz_type_dialog.dart';

class AddQuiz extends StatefulWidget {
  const AddQuiz({super.key});

  @override
  State<AddQuiz> createState() => _AddQuizState();
}

class _AddQuizState extends State<AddQuiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF47CEFF),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  // Title section
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "| MY QUIZZES",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            letterSpacing: 1.2,
                          ),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              "    LEVEL ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "1",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Search box
                  Container(
                    width: 180,
                    height: 36,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const TextField(
                      style: TextStyle(fontSize: 14),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: 'Search here',
                        hintStyle: TextStyle(fontSize: 14),
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search, size: 20),
                        contentPadding: EdgeInsets.zero,
                        isDense: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 40),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AdminButton(
                        name: "Quiz 1", onPressed: () {}, onDelete: () {}),
                    AdminAddButton(
                      onPressed: () {
                        quizTypeDialog(context);
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
