import 'package:flutter/material.dart';

class Buttons extends StatefulWidget {
  const Buttons({Key? key}) : super(key: key);

  @override
  _ButtonsState createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  late final style = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.amber),
    foregroundColor: MaterialStateProperty.all(Colors.black),
    overlayColor: MaterialStateProperty.all(Colors.green),
    shadowColor: MaterialStateProperty.all(Colors.blue),
    elevation: MaterialStateProperty.all(10),
    padding: MaterialStateProperty.all(
        const EdgeInsets.all(0)), //! remove paddings in btn
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
        side: const BorderSide(color: Colors.black),
      ),
    ),

    alignment: Alignment.center,
  );

  var textf = const Text(
    'txts',
    style: TextStyle(
        fontSize: 22, color: Colors.amberAccent, backgroundColor: Colors.amber),
  );

  void clicked1() {
    setState(() {
      textf = const Text(
        'txts 0',
        style: TextStyle(
            fontSize: 32,
            color: Color.fromARGB(255, 133, 130, 121),
            backgroundColor: Colors.amber),
      );
    });
  }

  void clicked2() {
    setState(() {
      textf = const Text(
        'txts 11',
        style: TextStyle(
            fontSize: 42, color: Colors.blue, backgroundColor: Colors.amber),
      );
    });
  }

  void clicked3() {
    setState(() {
      textf = const Text(
        'txts 1',
        style: TextStyle(
            fontSize: 12,
            color: Colors.amberAccent,
            backgroundColor: Colors.amber),
      );
    });
  }

  void clicked4() {
    setState(() {
      textf = const Text(
        'txts 2',
        style: TextStyle(
            fontSize: 22,
            color: Colors.amberAccent,
            backgroundColor: Colors.amber),
      );
    });
  }

  void clicked5() {
    setState(() {
      textf = const Text(
        'txts 3',
        style: TextStyle(
            fontSize: 22,
            color: Colors.amberAccent,
            backgroundColor: Colors.amber),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          textf,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: clicked1,
                  style: style,
                  child: const Text('Hello'),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.amber,
                  child: ListTile(
                    onTap: clicked2,
                    leading: const Icon(Icons.ac_unit_sharp),
                    title: const Text('Hello'),
                    trailing: const Icon(Icons.accessibility_new_outlined),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(onPressed: clicked3, child: const Text('Page')),
              IconButton(
                onPressed: clicked4,
                icon: const Icon(Icons.access_alarm),
              ),
              ElevatedButton.icon(
                //!Удаляет тексты которые выходять за рамки
                clipBehavior: Clip.hardEdge,
                style: style,
                onPressed: clicked5,
                label: const Text('Xiaomi'),
                icon: const Icon(
                  Icons.snapchat,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
