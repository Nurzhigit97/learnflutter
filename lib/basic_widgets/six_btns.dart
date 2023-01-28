import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class SixBtns extends StatefulWidget {
  const SixBtns({Key? key}) : super(key: key);

  @override
  _SixBtnsState createState() => _SixBtnsState();
}

class _SixBtnsState extends State<SixBtns> {
  bool isHello = false;
  bool isHello2 = false;
  bool isColor = false;
  bool isSize = false;

  anim() {
    return AnimatedTextKit(
      animatedTexts: [
        RotateAnimatedText('AWESOME',
            textStyle: const TextStyle(
                fontSize: 30,
                color: Colors.white,
                backgroundColor: Colors.blue)),
        RotateAnimatedText('OPTIMISTIC',
            textStyle: const TextStyle(
                letterSpacing: 3,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.orange)),
        RotateAnimatedText(
          'DIFFERENT',
          textStyle: const TextStyle(
            fontSize: 30,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
      isRepeatingAnimation: true,
      totalRepeatCount: 10,
      pause: const Duration(milliseconds: 1000),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: Text(
          isHello == true ? "Welcome" : "GoodBye",
          style: TextStyle(
            fontSize: isSize ? 24 : 100,
            color: isColor ? Colors.green : Colors.amber,
          ),
        )),
        if (isHello) const Text('Hello'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    isHello = !isHello;
                  });
                },
                child: const Text('Hello')),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    isColor = !isColor;
                  });
                },
                child: const Text('ChangeColor')),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    isSize = !isSize;
                  });
                },
                child: const Text('ChangeSize')),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    isHello2 = !isHello2;
                  });
                },
                child: const Text('Animation')),
          ],
        ),
      ],
    );
  }
}
