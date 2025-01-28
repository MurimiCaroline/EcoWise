import 'package:flutter/material.dart';

class InputForm extends StatefulWidget {
  const InputForm({super.key});

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {

final _textcontroller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input Energy Consumption Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _textcontroller,
              decoration: InputDecoration(
                hintText: "What is devices do you have?",
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    _textcontroller.clear();
                  },
                  icon: Icon(Icons.clear),
                ),
              ),
            ),
            MaterialButton(onPressed: (){},
            color: Colors.blueGrey[900],
            child: Text("Submit"),
                  ),
          ],
      ),
      ),
    );
  }
}