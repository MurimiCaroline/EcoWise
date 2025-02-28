// import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
         Image(image: AssetImage('assets/images/ic_launcher.png'),
         height: 300,
         width: 300,
          ),
          
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
        "Welcome to Ecowise",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      SizedBox(height: 15),
      Text(
        "Your Energy Management App", // Add your new text here
        style: TextStyle(
          fontSize: 16, // Adjust the font size as needed
          color: Colors.white,
        ),
      ),
              ],
            ),
            
            ),
                  SizedBox(height: 40,),
                  // GestureDetector(
                  //   onTap: () {
                  //     FirebaseAuth.instance.signOut();
                  //     Navigator.pushNamed(context, "/logIn");
                  //   },
                  //   child: Container(
                  //     height: 45,
                  //     width: 100,
                  //     decoration: BoxDecoration(
                  //       color: Colors.blueAccent,
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //     child: Center(
                  //       child: Text(
                  //         "Sign Out",
                  //         style: TextStyle(
                  //           color: Colors.white,

                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      
                      Navigator.pushNamed(context, "/dashboard");
                    },
                    child: Container(
                      height: 45,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          "Energy Audit",
                          style: TextStyle(
                            color: Colors.white,

                          ),
                        ),
                      ),
                    ),
                  ),
              //  GestureDetector(
              //       onTap: () {
                      
              //         ChatPage();
              //       },
              //       child: Container(
              //         height: 45,
              //         width: 100,
              //         decoration: BoxDecoration(
              //           color: Colors.blueAccent,
              //           borderRadius: BorderRadius.circular(12),
              //         ),
              //         child: Center(
              //           child: Text(
              //             "Proceed to  AI recommendation",
              //             style: TextStyle(
              //               color: Colors.white,

              //             ),
              //           ),
              //         ),
              //       ),
              //     ),   
        ],
      ),
        
    );
  }
}