import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class AdminAddButton extends StatelessWidget {
 
  final VoidCallback onPressed;
  
   

  const AdminAddButton({
    super.key,
   
    required this.onPressed,

  
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
       child: Center(
          child: SvgPicture.asset(
            "assets/images/add.svg", // Path to your SVG file
            width: 35,
            height: 35,
            color: const Color(0xFF47CEFF), // Optional: Set the color of the SVG
          ),
        ),
      ),
    );
  }

  
    
  }

