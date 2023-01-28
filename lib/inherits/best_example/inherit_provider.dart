//! stateProvider
import 'package:flutter/material.dart';
import 'package:learnflutter/inherits/best_example/notifier_logic.dart';

class InhProvider extends InheritedNotifier<CalcWidgetModel> {
  final CalcWidgetModel model;

  const InhProvider({
    Key? key,
    required this.model,
    required Widget child,
    //! добавил notifier, потому-что  InheritedNotifier нужен
  }) : super(key: key, notifier: model, child: child);

//! Только получить
  static CalcWidgetModel? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InhProvider>()?.notifier;
  }

  static CalcWidgetModel? read(BuildContext context) {
    final widget =
        context.getElementForInheritedWidgetOfExactType<InhProvider>()?.widget;
    return widget is InhProvider ? widget.notifier : null;
  }
}
