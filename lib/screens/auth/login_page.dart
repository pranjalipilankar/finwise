import 'dart:developer';

import 'package:finwise/auth/auth_provider.dart';
import 'package:finwise/auth/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:finwise/screens/auth/signup_page.dart';
import 'package:finwise/screens/auth/otp_page.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log(ref.watch(authProvider).asData?.value.toString() ?? 'No data');
    final mobileNumberController = useTextEditingController();
    final userIdController = useTextEditingController();
    final authState = ref.watch(authProvider);
    ref.read(authProvider.notifier).checkAuth();
    if (authState.value == AuthState.authenticated) {
      return const Scaffold(
        body: Center(
          child: Text('Authenticated!}'),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Image.network(
                      "https://sps.iitmandi.ac.in/images/iitlogo.png",
                    ),
                  ),
                ),
                const Text(
                  "Finwise",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: mobileNumberController,
                  decoration: const InputDecoration(
                    labelText: 'Mobile Number',
                  ),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(authProvider.notifier)
                        .sendOTP(
                          mobileNumberController.text,
                        )
                        .then((value) {
                      userIdController.text = value;
                      print("UserID: ${userIdController.text}");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              OtpPage(userId: userIdController.text),
                        ),
                      );
                    });
                  },
                  child: const Text('Send OTP'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpPage(),
                            ),
                          );
                        },
                        child: const Text("Sign Up"),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
