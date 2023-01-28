import 'package:flutter/material.dart';

class Stacked extends StatelessWidget {
  const Stacked({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 200,
          height: 200,
          color: Colors.green,
          child: Stack(
            children: const [
              Positioned(
                  left: 0,
                  top: 0,
                  width: 60,
                  height: 50,
                  child: Icon(Icons.supervised_user_circle_rounded)),
              Positioned(
                  bottom: 0,
                  left: 0,
                  width: 60,
                  height: 50,
                  child: Icon(Icons.supervised_user_circle_rounded)),
              Positioned(
                  bottom: 0,
                  right: 0,
                  width: 60,
                  height: 50,
                  child: Icon(Icons.supervised_user_circle_rounded)),
              Positioned(
                  top: 0,
                  right: 0,
                  width: 60,
                  height: 50,
                  child: Icon(Icons.supervised_user_circle_rounded)),
            ],
          ),
        ),
        const Align(
          alignment: Alignment.center,
          child: Text('HelloMyFriends'),
        )
      ],
    );
  }
}
