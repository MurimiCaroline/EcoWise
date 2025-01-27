import 'package:eco_wise/src/Features/auth/screen/login.dart';
import 'package:eco_wise/src/Features/auth/screen/widgets/form_container_widget.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
        backgroundColor: Colors.amber,
      ),
      body:  Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Sign Up", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
              SizedBox(
                height: 30,
                ),
                FormContainerWidget(
                  hintText: "Email",
                  isPasswordField: false,
                ),
                SizedBox(height: 10),
                FormContainerWidget(
                  hintText: "Password",
                  isPasswordField: true,
                  ),
                  SizedBox(height: 10),
                  FormContainerWidget(
                  hintText: "Username",
                  isPasswordField: false,
                ),
                SizedBox(height: 30,),
                  Container(
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),),
                      child: Center(child: Text("Sign Up", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                  ),
                  SizedBox(height: 30,),
                  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("ALready an account?"),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LogInPage()),
                            (route) => false,
                      );
                    },
                    child: Text(
                      "Log In",
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
}