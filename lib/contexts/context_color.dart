import 'package:flutter/material.dart';

final key = GlobalKey<_ColoredWidgetState>();

class ContextClass extends StatelessWidget {
  const ContextClass({Key? key}) : super(key: key);

  static void nextScreen(BuildContext context) {
    Navigator.of(context).push<void>(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const NextScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => nextScreen(context),
        child: const Text('Переход'),
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  const NextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 500,
      child: InheritExample(
        child: ColoredWidget(
          initalColor: Colors.red,
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: ColoredWidget(
              key: key,
              initalColor: Colors.green,
              child: const Padding(
                padding: EdgeInsets.all(40),
                child: ColorButton(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class InheritExample extends InheritedWidget {
  const InheritExample({
    Key? key,
    required Widget child,
  }) : super(
          key: key,
          child: child,
        );

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}

class ColoredWidget extends StatefulWidget {
  final Widget child;
  final Color initalColor;

  const ColoredWidget({
    Key? key,
    required this.initalColor,
    required this.child,
  }) : super(key: key);

  @override
  _ColoredWidgetState createState() => _ColoredWidgetState();
}

class _ColoredWidgetState extends State<ColoredWidget> {
  late Color color;

  @override
  void initState() {
    color = widget.initalColor;
    super.initState();
  }

  void chnageColor(Color color) {
    setState(() {
      this.color = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: widget.child,
    );
  }
}

class ColorButton extends StatelessWidget {
  const ColorButton({Key? key}) : super(key: key);

  void _onPressed(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return ColoredWidget(
      initalColor: Colors.blue,
      child: Center(
        child: ElevatedButton(
          onPressed: () => _onPressed(context),
          child: const Text('Жми'),
        ),
      ),
    );
  }
}
