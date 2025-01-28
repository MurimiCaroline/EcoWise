import 'package:eco_wise/src/Features/auth/screen/homepage.dart';
import 'package:eco_wise/src/Features/auth/screen/login.dart';
import 'package:eco_wise/src/Features/splash/splashscreen.dart';
import 'package:eco_wise/src/Features/user%20data/input_form.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  if(kIsWeb){
    await Firebase.initializeApp(options: const FirebaseOptions(
    apiKey: "AIzaSyCiy6Z0ajtirFAf0paYdNVhGYBQOfqamkk",
    appId: "1:1022578629737:web:54b5d134b4192d002d56f8", 
    messagingSenderId: "1022578629737",
    projectId: "ecowise-2972a"));
  }
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

    @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
               colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(
        child: LogInPage(),
      ),
      routes: {
        '/home': (context) => HomePage(),
        '/logIn' : (context) => LogInPage(),
        '/inputForm' : (context) => InputForm(),
        

      },
    );
  }
}



  

 
