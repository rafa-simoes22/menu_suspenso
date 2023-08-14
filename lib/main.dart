import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String selectedOption = "Amigável";
  String message = "Escolha uma opção";

  Map<String, Color> colorMap = {
    "Amigável": Colors.orange,
    "Em Paz": Colors.green,
    "Confiante": Colors.blue,
    "Animado": Colors.yellow,
  };

  void _onOptionChanged(String? option) {
    if (option != null) {
      setState(() {
        selectedOption = option;
        message = "Você está se sentindo $option!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Menu Suspenso"),
        ),
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton<String>(
                value: selectedOption,
                onChanged: _onOptionChanged,
                items: ["Amigável", "Em Paz", "Confiante", "Animado"]
                    .map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Text(
                message,
                style: TextStyle(
                  fontSize: 20,
                  color: colorMap[selectedOption],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
