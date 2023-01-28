import 'package:flutter/material.dart';

class Director extends StatefulWidget {
  const Director({Key? key}) : super(key: key);

  @override
  _DirectorState createState() => _DirectorState();
}

class _DirectorState extends State<Director> {
  int num = 0;

  numberPlus(int props) {
    setState(
      () {
        num += props;
      },
    );
  }

  numberMinus(int props) {
    setState(
      () {
        num -= props;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 350,
        height: 500,
        color: Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              num.toString(),
              style: const TextStyle(fontSize: 30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: PlusClass(),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: MinusClass(),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

class PlusClass extends StatelessWidget {
  const PlusClass({Key? key}) : super(key: key);

  plusMethod(BuildContext context) {
    return context.findAncestorStateOfType<_DirectorState>()?.numberPlus(1);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => plusMethod(context), child: const Text('Plus'));
  }
}

class MinusClass extends StatelessWidget {
  const MinusClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    minusMethod() {
      return context.findAncestorStateOfType<_DirectorState>()?.numberMinus(1);
    }

    return ElevatedButton(onPressed: minusMethod, child: const Text('Minus'));
  }
}
