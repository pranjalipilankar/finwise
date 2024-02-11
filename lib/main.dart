import 'package:finwise/screens/choice_screen.dart';
import 'package:flutter/material.dart';

final theme = ThemeData(
  colorScheme: const ColorScheme.dark().copyWith(
    primary: Colors.white,
    secondary: Colors.blue[800],
      ),
);


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: theme,
      home: const ChoiceScreen(),
    );
  }
}
