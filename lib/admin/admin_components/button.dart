import 'package:flutter/material.dart';

class AdminButton extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;
  final VoidCallback onDelete;
   

  const AdminButton({
    super.key,
    required this.name,
    required this.onPressed,
    required this.onDelete,
  
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: const TextStyle(
                color: Color(0xFF47CEFF),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                _showConfirmationDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text(
          "Confirm Deletion",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content:  Text("Are you sure you want to delete this?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // just close dialog
            },
            child: const Text(
              "Cancel",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // close dialog first
              onDelete(); // then call delete callback
            },
            child: const Text(
              "Delete",
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
