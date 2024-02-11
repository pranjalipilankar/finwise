import 'package:flutter/material.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
            },
          ),
        ],
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: PageView(
          scrollDirection: Axis.horizontal,
          children: const [
            CustomImageContainer(
              imageUrl:
              'https://img.freepik.com/free-vector/hand-drawn-flat-design-stock-market-concept_23-2149154265.jpg?w=1380&t=st=1707659013~exp=1707659613~hmac=856f11662a0e5425ba33f7e8368c33346569dd8ad3ec63679f1998003f4f615b',
              headline: 'Investments',
              description: '',
            ),
            CustomImageContainer(
              imageUrl:
              'https://media.istockphoto.com/id/1264245444/vector/goal-achievement-business-concept-sport-target-icon-and-arrows-in-the-bullseye-tiny-person.jpg?s=612x612&w=0&k=20&c=UQyoFnu4hv3M1Rvllk-EwCgbGReTQtribu6LG0nIdZQ=',
              headline: 'Goals',
              description: '',
            ),
            CustomImageContainer(
              imageUrl:
              'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a2/Vijay_Chowk_at_Rajpath%2C_with_Secretariat_Buildings_in_the_background%2C_New_Delhi.jpg/2560px-Vijay_Chowk_at_Rajpath%2C_with_Secretariat_Buildings_in_the_background%2C_New_Delhi.jpg',
              headline: 'Schemes',
              description: '',
            ),
          ],
        ),
      ),
    );
  }
}


class CustomImageContainer extends StatelessWidget {
  const CustomImageContainer({
    required this.imageUrl,
    required this.headline,
    required this.description,
    super.key,
  });

  final String imageUrl;
  final String headline;
  final String description;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(
              imageUrl: imageUrl,
              headline: headline,
              description: description,
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4),
                    BlendMode.darken,
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      headline,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    required this.imageUrl,
    required this.headline,
    required this.description,
    super.key,
  });

  final String imageUrl;
  final String headline;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              height: 200, // Adjust as needed
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                headline,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(description),
            ),
          ],
        ),
      ),
    );
  }
}