import 'package:flutter/material.dart';

//! в этом видео мы сократили вызов build с 3 на 1 так как мы с 2 инпутов и фнукции суммирования только читаем зн. а в resultwidget вызываем перерендер с пом. watch
/* 
! в UI происходит изменение значение нужно вызыват watch
1. когда видим в UI изменение зн. например: result Calc а не func сложения(Summ)
! в UI не происходит изменение значение нужно вызыват read
Например inputField не нужно слушат изменения и вызыват build widget-а
Например ElevatedButton(Summ) функцию сложения не нужно слушат изменения и вызыват build 

 */
class InheritNotifierUpdate3 extends StatelessWidget {
  const InheritNotifierUpdate3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SimpleCalcWidget();
  }
}

class SimpleCalcWidget extends StatefulWidget {
  const SimpleCalcWidget({Key? key}) : super(key: key);

  @override
  _SimpleCalcWidgetState createState() => _SimpleCalcWidgetState();
}

class _SimpleCalcWidgetState extends State<SimpleCalcWidget> {
  final _model = SimpleCalcWidgetModel();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        //! принимает класс который
        child: SimpleCalcWidgetProvider(
          model: _model,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              FirstNumberWidget(),
              SizedBox(height: 10),
              SecondNumberWidget(),
              SizedBox(height: 10),
              SummButtonWidget(),
              SizedBox(height: 10),
              ResultWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class FirstNumberWidget extends StatelessWidget {
  const FirstNumberWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(border: OutlineInputBorder()),
      onChanged: (String value) =>
          SimpleCalcWidgetProvider.read(context)?.firstNumber = value,
    );
  }
}

class SecondNumberWidget extends StatelessWidget {
  const SecondNumberWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(border: OutlineInputBorder()),
      onChanged: (String value) =>
          SimpleCalcWidgetProvider.read(context)?.secondNumber = value,
    );
  }
}

class SummButtonWidget extends StatelessWidget {
  const SummButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      //! Здесь только только читаем значение не вызываем перерендер
      onPressed: () => SimpleCalcWidgetProvider.read(context)?.summ(),
      child: const Text('Посчитать сумму'),
    );
  }
}

class ResultWidget extends StatelessWidget {
  const ResultWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //! Здесь только вызываем метод build
    final value = SimpleCalcWidgetProvider.watch(context)?.summResult ?? '-1';
    return Text('Результат: $value');
  }
}

//! Логика
class SimpleCalcWidgetModel extends ChangeNotifier {
  int? _firstNumber;
  int? _secondNumber;
  int? summResult;
//! полученные инпуты делаем типа int
  set firstNumber(String value) => _firstNumber = int.tryParse(value);
  set secondNumber(String value) => _secondNumber = int.tryParse(value);

  void summ() {
    int? summResult;
    if (_firstNumber != null && _secondNumber != null) {
      summResult = _firstNumber! + _secondNumber!;
    } else {
      summResult = null;
    }
    //! если новый с старым похожи не обновлят результат
    if (this.summResult != summResult) {
      this.summResult = summResult;
      //! notifyListeners- Отправляет в переменную результат
      notifyListeners();
    }
  }
}

//! stateProvider
class SimpleCalcWidgetProvider
    extends InheritedNotifier<SimpleCalcWidgetModel> {
  final SimpleCalcWidgetModel model;

  const SimpleCalcWidgetProvider({
    Key? key,
    required this.model,
    required Widget child,
    //! добавил notifier, потому-что  InheritedNotifier нужен
  }) : super(key: key, notifier: model, child: child);

  static SimpleCalcWidgetModel? watch(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<SimpleCalcWidgetProvider>()
        ?.widget;
    return widget is SimpleCalcWidgetProvider ? widget.notifier : null;
  }

//! Только получить
  static SimpleCalcWidgetModel? read(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<SimpleCalcWidgetProvider>()
        ?.notifier;
  }
}
