import 'package:flutter/material.dart';

class AddItemDialog extends StatefulWidget {
  final String title;
  final String hintText;
  final Function(String) onAdd;

  const AddItemDialog({
    super.key,
    required this.title,
    required this.hintText,
    required this.onAdd,
  });

  @override
  State<AddItemDialog> createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<AddItemDialog> {
  String inputText = ""; // Variable to store the input text
  String? selectedFileName; // Variable to store the selected file name


  @override
Widget build(BuildContext context) {
  return AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    title: Text(
      widget.title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: Color(0xFF47CEFF),
      ),
    ),
    content: SingleChildScrollView( // Wrap the Column in SingleChildScrollView
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            onChanged: (value) {
              inputText = value; // Update the input text
            },
            decoration: InputDecoration(
              labelText: widget.hintText,
              hintText: "Type here...",
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              
            }, // Trigger file picker
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF47CEFF),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text("Upload File"),
          ),
          if (selectedFileName != null) ...[
            const SizedBox(height: 10),
            Text(
              "Selected File: $selectedFileName",
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ],
        ],
      ),
    ),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.pop(context); // Close the dialog
        },
        child: const Text("Cancel"),
      ),
      TextButton(
        onPressed: () {
          Navigator.pop(context); // Close the dialog
          if (inputText.isNotEmpty) {
            widget.onAdd(inputText); // Call the callback with the input text
          }
        },
        child: const Text(
          "Add",
          style: TextStyle(color: Colors.blue),
        ),
      ),
    ],
  );
}
}