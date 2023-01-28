import 'dart:math';

import 'package:flutter/material.dart';

/* 
UniqueKey
ValueKey
ObjectKey

корректное перемещения виджета в дереве виджетов.

PageStorageKey-сох. стандартного состояния виджета(позиция, скрола, фокус)в те моменты когда он уд. из дерева.
Например при переключении вкладок  
 */

class LocalKeyUniqueValueKey extends StatefulWidget {
  const LocalKeyUniqueValueKey({Key? key}) : super(key: key);

  @override
  _LocalKeyUniqueValueKeyState createState() => _LocalKeyUniqueValueKeyState();
}

class _LocalKeyUniqueValueKeyState extends State<LocalKeyUniqueValueKey> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 400,
      height: 300,
      child: PositionedTiles(),
    );
  }
}

class PositionedTiles extends StatefulWidget {
  const PositionedTiles({Key? key}) : super(key: key);

  @override
  _PositionedTilesState createState() => _PositionedTilesState();
}

class _PositionedTilesState extends State<PositionedTiles> {
  //! Здесь задаем уникальный ключ потому-что flutter сравнивает название классов и при toggle не будет изменеий
  List<Widget> tiles = [
    // StateLessColorTile(key: UniqueKey()),
    // StateLessColorTile(key: UniqueKey()),
    //! если обернем в padding то ключ передаем в padding а не в widget потому-что родителем становится Padding
    Padding(
      key: UniqueKey(),
      padding: const EdgeInsets.all(8.0),
      child: const StateLessColorTile(),
    ),
    Padding(
      key: UniqueKey(),
      padding: const EdgeInsets.all(8.0),
      child: const StateLessColorTile(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: swapTiles,
          child: const Text(
            'Toggle',
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: tiles,
        )
      ],
    );
  }

//! когда в ДеревеВиджетов поменялись GreenBox и RedBox местами В дереве Элементов идет сравнение.
  void swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }
}

//! В stateless работает нормально без ключей
class StateLessColorTile extends StatefulWidget {
  const StateLessColorTile({Key? key}) : super(key: key);

  @override
  _StateLessColorTileState createState() => _StateLessColorTileState();
}

class _StateLessColorTileState extends State<StateLessColorTile> {
  //! geb random color
  final myColor = UniqueColorGenerator.getColor();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: myColor,
    );
  }
}

//! create random Color
class UniqueColorGenerator {
  static final _random = Random();
  static Color getColor() {
    return Color.fromARGB(
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
      1,
    );
  }
}
