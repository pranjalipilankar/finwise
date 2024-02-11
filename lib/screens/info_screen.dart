import 'package:flutter/material.dart';
import 'package:finwise/screens/chatbot/chat_screen.dart';

class InvestmentInfoPage extends StatelessWidget {
  const InvestmentInfoPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('General Investment Information'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Investment Information',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula odio vitae nisl fringilla, id ullamcorper leo porttitor. Duis feugiat, dui ac dictum ultrices, metus neque placerat arcu, vitae ultrices velit ligula ac sapien.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula odio vitae nisl fringilla, id ullamcorper leo porttitor. Duis feugiat, dui ac dictum ultrices, metus neque placerat arcu, vitae ultrices velit ligula ac sapien.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula odio vitae nisl fringilla, id ullamcorper leo porttitor. Duis feugiat, dui ac dictum ultrices, metus neque placerat arcu, vitae ultrices velit ligula ac sapien.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ChatScreen()),
                  );
                },
                child: const Text('Go to Chat Bot'),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}