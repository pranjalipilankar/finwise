import 'package:flutter/material.dart';
import 'package:finwise/screens/intro/select_language.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: size.height,
          ),
          child: SafeArea(
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildLogo(size),
                  buildTitle(size),
                  buildTnC(context),
                  buildButton(size, context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLogo(Size size) {
    return SizedBox(
      height: size.height * 0.3,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: AppLogo(
          size: size.height * 0.24,
        ),
      ),
    );
  }

  Widget buildTitle(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          const Text(
            'Finwise',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Text(
            'Your Intelligent Financial Advisor',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: size.height * 0.2),
        ],
      ),
    );
  }

  Widget buildTnC(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'By continuing, you agree to our ',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          GestureDetector(
            onTap: () {
              _showTermsAndConditionsDialog(context);
            },
            child: const Text(
              'Terms and Conditions',
              style: TextStyle(
                fontSize: 12,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showTermsAndConditionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Terms and Conditions'),
          content: const SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                      'Nullam nec sapien at nisi tristique fringilla in eu urna. '
                      'Vivamus sit amet velit faucibus, mattis tortor eu, '
                      'consectetur justo. Proin vel magna dictum, rhoncus sapien ut, '
                      'posuere sem. Integer condimentum malesuada ligula, ac tempor dui. '
                      'Fusce vel justo non est tempor dignissim.',
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Perform action after user agrees to terms
                // For example, navigate to next page or perform a function
              },
              child: const Text('I Agree'),
            ),
          ],
        );
      },
    );
  }

  Widget buildButton(Size size, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LanguagePage(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 100.0),
        child: Container(
          width: 50.0,
          height: 50.0,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
          ),
          child: const Center(
            child: Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class AppLogo extends StatelessWidget {
  const AppLogo({
    this.size = 154,
    super.key,
  });

  final double size;
  static const _logo = 'assets/images/logo.png';

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'logo',
      child: SizedBox(
        width: size,
        height: size,
        child: const CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage(_logo),
        ),
      ),
    );
  }
}