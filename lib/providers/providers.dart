import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:appwrite/appwrite.dart';

final clientProvider = Provider((ref) {
  final client = Client()
      .setEndpoint("https://cloud.appwrite.io/v1")
      .setProject('finwiseapp');
  return client;
});

final accountProvider = Provider((ref) {
  final client = ref.read(clientProvider);
  final account = Account(client);
  return account;
});

final databaseProvider = Provider((ref) {
  final client = ref.read(clientProvider);
  final database = Databases(client);
  return database;
});
