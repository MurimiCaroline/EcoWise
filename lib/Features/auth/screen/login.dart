import 'package:eco_wise/Core/constants/colours.dart';
import 'package:eco_wise/Features/auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:eco_wise/Features/auth/screen/signup.dart';
import 'package:eco_wise/Features/auth/screen/widgets/form_container_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {

final FirebaseAuthService _auth = FirebaseAuthService();

 
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

@override
  void dispose() {
   _emailController.dispose();
   _passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log In"),
        backgroundColor:cardBackgroundColor,
      ),
      body:  Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Log In", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
              SizedBox(
                height: 30,
                ),
                FormContainerWidget(
                  controller: _emailController,
                  hintText: "Email",
                  isPasswordField: false,
                ),
                SizedBox(height: 10),
                FormContainerWidget(
                  controller: _passwordController,
                  hintText: "Password",
                  isPasswordField: true,
                  ),
                SizedBox(height: 30,),
                  GestureDetector(
                    onTap: _signIn,
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                        color: cardBackgroundColor,
                        borderRadius: BorderRadius.circular(10),),
                        child: Center(child: Text("Log In", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                    ),
                  ),
                  SizedBox(height: 20,),
                    Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                            (route) => false,
                      );
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.blue,
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


void _signIn() async {
   
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

if (user != null) {
     print("User is successfully signed in");
     Navigator.pushNamed(context, "/home");

    } else {
      print("Some error happend");
    }

}


}