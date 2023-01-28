import 'package:flutter/material.dart';

class Heroes extends StatelessWidget {
  const Heroes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        Navigator.of(context).push(
          MaterialPageRoute(builder: ((context) => const DetailPage())),
        );
      },
      child: Hero(
        tag: 'imageHero',
        child: Image.network(
          'https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?cs=srgb&dl=pexels-pixabay-268533.jpg&fm=jpg',
          width: 300,
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Hero(
      tag: 'imageHero',
      child: Image(
        image: NetworkImage(
            'https://images.pexels.com/photos/268533/pexels-photo-268533.jpeg?cs=srgb&dl=pexels-pixabay-268533.jpg&fm=jpg'),
      ),
    );
  }
}
