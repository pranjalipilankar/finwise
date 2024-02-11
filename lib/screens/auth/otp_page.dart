import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:finwise/screens/choice_screen.dart';
import 'package:finwise/auth/auth_provider.dart';
import 'package:finwise/auth/auth_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OtpPage extends HookConsumerWidget {
  const OtpPage({super.key, required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      print('UserID: $userId');
      return null; // cleanup function is not needed, return null
    }, []);
    final authState = ref.watch(authProvider);
    final userIdController = useTextEditingController();

    String OTP = '';
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
        title: const Text('Verification Code'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20.0),
              const Text(
                'We have sent a verification code to your mobile number.\nPlease enter the code below to continue.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 100.0),

              OtpTextField(
                numberOfFields: 6,
                borderColor: const Color(0xFF512DA8),
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },

                onSubmit: (String verificationCode){
                  OTP = verificationCode;
                  showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          title: const Text("Verification Code"),
                          content: Text('Code entered is $verificationCode'),
                        );
                      }
                  );
                }, // end onSubmit
              ),

              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Add functionality to verify OTP
                  ref.read(authProvider.notifier).loginWithOTP(
                    userId,
                    OTP,
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ChoiceScreen()),
                  );
                },
                child: const Text('Verify OTP'),
              ),
              const SizedBox(height: 40.0),
              ElevatedButton(
                onPressed: () {
                  // Add functionality to resend OTP
                },
                child: const Text('Resend OTP'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}