import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nursense/quiz/fill_in_blanks.dart';
import 'package:nursense/components/customDialog.dart';
import 'package:nursense/quiz/result.dart';

class MultipleChoice extends StatefulWidget {
  const MultipleChoice({super.key});

  @override
  State<MultipleChoice> createState() => _MultipleChoiceState();
}

class _MultipleChoiceState extends State<MultipleChoice> {
  List<Color> boxColors = List<Color>.filled(4, Colors.white, growable: false);
  bool isAnswerSelected = false;

  Timer? _timer;
  int _remainingSeconds = 10; // 10 seconds for testing

  String get timerText {
    final minutes = (_remainingSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (_remainingSeconds % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        timer.cancel();
        // Show the CustomDialog when the timer runs out
        if (mounted) {
          showDialog(
            context: context,
            barrierDismissible: false, // Prevent dismissing the dialog by tapping outside
            builder: (BuildContext context) {
              return Customdialog(
                icon: const Icon(
                  Icons.timer_off_outlined, // Example icon
                  size: 50,
                  color: Color(0xFF47CEFF),
                ),
                title: "Time's Up!",
                subtitle: "Better luck next time",
                buttonText: "See the results",
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Result())); // Navigate back to the previous screen
                },
              );
            },
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

@override
Widget build(BuildContext context) {
  return WillPopScope(
    onWillPop: () async {
      // Returning false disables the back button
      return false;
    },
    child: Scaffold(
      backgroundColor: const Color(0xFF47CEFF),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: const Color(0xFF47CEFF),
          automaticallyImplyLeading: false, // Disable the default back button
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 15, bottom: 15),
            child: Row(
              children: [
                const Spacer(),
                const Icon(
                  Icons.hourglass_bottom_outlined,
                  color: Colors.white,
                ),
                Text(
                  timerText,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              width: MediaQuery.of(context).size.width * 0.9,
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
                      children: const [
                        Text(
                          "Subject: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color(0xFF47CEFF),
                          ),
                        ),
                        Text(
                          "Medical Terms",
                          style: TextStyle(
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
                                "What is the medical term for inflammation of the liver?",
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
                        _buildAnswerRow(0, "Hepatitis"),
                        const SizedBox(height: 15),
                        _buildAnswerRow(1, "Nephritis"),
                        const SizedBox(height: 15),
                        _buildAnswerRow(2, "Gastritis"),
                        const SizedBox(height: 15),
                        _buildAnswerRow(3, "Arthritis"),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Color(0xFFC3EFFF),
                          width: 2.0,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 15),
                            child: Row(
                              children: const [
                                Text(
                                  "1",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF24C5FF),
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "out of",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF24C5FF),
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "10",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF24C5FF),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                            visible: isAnswerSelected,
                            child: ElevatedButton(
                              onPressed: () {
                                if (mounted) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const FillInBlanks()),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                backgroundColor: const Color(0xFF47CEFF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    "Next Question",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(width: 30),
                                  SvgPicture.asset(
                                    "assets/images/chevronRight.svg",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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

  // Helper method to build each answer row
  Widget _buildAnswerRow(int index, String answerText) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              setState(() {
                boxColors =
                    List<Color>.filled(4, Colors.white, growable: false);
                boxColors[index] = const Color(0xFF00B5F6);
                isAnswerSelected = true; // Show button
              });
            },
            child: Material(
              color: Colors.transparent,
              child: Ink(
                decoration: BoxDecoration(
                  color: boxColors[index], // Use the color for this answer
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
                        color: boxColors[index] == Colors.white
                            ? const Color(0xFF00B5F6)
                            : Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
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
