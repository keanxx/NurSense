import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(5),
        child: AppBar(
          backgroundColor: const Color(0xFF47CEFF),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 5),
                  const Text(
                    "NurSense",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF47CEFF),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: Color(0xFF47CEFF),
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "      NurSense is a quiz and review app for nursing students designed to make learning easier and more engaging. It covers important topics like anatomy, pharmacology, patient care, and clinical procedures, helping students strengthen their knowledge. With detailed explanations and feedback, it guides them through tough concepts and helps improve weak areas. The app supports self-paced learning with structured review materials and practice tests, making exam prep less stressful. Built for nursing school exams, it gives students the confidence and skills they need to succeed in their future careers.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF47CEFF),
                ),
              ),
              const SizedBox(height: 50),
              const Text(
                "Project proponents:",
                style: TextStyle(
                 fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF47CEFF),
                ),
              ),
              const SizedBox(height: 10),
              ...[
                'Cabana, Paul Ayen Seth B.',
                'Cabuñas, Renz Matthew M.',
                'Campaña, Lovernie R.',
                'Deniega, Michaella M.'
              ].map(
                (name) => Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      '  • ',
                      style: TextStyle(
                       fontSize: 20,
                       
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF47CEFF),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        name,
                        style: const TextStyle(
                         fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF47CEFF),
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
