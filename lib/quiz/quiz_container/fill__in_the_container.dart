import 'package:flutter/material.dart';

class FillInBlanksLayout extends StatelessWidget {
  final String subject;
  final String question;
  final TextEditingController answerController;

  const FillInBlanksLayout({
    super.key,
    required this.subject,
    required this.question,
    required this.answerController,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
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
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: question,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF24C5FF),
                                      ),
                                    ),
                                    const TextSpan(
                                      text: " _________",
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
                            controller: answerController,
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
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      children: const [
                        Text(
                          "Correct Answer: ",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF24C5FF),
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "C",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF24C5FF),
                          ),
                        ),
                      
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}