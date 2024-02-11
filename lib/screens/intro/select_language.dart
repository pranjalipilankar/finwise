import 'package:flutter/material.dart';
import 'package:finwise/screens/auth/login_page.dart';
import 'package:finwise/auth/auth_screen.dart';

class LanguagePage extends StatefulWidget {
  final List<String> languages = ['English','हिन्दी (Hindi)', 'मराठी (Marathi)', 'गुजराती (Gujarati)',
    'ਪੰਜਾਬੀ (Punjabi)', 'उर्दू (Urdu)', 'ओडिया (Odia)',  'नेपाली (Nepali)', 'कश्मीरी (Kashmiri)', 'सिंधी (Sindhi)', 'தமிழ் (Tamil)',
    'తెలుగు (Telugu)', 'ಕನ್ನಡ (Kannada)', 'മലയാളം (Malayalam)', 'অসমীয়া (Assamese)', 'कोण्कणी (Konkani)', ];

  LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  String? selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Language"),
      ),
      body: ListView.builder(
        itemCount: widget.languages.length,
        itemBuilder: (context, index) {
          final language = widget.languages[index];
          return ListTile(
            title: Text(language),
            trailing: selectedLanguage == language
                ? const Icon(Icons.check, color: Colors.blue)
                : null,
            onTap: () {
              setState(() {
                selectedLanguage = language;
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
          );
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}