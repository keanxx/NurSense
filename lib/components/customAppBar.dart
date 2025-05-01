import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<MenuItem> menuItems;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.menuItems,
  });

  void _showMenu(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.topCenter,
          child: Material(
            color: Colors.transparent,
            child: Container(
              height: 200,
              decoration: const BoxDecoration(
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
                        Center(
                          child: Text(
                            title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF47CEFF),
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
                  // Menu Items
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: menuItems.map((item) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pop(context); // Close the menu
                          item.onTap(); // Trigger the menu item action
                        },
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                                border: Border.all(
                                    width: 2, color: const Color(0xFF47CEFF)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  item.iconPath,
                                  color: const Color(0xFF47CEFF),
                                  width: 30,
                                  height: 30,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              item.label,
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF47CEFF),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(
          "assets/images/nursenseLogo.svg", // Logo for the app
          width: 30,
          height: 30,
          fit: BoxFit.contain,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      backgroundColor: const Color(0xFF47CEFF), // AppBar background color
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () => _showMenu(context), // Show the menu
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class MenuItem {
  final String iconPath;
  final String label;
  final VoidCallback onTap;

  MenuItem({
    required this.iconPath,
    required this.label,
    required this.onTap,
  });
}