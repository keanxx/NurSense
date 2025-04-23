import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nursense/auth/login.dart';

class SignupConfirm extends StatelessWidget {
  const SignupConfirm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(5), // Specify the height of the AppBar
        child: AppBar(
          backgroundColor: const Color(0xFF47CEFF),
        ),
      ),
      body: Container(
        color: Color(0xFFD8F5FF),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              SvgPicture.asset("assets/images/nursenseLogo.svg",
              height: 85,
              width: 85,),

              SizedBox(height: 39,),

              Text("Thank you for signing up.", 
                    style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600, 
                    color: Color(0xFF3DC0EF)),),
               Text("log in to your account.", 
                    style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500, 
                    color: Color(0xFF3DC0EF)),),

                SizedBox(
                height: 40,),
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
                   Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.transparent, // Transparent to show gradient
                    shadowColor: Colors.transparent, // Remove default shadow
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 5),
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
            ],
          ),
        ),
      ),
    );
  }
}