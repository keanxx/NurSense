import 'package:flutter/material.dart';
import 'package:nursense/admin/add_multiple_choice_quiz.dart'; // adjust your import
import 'package:nursense/admin/add_fill_the_blanks_quiz.dart'; // adjust your import

Future<void> quizTypeDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Select the type of question',
                style: TextStyle(
                  color: Color(0xFF16C1FF),
                  fontSize: 20,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 5, bottom: 10),
                child: Divider(color: Color(0xFF47CEFF)),
              ),

              // ────── Multiple Choice Button ──────
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close dialog
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddMultipleChoiceQuiz()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Color(0xFF16C1FF), width: 2),
                  minimumSize: const Size(double.infinity, 50),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Multiple choice',
                  style: TextStyle(
                    color: Color(0xFF16C1FF),
                    fontSize: 18,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // ────── Fill in the Blanks Button ──────
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close dialog
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddFillTheBlanksQuiz()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Color(0xFF16C1FF), width: 2),
                  minimumSize: const Size(double.infinity, 50),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Fill in the blanks',
                  style: TextStyle(
                    color: Color(0xFF16C1FF),
                    fontSize: 18,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
