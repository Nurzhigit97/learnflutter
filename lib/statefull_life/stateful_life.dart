// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class StatefulLifeExample extends StatefulWidget {
  const StatefulLifeExample({Key? key}) : super(key: key);

  @override
  _StatefulLifeExampleState createState() => _StatefulLifeExampleState();
}

class _StatefulLifeExampleState extends State<StatefulLifeExample> {
  var _isCollapse = false;

  _toggle() {
    _isCollapse = !_isCollapse;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 500,
      child: Column(
        children: [
          ElevatedButton(
            onPressed: _toggle,
            child: Text(_isCollapse ? " Развернуть" : "Свернуть"),
          ),
          Expanded(
              child: Center(
            child: Container(
              padding: const EdgeInsets.all(10),
              color: Colors.green,
              child: CollapseAnimateBoxState(
                duration: const Duration(milliseconds: 250),
                isCollapse: _isCollapse,
                child: Container(
                  height: 100,
                  color: Colors.blue,
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }
}

class CollapseAnimateBoxState extends StatefulWidget {
  final Duration duration;
  final Widget child;
  final bool isCollapse;

//! construcor эти зн. можем получать при создании экземпляра класса
  const CollapseAnimateBoxState({
    Key? key,
    this.duration = const Duration(milliseconds: 250),
    required this.isCollapse,
    required this.child,
  }) : super(key: key);

  @override
  _CollapseAnimateBoxStateState createState() =>
      _CollapseAnimateBoxStateState();
}

class _CollapseAnimateBoxStateState extends State<CollapseAnimateBoxState>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    if (widget.isCollapse) {
      _animationController.value = 1;
    }
  }

//! вся магия здесь
//! didUpdateWidget- набор данных для state для сравнения Widgetов
  @override
  void didUpdateWidget(covariant CollapseAnimateBoxState oldWidget) {
    super.didUpdateWidget(oldWidget);
    //! Сравниваем старый и текуший новый виджет
    if (oldWidget.isCollapse == widget.isCollapse) return;
//!
    if (widget.isCollapse) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: CurvedAnimation(
          parent: _animationController, curve: Curves.easeInOut),
      axisAlignment: 0.0,
      child: FadeTransition(
        opacity: CurvedAnimation(
          parent: _animationController,
          curve: Curves.linear,
        ),
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
