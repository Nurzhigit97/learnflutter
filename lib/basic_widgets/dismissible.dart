import 'package:flutter/material.dart';

class Dismissible extends StatefulWidget {
  const Dismissible({Key? key}) : super(key: key);

  @override
  _DismissibleState createState() => _DismissibleState();
}

class _DismissibleState extends State<Dismissible> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: [1, 2, 3, 4, 5].length,
      itemBuilder: (context, index) {
        return const Dismissible();
      },
    );
  }
}
