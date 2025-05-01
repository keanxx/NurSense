import 'package:flutter/material.dart';
import 'package:nursense/admin/add_quiz.dart';
import 'package:nursense/admin/admin_components/add_button.dart';
import 'package:nursense/admin/admin_components/add_item_dialog.dart';
import 'package:nursense/admin/admin_components/button.dart';

class MySubjects extends StatefulWidget {
  const MySubjects({super.key});

  @override
  State<MySubjects> createState() => _MySubjectsState();
}

class _MySubjectsState extends State<MySubjects> {
  // Keeps track of which tab is selected (0 = Quizzes, 1 = PowerPoints, 2 = Documents)
  int selectedTabIndex = 0;

  // Sample data for each tab
  final List<String> quizzes = ['Subject 1', 'Subject 2', 'Subject 3'];
  final List<String> powerpoints = ['Subject A', 'Subject B'];
  final List<String> docs = ['Doc X', 'Doc Y', 'Doc Z'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF47CEFF), // Screen background color
      body: SafeArea(
        child: Column(
          children: [
            // ────── Header with title and search box ──────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              child: Row(
                children: [
                  // Title section
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "| MY QUIZZES",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            letterSpacing: 1.2,
                          ),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              "    LEVEL ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "1",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Search box
                  Container(
                    width: 180,
                    height: 36,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const TextField(
                      style: TextStyle(fontSize: 14),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: 'Search here',
                        hintStyle: TextStyle(fontSize: 14),
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search, size: 20),
                        contentPadding: EdgeInsets.zero,
                        isDense: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ────── Custom tabs (Quizzes / Powerpoints / Documents) ──────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  // Each tab is a custom button
                  buildTabButton("QUIZZES", 0, const Color.fromARGB(0, 255, 255, 255)),
                  const SizedBox(width: 8),
                  buildTabButton("POWERPOINTS", 1, const Color.fromARGB(0, 68, 137, 255)),
                  const SizedBox(width: 8),
                  buildTabButton("DOCUMENTS", 2, const Color.fromARGB(0, 255, 255, 255)),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ────── List of subjects based on selected tab ──────
            Expanded(
              child: _SubjectsList(
                subjects: getSubjects(), // Shows the correct list based on tab
                selectedTabIndex: selectedTabIndex, // Pass the selected tab index
                onAdd: () => print("Add pressed"), // For "+" button
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Helper to build a custom tab button
  Widget buildTabButton(String title, int index, Color selectedColor) {
    bool isSelected = selectedTabIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          // Update selected tab index when pressed
          setState(() {
            selectedTabIndex = index;
          });
        },
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            color: isSelected ? selectedColor : Colors.white, // Different background based on selection
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.white : const Color(0xFF47CEFF), // Text color changes if selected
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Helper to return the correct subjects list based on selected tab
  List<String> getSubjects() {
    if (selectedTabIndex == 0) return quizzes;
    if (selectedTabIndex == 1) return powerpoints;
    return docs;
  }
}

/// Widget that displays list of subject buttons and "+" button at the bottom
class _SubjectsList extends StatelessWidget {
  final List<String> subjects;
  final int selectedTabIndex;
  final VoidCallback onAdd;

  const _SubjectsList({
    required this.subjects,
    required this.selectedTabIndex,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: subjects.length + 1, // +1 for the "+" button
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, i) {
        if (i < subjects.length) {
          final name = subjects[i];
          return AdminButton(
            name: name,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AddQuiz()));
            },
            onDelete: () => _confirmDelete(context, name), // Confirm before deleting
          );
        } else {
          // The "+" button at bottom
          return AdminAddButton(
  onPressed: () {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddItemDialog(
          title: selectedTabIndex == 0
              ? "Add New Subject"
              : selectedTabIndex == 1
                  ? "Add New PowerPoint"
                  : "Add New Document",
          hintText: selectedTabIndex == 0
              ? "Enter suject name"
              : selectedTabIndex == 1
                  ? "Enter PowerPoint name"
                  : "Enter document name",
          onAdd: (inputText) {
            if (selectedTabIndex == 0) {
              // Logic for adding a new quiz
              print("Added Quiz: $inputText");
              // Add your logic here, e.g., update the quizzes list
            } else if (selectedTabIndex == 1) {
              // Logic for adding a new PowerPoint
              print("Added PowerPoint: $inputText");
              // Add your logic here, e.g., update the PowerPoints list
            } else if (selectedTabIndex == 2) {
              // Logic for adding a new Document
              print("Added Document: $inputText");
              // Add your logic here, e.g., update the Documents list
            }
          },
        );
      },
    );
  },
);
        }
      },
    );
  }

  /// Confirmation dialog when deleting a subject
  void _confirmDelete(BuildContext context, String name) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text("Delete Subject"),
        content: Text("Are you sure you want to delete \"$name\"?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              print("Deleted $name");
            },
            child: const Text("Delete", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}