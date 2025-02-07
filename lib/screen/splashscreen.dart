import 'package:flutter/material.dart';



class SplashScreen extends StatefulWidget {
  final Widget? child;
  const SplashScreen({super.key, this.child});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      (){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => widget.child! ), (route) => false);
      }
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(image: AssetImage('assets/images/ic_launcher.png'),
         height: 200,
         width: 200,
          ),
          Text("WELCOME TO ECOWISE",
          style: TextStyle(
            color: Colors.amber,
          fontWeight: FontWeight.bold,
          ),
          ),
          
        ],
      ),
    );
  }
}