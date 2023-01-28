import 'package:flutter/material.dart';

//? 1. Создали класс дял хр. трех переменных
class TwoStrings {
  final String text;
  final String text2;

  TwoStrings({required this.text, required this.text2});
}

class ListsData extends StatelessWidget {
  ListsData({Key? key}) : super(key: key);
  //? 2. Создали массив с данными с типом TwoStrings которые хр. объекты
  final List<TwoStrings> textData = [
    TwoStrings(text: '1.1', text2: '1.2'),
    TwoStrings(text: '2.1', text2: '2.2'),
    TwoStrings(text: '3.1', text2: '3.2'),
  ];
  @override
  Widget build(BuildContext context) {
    // 1. Перебираем массив строк
    //! 2. в первом цикле 1.TextWrapper виджет выводит 1
    //! 2. в втором цикле второй интекс берет TextWrapper выводит 2
    //! 3 etc
    final List<Widget> newText = textData
        // todo не оптимизирван
        .map((TwoStrings twoStrings) => TextWrapper(
              text: twoStrings.text,
              text2: twoStrings.text2,
            ))
        .toList();

//???? не будем оборачивать в квадратные скобки потому-что получиться вложенный массив
    return Column(children: newText);
  }
}

class TextWrapper extends StatelessWidget {
  // todo не оптимизирван
  final String text;
  final String text2;
  const TextWrapper({Key? key, required this.text, required this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            print(text);
          },
          child: Text(text),
        ),
        ElevatedButton(
          onPressed: () {
            print(text2);
          },
          child: Text(text2),
        ),
      ],
    );
  }
}
