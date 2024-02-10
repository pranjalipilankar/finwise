import 'package:appwrite/appwrite.dart';

void main() async {
    final client = Client()
        .setEndpoint("https://cloud.appwrite.io/v1")
        .setProject("finwiseapp")

    final databases = Databases(client);

    try {
        final documents = await databases.listDocuments(
            databaseId: 'database1',
            collectionId: '65c7616c105327170ac2',
            queries: [
                Query.equal('title', 'Avatar')
            ]
        );
    } on AppwriteException catch(e) {
        print(e);
    }
}
