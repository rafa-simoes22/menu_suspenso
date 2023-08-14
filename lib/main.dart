import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emoções App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EmotionsScreen(),
    );
  }
}

class EmotionsScreen extends StatefulWidget {
  @override
  _EmotionsScreenState createState() => _EmotionsScreenState();
}

class _EmotionsScreenState extends State<EmotionsScreen> {
  String? selectedEmotion; // Default: None selected
  Color backgroundColor = Colors.white;
  Color fontColor = Colors.black;

  void updateEmotion(String emotion) {
    setState(() {
      selectedEmotion = emotion;
      switch (emotion) {
        case "Amigável":
          backgroundColor = Colors.orange;
          fontColor = Colors.white;
          break;
        case "Em paz":
          backgroundColor = Colors.green;
          fontColor = Colors.white;
          break;
        case "Confiante":
          backgroundColor = Colors.blue;
          fontColor = Colors.white;
          break;
        case "Animado":
          backgroundColor = Colors.yellow;
          fontColor = Colors.black;
          break;
        default:
          backgroundColor = Colors.white;
          fontColor = Colors.black;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emoções App'),
      ),
      body: Container(
        color: backgroundColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DropdownButton<String>(
                hint: Text("Selecione"), // Initial hint
                value: selectedEmotion,
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    updateEmotion(newValue);
                  }
                },
                items: <String>[
                  'Amigável',
                  'Em paz',
                  'Confiante',
                  'Animado',
                ].map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  },
                ).toList(),
              ),
              if (selectedEmotion != null)
                SizedBox(height: 20),
                Text(
                  "Mensagem de $selectedEmotion",
                  style: TextStyle(
                    color: fontColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
