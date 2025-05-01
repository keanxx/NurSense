import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nursense/auth/login.dart';
import 'package:nursense/auth/signup_confirm.dart';
class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
  
}

class _SignupState extends State<Signup> {
  bool _isPasswordVisible = false; // State to toggle password visibility
  final _firstNameController = TextEditingController(); // Controller for first name input
  final _emailController = TextEditingController(); // Controller for email input
  final _passwordController = TextEditingController(); // Controller for password input
  final _confirmPasswordController = TextEditingController(); // Controller for confirm password input

  // Regex for email validation
  final RegExp emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  // Regex for password validation (at least 8 characters, 1 letter, 1 number)
  final RegExp passwordRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(5), // Specify the height of the AppBar
        child: AppBar(
          backgroundColor: const Color(0xFF47CEFF),
        ),
      ),
      body: Container(
        color: const Color(0xFFD8F5FF),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/images/nursenseLogo.svg",
                height: 85,
                width: 85,
              ),
              const SizedBox(height: 30),
              const Text(
                "To access the NurSense",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                  color: Color(0xFF2EBFF4),
                ),
              ),
              const Text(
                "please sign up for an account",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF3DC0EF),
                ),
              ),
              const SizedBox(height: 30),

              // First Name Field
              _buildInputField(
                context,
                controller: _firstNameController,
                icon: Icons.person_2_outlined,
                labelText: "Full Name",
                isPassword: false,
              ),

              const SizedBox(height: 20),

              // Email Field
              _buildInputField(
                context,
                controller: _emailController,
                icon: Icons.email_outlined,
                labelText: "Email",
                isPassword: false,
              ),

              const SizedBox(height: 20),

              // Password Field
              _buildInputField(
                context,
                controller: _passwordController,
                icon: Icons.key_outlined,
                labelText: "Password",
                isPassword: true,
              ),

              const SizedBox(height: 20),

              // Confirm Password Field
              _buildInputField(
                context,
                controller: _confirmPasswordController,
                icon: Icons.key_outlined,
                labelText: "Confirm Password",
                isPassword: true,
              ),

              const SizedBox(height: 40),

              // Signup Button
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width * 0.75, // Button width
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF7DDDFF),
                      Color(0xFF0BBEFF)
                    ], // Gradient colors
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(5), // Rounded corners
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // Validate fields
                    if (_firstNameController.text.isEmpty) {
                      _showErrorDialog("Signup Failed", "Name is required.");
                    } else if (!emailRegex.hasMatch(_emailController.text)) {
                      _showErrorDialog("Signup Failed", "Invalid Email Address.");
                    } else if (!passwordRegex.hasMatch(_passwordController.text)) {
                      _showErrorDialog(
                        "Signup Failed",
                        "Password must be at least 8 characters long and include at least 1 letter and 1 number.",
                      );
                    } else if (_passwordController.text != _confirmPasswordController.text) {
                      _showErrorDialog("Signup Failed", "Passwords do not match.");
                    } else {
                      // Proceed with signup
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignupConfirm()),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent, // Transparent to show gradient
                    shadowColor: Colors.transparent, // Remove default shadow
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text(
                    "SIGNUP",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // White text for contrast
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 70),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(
                      fontSize: 14.0,
                      decoration: TextDecoration.underline, // Underline the text
                      color: Color(0xFF2EBFF4),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                    child: const Text(
                      " Login",
                      style: TextStyle(
                        fontSize: 14.0,
                        decoration: TextDecoration.underline, // Underline the text
                        color: Color(0xFF2EBFF4),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable Input Field Widget
  Widget _buildInputField(BuildContext context,
      {required TextEditingController controller,
      required IconData icon,
      required String labelText,
      required bool isPassword}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.75, // 80% of the screen width
      child: Row(
        children: [
          // Icon Container
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: const Color(0xFF96E3FF),
            ),
            child: Padding(
              padding: const EdgeInsets.all(7.5),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 10), // Space between icon and text field
          // Text Field
          Expanded(
            child: SizedBox(
              height: 40,
              child: TextFormField(
                controller: controller,
                obscureText: isPassword
                    ? !_isPasswordVisible
                    : false, // Toggle visibility for password
                decoration: InputDecoration(
                  labelText: labelText,
                  hintStyle: const TextStyle(color: Colors.black54, fontSize: 14),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: Color(0xFF00BBFF),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: Colors.blueAccent),
                  ),
                  suffixIcon: isPassword
                      ? IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: const Color(0xFF2EBFF4),
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible =
                                  !_isPasswordVisible; // Toggle visibility
                            });
                          },
                        )
                      : null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Show error dialog
  void _showErrorDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}