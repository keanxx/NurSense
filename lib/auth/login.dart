import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nursense/admin/levels.dart';
import 'package:nursense/userPages/onboarding.dart';
import 'package:nursense/auth/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isPasswordVisible = false; // State to toggle password visibility
  final _emailController = TextEditingController(); // Controller for email input
  final _passwordController = TextEditingController(); // Controller for password input

  // Regex for email validation
  final RegExp emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

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
                "Welcome to NurSense",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                  color: Color(0xFF2EBFF4),
                ),
              ),
              const Text(
                "quiz & reviewer for all nursing students",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF3DC0EF),
                ),
              ),
              const SizedBox(height: 50),
              const Text(
                "Login to your account",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF3DC0EF),
                ),
              ),
              const SizedBox(height: 30),

              // Email Field
              _buildInputField(
                context,
                controller: _emailController,
                icon: Icons.mail_outline,
                labelText: "Enter your Email",
                isPassword: false,
              ),

              const SizedBox(height: 20), // Space between fields

              // Password Field
              _buildInputField(
                context,
                controller: _passwordController,
                icon: Icons.key_outlined,
                labelText: "Enter your Password",
                isPassword: true,
              ),

              const SizedBox(height: 40),

              // Login Button
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
                    // Validate email and password
                    if (!emailRegex.hasMatch(_emailController.text)) {
                      _showErrorDialog("Log in Failed", "Invalid Email Address");
                    } else if (_passwordController.text.isEmpty) {
                      _showErrorDialog("Log in Failed", "Password is required.");
                    } else {
                      // Proceed with login
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Onboarding()),
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
                    "LOGIN",
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
                    "Don't have an account?",
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
                        MaterialPageRoute(builder: (context) => const Signup()),
                      );
                    },
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 14.0,
                        decoration: TextDecoration.underline, // Underline the text
                        color: Color(0xFF2EBFF4),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Levels()));
                  }, child: Text("admin"))
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