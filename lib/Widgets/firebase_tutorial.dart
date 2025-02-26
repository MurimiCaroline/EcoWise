// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';

// class Devices extends StatefulWidget {
//   const Devices({super.key});

//   @override
//   State<Devices> createState() => _DevicesState();
// }

// class _DevicesState extends State<Devices> {

//   final Future<FirebaseApp> _fApp = Firebase.initializeApp();
//   String realTimeValue = '';
//   String getOnceValue = '' ;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Welcome To EcoWise"),
//         ),
//         body: FutureBuilder(future: _fApp, 
//         builder: (context, snapshot){
//           if(snapshot.hasError){
//             return Text("Something wrong with firebase");
//           }
//           else if (snapshot.hasData){
//             return content();
//           }
//             else{
//               return CircularProgressIndicator();
//             }
//         }),
//     );
//   }

//   Widget content(){
//     DatabaseReference _testRef = FirebaseDatabase.instance.ref().child('count');
//     _testRef.onValue.listen(
//       (event){
//   setState(() {
//     realTimeValue = event.snapshot.value.toString();
//   });
//     },
//     );
//   return Container(child: Column(
//   mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       Center(
//         child: Text("Real Time Counter: $realTimeValue "),
//       ),
//       SizedBox(
//         height: 50,
//       ),
//       GestureDetector(
//       onTap: () async {
//         final snapshot = await _testRef.get();
//             if(snapshot.exists){
//               setState(() {
//                 getOnceValue = snapshot.value.toString();
//               });
//             }
//             else {
//               print("No data available!!");
//             }
//       },
//         child: Text("Get Once", style: TextStyle(color: Colors.deepPurpleAccent),),
//       ),
//       SizedBox(
//         height: 50,
//       ),
//       Center(child: Text("Get Once Counter :  $getOnceValue "),
//       )
//     ],
//   ),
//   );
// }
// }

