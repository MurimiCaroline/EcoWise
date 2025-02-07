// import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Image(image: AssetImage('assets/images/ic_launcher.png'),
         height: 200,
         width: 200,
          ),
          
          Center(
            child: Text("Welcome to Ecowise Home"),
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
                          "Proceed to  Energy Audit",
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