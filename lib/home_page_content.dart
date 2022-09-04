import 'package:flutter/material.dart';

class HomePageContent extends StatelessWidget {
  const HomePageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      crossAxisCount: 2,
      children: <Widget>[
        Card(
          child: Text('Card 1'),
        ),
        Card(
          child: Text('Card 2'),
        ),
        Card(
          child: Text('Card 3'),
        ),
        Card(
          child: Text('Card 4'),
        ),
        Card(
          child: Text('Card 5'),
        ),
        Card(
          child: Text('Card 6'),
        ),
      ],
    );
  }
}
