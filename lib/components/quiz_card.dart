import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nursense/quiz/quiz_instruction.dart';

class QuizCard extends StatefulWidget {
  final String number;
  
  final String lesson;

  final VoidCallback onDownload;

  const QuizCard(
      {super.key,
      required this.number,
      required this.lesson,
    
      required this.onDownload});

  @override
  State<QuizCard> createState() => _QuizCardState();
}

class _QuizCardState extends State<QuizCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        padding: EdgeInsets.only(top: 15, bottom: 10, left: 12, right: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFF47CDFF),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset("assets/images/bulbWhite.svg"),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Quiz",
                          style: TextStyle(
                            color: const Color(0xFF006E96),
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          width: 5,),
                        Text(
                          widget.number,
                          style: TextStyle(
                            color: const Color(0xFF006E96),
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          widget.lesson,
                          style: TextStyle(
                            color: const Color(0xFF006E96),
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Click this to view the recent quiz answers",
                      style: TextStyle(
                        color: const Color(0x7F006E96),
                        fontSize: 13,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        decorationColor: const Color(0x7F006E96),
                      ),
                    ),
                    SizedBox(height: 5,)
                  ],
                ))
              ],
            ),
           Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => QuizInstruction()));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    minimumSize: Size(0, 32),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    backgroundColor: Color(0xFF00AFEE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Proceed",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Colors.white),
                      ),
                      SizedBox(width: 10),
                      SvgPicture.asset(
                        "assets/images/view.svg",
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
