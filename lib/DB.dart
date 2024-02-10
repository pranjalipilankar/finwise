import 'package:appwrite/appwrite.dart';

final client = Client()
    .setEndpoint('https://cloud.appwrite.io/v1')  // Your API Endpoint
    .setProject('finwiseapp');                // Your project ID

final databases = Databases(client);

await databases.createDocument(
  databaseId: 'database1',
  collectionId: '65c7616c105327170ac2',
  documentId: ID.unique(),
  data: {
    'title': 'Spiderman',
    'year': 2002,
    'reviews': [
      { 'author': 'Bob', 'text': 'Great movie!' },
      { 'author': 'Alice', 'text': 'Loved it!' }
    ]
  },
)
