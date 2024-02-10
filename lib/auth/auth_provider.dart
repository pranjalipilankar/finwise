import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:finwise/auth/auth_state.dart';
import 'package:finwise/providers/client_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider =
    NotifierProvider<AuthNotifier, AuthState>(AuthNotifier.new);

class AuthNotifier extends Notifier<AuthState> {
  Future<String> sendOTP(String number) async {
    final client = ref.read(clientProvider);
    final account = Account(client);
    final sessionToken = await account.createPhoneSession(
      userId: ID.unique(),
      phone: number,
    );

    return sessionToken.userId;
  }

  void loginWithOTP(String userId, String otp) async {
    try {
      final client = ref.read(clientProvider);
      final account = Account(client);
      final session = await account.updatePhoneSession(
        userId: userId,
        secret: otp,
      );

      if (session.current) {
        state = AuthState.authenticated;
      } else {
        state = AuthState.unauthenticated;
      }
    } on Exception catch (e) {
      log('Exception: $e');
    }
  }

  @override
  AuthState build() {
    return AuthState.uninitialized;
  }
}
