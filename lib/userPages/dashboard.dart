import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nursense/auth/login.dart';
import 'package:nursense/userPages/about_us.dart';
import 'package:nursense/components/customAppBar.dart';
import 'package:nursense/components/subjects_card.dart';
import 'package:nursense/userPages/subject.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }



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
            print("Dashboard clicked");
          },
        ),
        MenuItem(
          iconPath: "assets/images/about.svg",
          label: "About Us",
          onTap: () {
           Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUs()));
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width * 0.90,
                height: 165,
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
                    SizedBox(
                      width: 65,
                      height: 65,
                      child: SvgPicture.asset(
                        "assets/images/profileIcon.svg",
                        fit: BoxFit.contain,
                      ),
                    ),
                    const Text(
                      "Student name",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Level: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "1",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                "My Subjects",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF16C1FF),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              children: [
                SubjectsCard(
                  icon: "assets/images/book.svg",
                  label: "Anatomy & Physiology",
                  destinationPage: Subject(),
                ),
                SubjectsCard(
                  icon: "assets/images/book.svg",
                  label: "Theoretical Foundation of Nursing",
                  destinationPage: Subject(),
                ),
                SubjectsCard(
                  icon: "assets/images/book.svg",
                  label: "Fundamental",
                  destinationPage: Subject(),
                ),
                SubjectsCard(
                  icon: "assets/images/book.svg",
                  label: "Medical Terms",
                  destinationPage: Subject(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}