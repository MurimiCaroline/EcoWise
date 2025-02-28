import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String geminiApiKey = "AIzaSyBRp848rmMGd3zErs5x6-e7Jzu18JIvZn0"; // Replace with your Gemini API Key

class AIRecommendationsScreen extends StatefulWidget {
  const AIRecommendationsScreen({super.key});

  @override
  _AIRecommendationsScreenState createState() =>
      _AIRecommendationsScreenState();
}

class _AIRecommendationsScreenState extends State<AIRecommendationsScreen> {
  String selectedHostel = 'Hostel A';
  String connectionStatus = "Checking...";
  String aiResponse = "Fetching recommendations...";
  Map<String, dynamic>? jsonData;
  bool hasConnection = true; // Add a boolean to track connection status

  @override
  void initState() {
    super.initState();
    fetchDatabaseData();
  }

  Future<void> fetchDatabaseData() async {
    try {
      final response = await http.get(Uri.parse(
          "https://ecowise-2972a-default-rtdb.europe-west1.firebasedatabase.app/Devices.json"));
      if (response.statusCode == 200) {
        setState(() {
          connectionStatus = "Connected";
          jsonData = jsonDecode(response.body);
          hasConnection = true; // Connection successful
        });
        fetchAiRecommendations(jsonData);
      } else {
        setState(() {
          connectionStatus = "Check your connection!";
          aiResponse = "Failed to fetch data.";
          hasConnection = false; // Connection failed
        });
      }
    } catch (e) {
      setState(() {
        connectionStatus = "Check your connection!";
        aiResponse = "Error fetching data: ${e.toString()}";
        hasConnection = false; // Connection failed
      });
    }
  }

  Future<void> fetchAiRecommendations(Map<String, dynamic>? jsonData) async {
    if (jsonData == null) {
      setState(() {
        aiResponse = "No data available.";
      });
      return;
    }

    // Format jsonData into a more readable string.
    String dataString = "";
    jsonData.forEach((key, value) {
      dataString += "$key: $value, ";
    });
    //Remove the last ", "
    if (dataString.isNotEmpty) {
      dataString = dataString.substring(0, dataString.length - 2);
    }

    final String prompt = """
    How do I save energy for $selectedHostel? Provide 5 points with a brief explanation. Here is the data from the hostel: $dataString""";

    print("Sending prompt to Gemini API: $prompt");

    try {
      final response = await http.post(
        Uri.parse(
            "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=$geminiApiKey"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "contents": [
            {
              "parts": [
                {"text": prompt}
              ]
            }
          ]
        }),
      );

      print("Response Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        setState(() {
          aiResponse =
              decoded["candidates"][0]["content"]["parts"][0]["text"].toString();
        });
      } else {
        setState(() {
          aiResponse = "Failed to fetch AI recommendations. Try again later.";
        });
      }
    } catch (e) {
      print("Error: $e");
      setState(() {
        aiResponse = "Error: ${e.toString()}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E1E1E),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "AI Recommendations",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 10),
                Image.asset(
                  'assets/images/ic_launcher.png',
                  width: 30,
                  height: 30,
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "To save energy for:",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 10),
                DropdownButton<String>(
                  value: selectedHostel,
                  dropdownColor: Colors.grey[800],
                  style: TextStyle(color: Colors.white),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedHostel = newValue!;
                      aiResponse = "Fetching recommendations...";
                    });
                    fetchAiRecommendations(jsonData);
                  },
                  items: <String>['Hostel A', 'Hostel B', 'Hostel C', 'Hostel D']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              connectionStatus,
              style: TextStyle(
                fontSize: 16,
                color: connectionStatus == "Connected" ? Colors.green : Colors.red,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                color: Colors.grey[800],
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: hasConnection
                      ? RichText(
                          text: _buildRichText(aiResponse),
                          textAlign: TextAlign.left,
                        )
                      : const Text(
                          "Couldn't fetch Data",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextSpan _buildRichText(String text) {
    final RegExp boldRegex = RegExp(r'\*(.*?)\*');
    final List<TextSpan> textSpans = [];
    int currentIndex = 0;

    boldRegex.allMatches(text).forEach((match) {
      if (match.start > currentIndex) {
        textSpans.add(TextSpan(
          text: text.substring(currentIndex, match.start),
          style: TextStyle(color: Colors.white, fontSize: 16),
        ));
      }
      textSpans.add(TextSpan(
        text: match.group(1),
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ));
      currentIndex = match.end;
    });

    if (currentIndex < text.length) {
      textSpans.add(TextSpan(
        text: text.substring(currentIndex),
        style: TextStyle(color: Colors.white, fontSize: 16),
      ));
    }
    return TextSpan(children: textSpans);
  }
}