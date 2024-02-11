import 'package:finwise/langchain/langchain.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChatBotScreen extends StatefulHookConsumerWidget {
  const ChatBotScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends ConsumerState<ConsumerStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    final conversationNotifier =
        ref.watch(conversationNotifierProvider.notifier);
    final conversation = ref.watch(conversationNotifierProvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SelectableText(conversation.value ?? ''),
              TextField(
                onSubmitted: (value) {
                  conversationNotifier.run(value);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
