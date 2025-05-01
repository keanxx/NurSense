import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nursense/components/customDialog.dart';
import 'package:nursense/quiz/result.dart';

class FillInBlanks extends StatefulWidget {
  const FillInBlanks({super.key});

  @override
  State<FillInBlanks> createState() => _FillInBlanksState();
}

class _FillInBlanksState extends State<FillInBlanks> {
  late TextEditingController _answerController; // Declare the controller
  bool isAnswerSelected = false; // Initially, the button is hidden
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
    _answerController = TextEditingController(); // Initialize the controller
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
    _answerController.dispose(); // Dispose of the controller
    _timer?.cancel(); // Cancel the timer
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
                          color: Color(0xFFC3EFFF), // Border color
                          width: 2.0, // Border width
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
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "1. ",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF24C5FF),
                                    ),
                                  ),
                                  Flexible(
                                    child: RichText(
                                      text: const TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                                "The medical term for inflammation of the liver is ",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFF24C5FF),
                                            ),
                                          ),
                                          TextSpan(
                                            text: "_________",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFF24C5FF),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Answer: ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: Color(0xFF47CEFF),
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: _answerController,
                                  decoration: InputDecoration(
                                    labelStyle: const TextStyle(
                                      color: Color(0xFF24C5FF),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF24C5FF),
                                        width: 2.0,
                                      ),
                                    ),
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF00B5F6),
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF24C5FF),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      isAnswerSelected = value.isNotEmpty;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(top: 10),
                          decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: Color(0xFFC3EFFF), // Border color
                                width: 2.0, // Border width
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15, bottom: 10),
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