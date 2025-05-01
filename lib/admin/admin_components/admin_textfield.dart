

import 'package:flutter/material.dart';

/// A reusable widget for a single editable field with pencil icon
class AdminTextField extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;

  const AdminTextField({
    required this.hint,
    this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF16C1FF), width: 2),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              style: const TextStyle(fontSize: 16, color: Color(0xff16C1FF), fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: const TextStyle(fontSize: 16, color: Color(0xff16C1FF), fontWeight: FontWeight.bold),
                border: InputBorder.none, // Removes the default underline
              ),
            ),
          ),
          const Icon(
            Icons.edit,
            size: 20,
            color: Color(0xFF47CEFF),
          ),
        ],
      ),
    );
  }
}