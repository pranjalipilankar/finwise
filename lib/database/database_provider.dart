import 'package:finwise/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userCollectionProvider = FutureProvider((ref) {
  final database = ref.read(databaseProvider);
  final collection =
      database.listDocuments(databaseId: 'database1', collectionId: 'users');
  return collection;
});
