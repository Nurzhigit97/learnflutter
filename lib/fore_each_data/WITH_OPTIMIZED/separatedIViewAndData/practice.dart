import 'package:flutter/material.dart';
import 'package:learnflutter/fore_each_data/WITH_OPTIMIZED/separatedIViewAndData/practice_view.dart';

class User {
  final int id;
  final String name;
  final String lastName;
  final String img;
  final int age;
  final List<String> skills;

  User(
      {required this.id,
      required this.name,
      required this.lastName,
      required this.img,
      required this.age,
      required this.skills});
}

class Practice extends StatelessWidget {
  Practice({Key? key}) : super(key: key);

  List<User> strs = [
    User(
        id: 1,
        name: 'Nur',
        lastName: 'Shaidiev',
        img:
            'https://cdn.pixabay.com/photo/2020/07/01/12/58/icon-5359553_1280.png',
        age: 28,
        skills: ['Html', 'css', 'react', 'flutter', 'django', 'sass']),
    User(
        id: 2,
        name: 'Nur2',
        lastName: 'Shaidiev2',
        img:
            'https://cdn.pixabay.com/photo/2020/07/01/12/58/icon-5359553_1280.png',
        age: 28,
        skills: [
          'Html',
          'css',
          'react',
          'flutter',
          'django',
        ]),
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> newStrs = strs.map((User e) => WrapperBtn(text: e)).toList();

    return Column(
      children: newStrs,
    );
  }
}
