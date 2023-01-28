import 'package:flutter/material.dart';
import 'package:learnflutter/inherits/best_example/inherit_provider.dart';
import 'package:learnflutter/inherits/best_example/notifier_logic.dart';

//! в этом видео мы сократили вызов build с 3 на 1 так как мы с 2 инпутов и фнукции суммирования только читаем зн. а в resultwidget вызываем перерендер с пом. watch
/* 
! в UI происходит изменение значение нужно вызыват watch
1. когда видим в UI изменение зн. например: result Calc а не func сложения(Summ)
! в UI не происходит изменение значение нужно вызыват read
Например inputField не нужно слушат изменения и вызыват build widget-а
Например ElevatedButton(Summ) функцию сложения не нужно слушат изменения и вызыват build 

 */
class InheritNotifierWidgetUi extends StatelessWidget {
  const InheritNotifierWidgetUi({Key? key}) : super(key: key);

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
  final _model = CalcWidgetModel();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        //! принимает класс который
        child: InhProvider(
          model: _model,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const FirstNumberWidget(),
              const SizedBox(height: 10),
              const SecondNumberWidget(),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  SummButtonWidget(),
                  SummButtonWidgetMinus(),
                  SummButtonWidgetDivided(),
                  SummButtonWidgetMult(),
                ],
              ),
              const SizedBox(height: 10),
              const ResultWidget(),
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
          InhProvider.read(context)?.firstNumber = value,
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
          InhProvider.read(context)?.secondNumber = value,
    );
  }
}

class SummButtonWidget extends StatelessWidget {
  const SummButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      //! Здесь только только читаем значение не вызываем перерендер
      onPressed: () => InhProvider.read(context)?.summ(),
      child: const Text('+'),
    );
  }
}

class SummButtonWidgetMinus extends StatelessWidget {
  const SummButtonWidgetMinus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      //! Здесь только только читаем значение не вызываем перерендер
      onPressed: () => InhProvider.read(context)?.minus(),
      child: const Text('-'),
    );
  }
}

class SummButtonWidgetDivided extends StatelessWidget {
  const SummButtonWidgetDivided({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      //! Здесь только только читаем значение не вызываем перерендер
      onPressed: () => InhProvider.read(context)?.divide(),
      child: const Text('/'),
    );
  }
}

class SummButtonWidgetMult extends StatelessWidget {
  const SummButtonWidgetMult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      //! Здесь только только читаем значение не вызываем перерендер
      onPressed: () => InhProvider.read(context)?.mult(),
      child: const Text('*'),
    );
  }
}

class ResultWidget extends StatelessWidget {
  const ResultWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //! Здесь только вызываем метод build
    final value = InhProvider.watch(context)?.summResult ?? '-1';
    return Text('Результат: $value');
  }
}
