import 'package:flutter/material.dart';

class NeedReSizeAll extends StatefulWidget {
  const NeedReSizeAll({Key? key}) : super(key: key);

  @override
  _NeedReSizeAllState createState() => _NeedReSizeAllState();
}

class _NeedReSizeAllState extends State<NeedReSizeAll> {
  bool _isPadding = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.amber,
          child: AnimatedPadding(
            padding: EdgeInsets.all(_isPadding ? 5 : 40),
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOut,
            child: ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 20, maxWidth: 55),
                child: ElevatedButton(
                    onPressed: () {
                      setState(() => _isPadding = !_isPadding);
                    },
                    child: const Text('Btn'))),
          ),
        ),
      ],
    );
  }
}
