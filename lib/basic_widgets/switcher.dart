import 'package:flutter/material.dart';

class Switcher extends StatefulWidget {
  const Switcher({Key? key}) : super(key: key);

  @override
  _SwitcherState createState() => _SwitcherState();
}

class _SwitcherState extends State<Switcher> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisSpacing: 20,
      crossAxisCount: 4,
      children: [
        ElevatedButton(onPressed: () {}, child: const Text('HEllo')),
        ElevatedButton(onPressed: () {}, child: const Text('HEllo')),
        ElevatedButton(onPressed: () {}, child: const Text('HEllo')),
        ElevatedButton(onPressed: () {}, child: const Text('HEllo')),
        ElevatedButton(onPressed: () {}, child: const Text('HEllo')),
        ElevatedButton(onPressed: () {}, child: const Text('HEllo')),
        ElevatedButton(onPressed: () {}, child: const Text('HEllo')),
      ],
    );
  }
}
