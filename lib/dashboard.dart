import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nursense/components/subjects_card.dart';
import 'package:nursense/subject.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1), // Start above the screen
      end: Offset.zero, // Slide into view
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _showMenu() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        _animationController.forward(); // Start the slide animation
        return Align(
          alignment: Alignment.topCenter,
          child: SlideTransition(
            position: _slideAnimation,
            child: Material(
              color: Colors.transparent,
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    // Header
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      child: Stack(
                        children: [
                          const Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                "NurSense",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF47CEFF),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              icon: const Icon(Icons.close,
                                  color: Color(0xFF47CEFF)),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildMenuItem(
                          iconPath: "assets/images/dashboard.svg",
                          label: "Dashboard",
                          onTap: () {
                            Navigator.pop(context); // Close the menu
                            print("Dashboard clicked");
                          },
                        ),
                        _buildMenuItem(
                          iconPath: "assets/images/about.svg",
                          label: "About Us",
                          onTap: () {
                            Navigator.pop(context); // Close the menu
                            print("About Us clicked");
                          },
                        ),
                        _buildMenuItem(
                          iconPath: "assets/images/logout.svg",
                          label: "Logout",
                          onTap: () {
                            Navigator.pop(context); // Close the menu
                            print("Logout clicked");
                          },
                        ),
                      ],
                    ),
                     Container(
                      padding: EdgeInsets.only(top: 20),
            height: 2,
            width: 20,
            color: Colors.cyanAccent,
          )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ).then((_) {
      _animationController
          .reset(); // Reset the animation when the dialog is dismissed
    });
  }

  Widget _buildMenuItem({
    required String iconPath,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                border: Border.all(width: 2, color: Color(0xFF47CEFF))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(iconPath, color: const Color(0xFF47CEFF),)
            ),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Color(0xFF47CEFF),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            "assets/images/nursenseLogo.svg",
            width: 30,
            height: 30,
            fit: BoxFit.contain,
          ),
        ),
        title: Row(
          children: [
            Text(
              "NurSense",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF47CEFF),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: _showMenu, // Show the sliding menu
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
              child: Text(
                "My Subjects",
                style: const TextStyle(
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
