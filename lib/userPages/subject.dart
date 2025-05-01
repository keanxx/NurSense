import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nursense/auth/login.dart';
import 'package:nursense/components/customAppBar.dart';
import 'package:nursense/components/subjects_card.dart';
import 'package:nursense/userPages/dashboard.dart';
import 'package:nursense/quiz/quiz_instruction.dart';
import '../components/quiz_card.dart';
import '../components/ppt_card.dart';
import '../components/document_card.dart';

class Subject extends StatefulWidget {
  const Subject({super.key});

  @override
  State<Subject> createState() => _SubjectState();
}

class _SubjectState extends State<Subject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "NurSense",
        menuItems: [
          MenuItem(
            iconPath: "assets/images/dashboard.svg",
            label: "Dashboard",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Dashboard()),
              );
            },
          ),
          MenuItem(
            iconPath: "assets/images/about.svg",
            label: "About Us",
            onTap: () {
              print("About Us clicked");
            },
          ),
          MenuItem(
            iconPath: "assets/images/logout.svg",
            label: "Logout",
            onTap: () {
               Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const Login(), // Replace with your login page
      ),
      (route) => false, // Removes all previous routes
    );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.chevron_left_outlined,
                    color: Color(0xFF06BDFF)),
              ),
              const Text(
                "Back",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF06BDFF),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15),
            width: MediaQuery.of(context).size.width * 0.90,
            height: 110,
            decoration: ShapeDecoration(
              gradient: const LinearGradient(
                begin: Alignment(-0.00, 0.50),
                end: Alignment(1.00, 0.53),
                colors: [Color(0xFF85DEFF), Color(0xFF00BAFF)],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  "assets/images/heartRate.svg",
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15),
            width: MediaQuery.of(context).size.width * 0.90,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  "Subject: ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF06BDFF),
                  ),
                ),
                Text(
                  "Medical Terms",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF06BDFF),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              children: [
                SubjectsCard(
                  icon: "assets/images/bookShelves.svg",
                  label: "Subject Reviewer",
                  destinationPage: Dashboard(),
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true, // Allows custom height
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top:
                              Radius.circular(20), // Rounded corners at the top
                        ),
                      ),
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height *
                              0.5, // Half of the screen height
                          child:
                              const BottomSheetContent(), // Your bottom sheet content
                        );
                      },
                    );
                  },
                ),
                SubjectsCard(
                  icon: "assets/images/list.svg",
                  label: "Take a Quiz",
                  destinationPage: QuizInstruction(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BottomSheetContent extends StatefulWidget {
  const BottomSheetContent({super.key});

  @override
  State<BottomSheetContent> createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF47CEFF),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
            child: ButtonsTabBar(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              backgroundColor: Colors.white,
              unselectedBackgroundColor: const Color(0xFF47CEFF),
              unselectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.w700, color: Colors.white),
              labelStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              tabs: [
                Tab(
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/images/ppt.svg",
                        width: 25,
                        height: 25,
                        colorFilter: _selectedIndex == 0
                            ? const ColorFilter.mode(
                                Color(0xFF00BBFF), BlendMode.srcIn)
                            : const ColorFilter.mode(
                                Colors.white, BlendMode.srcIn),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "PowerPoints",
                        style: TextStyle(
                          color: _selectedIndex == 0
                              ? const Color(0xFF00BBFF)
                              : Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/images/wordWhite.svg",
                        width: 25,
                        height: 25,
                        colorFilter: _selectedIndex == 1
                            ? const ColorFilter.mode(
                                Color(0xFF00BBFF), BlendMode.srcIn)
                            : const ColorFilter.mode(
                                Colors.white, BlendMode.srcIn),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Documents",
                        style: TextStyle(
                          color: _selectedIndex == 1
                              ? const Color(0xFF00BBFF)
                              : Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/images/bulb.svg",
                        width: 25,
                        height: 25,
                        colorFilter: _selectedIndex == 2
                            ? const ColorFilter.mode(
                                Color(0xFF00BBFF), BlendMode.srcIn)
                            : const ColorFilter.mode(
                                Colors.white, BlendMode.srcIn),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Quizzes",
                        style: TextStyle(
                          color: _selectedIndex == 2
                              ? const Color(0xFF00BBFF)
                              : Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              color: const Color(0xff47CEFF),
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          FileCard(
                            lesson: "1:",
                            fileName: "Subject Lesson",
                            description: "Download this file to review",
                            onDownload: () {},
                          ),
                          FileCard(
                            lesson: "2:",
                            fileName: "Subject Lesson",
                            description: "Download this file to review",
                            onDownload: () {},
                          ),
                          FileCard(
                            lesson: "3:",
                            fileName: "Subject",
                            description: "Download this file to review",
                            onDownload: () {},
                          ),
                          FileCard(
                            lesson: "4:",
                            fileName: "Subject",
                            description: "Download this file to review",
                            onDownload: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          DocumentCard(
                            lesson: "4:",
                            fileName: "Subject",
                            description: "Download this file to review",
                            onDownload: () {},
                          ),
                          DocumentCard(
                            lesson: "4:",
                            fileName: "Subject",
                            description: "Download this file to review",
                            onDownload: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                      child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        QuizCard(
                            number: "3",
                            lesson: "Medical Terms",
                            onDownload: () {}),
                        QuizCard(
                            number: "2",
                            lesson: "Medical Terms",
                            onDownload: () {}),
                        QuizCard(
                            number: "1",
                            lesson: "Medical Terms",
                            onDownload: () {}),
                      ],
                    ),
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
