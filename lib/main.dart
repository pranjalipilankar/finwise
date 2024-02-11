import 'package:finwise/screens/auth/otp_page.dart';
import 'package:finwise/screens/auth/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:finwise/screens/auth/login_page.dart';
import 'package:finwise/screens/intro/select_language.dart';
import 'package:finwise/screens/intro/intro_page.dart';
import 'package:finwise/screens/chatbot/chat_screen.dart';
import 'package:finwise/screens/activity_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final theme = ThemeData(
  colorScheme: const ColorScheme.dark().copyWith(
    primary: Colors.white,
    secondary: Colors.blue[800],
      ),
);

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
  // conversationTest();
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: theme,
      home: const IntroPage(),
      title: 'FinWise App',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
