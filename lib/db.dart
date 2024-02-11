import 'dart:developer';

import 'package:appwrite/appwrite.dart';

final client = Client()
    .setEndpoint('https://cloud.appwrite.io/v1') // Your API Endpoint
    .setProject('finwiseapp'); // Your project ID

final databases = Databases(client);

Future<void> test() async {
  try {
    await databases.createDocument(
        databaseId: 'database1',
        collectionId: '65c7616c105327170ac2',
        documentId: ID.unique(),
        data: {'name': 'John Doe', 'age': 29});
  } on Exception catch (e) {
    log('Exception when calling createDocument: $e\n');
  }
}
