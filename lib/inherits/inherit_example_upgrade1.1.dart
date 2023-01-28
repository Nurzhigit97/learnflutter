import 'package:flutter/material.dart';

class ExampleInheriterUpgrade extends StatelessWidget {
  const ExampleInheriterUpgrade({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      height: 400,
      child: DataOwnerStatfull(),
    );
  }
}

class DataOwnerStatfull extends StatefulWidget {
  const DataOwnerStatfull({Key? key}) : super(key: key);

  @override
  _DataOwnerStatefullState createState() => _DataOwnerStatefullState();
}

class _DataOwnerStatefullState extends State<DataOwnerStatfull> {
  var _value = 0;

  void increment() {
    _value += 1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: increment,
          child: const Text('Incr'),
        ),
/* //! Если в Widget доб.const то он не будет обновлят этот виджет и для этого мы будем с пом. inherit вызывать перерисовку. 
Для производительности inherit находит в O(1) 
findAncestorStateOfType находит в O(n) переходить по каждым widgetом пока не найдет тип state которую передали  

*/
//! Обернули в DataProviderInherited class чтобы могли получить -эти значения
        DataProviderInherited(
          value: _value,
          child: const DataConsumerStateless(),
        ),
      ],
    );
  }
}

class DataConsumerStateless extends StatelessWidget {
  const DataConsumerStateless({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
/* 
? dependOnInheritedWidgetOfExactType - получает и одновременно подписывает на его изменения
!в этих местах можем вызывать- didChangeDependencies,build

? dependOnInheritedElement - подписывается на изм. инхерита
! в этих местах можем вызывать- didChangeDependencies,build
? getElementForInheritedWidgetOfExactType - получает эл. инхерит widgetа без подписи 
! в этих местах можем вызывать- initState, didChangeDependencies,build,deactivate
*/

    final value = context
            .dependOnInheritedWidgetOfExactType<DataProviderInherited>()
            ?.value ??
        0;
    return Column(
      children: [
        Text('$value'),
        //! Если в Widget доб.const то он не будет обновлят этот виджет и для этого мы будем с пом. inherit вызывать перерисовку для производительности
        const DataConsumerStatefull(),
      ],
    );
  }
}

class DataConsumerStatefull extends StatelessWidget {
  const DataConsumerStatefull({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
/* 
    //!call getElementForInheritedWidgetOfExactType inherit
    final element = context
        .getElementForInheritedWidgetOfExactType<DataProviderInherited>();
    //!get getElementForInheritedWidgetOfExactType inherit
    if (element != null) {
      context.dependOnInheritedElement(element);
    }
    final dataProvider = element?.widget as DataProviderInherited;
    final value = dataProvider.value; 
*/
    //! with method getInherit
    final value = getInherit<DataProviderInherited>(context)?.value ?? 0;
    return Column(
      children: [
        Text('$value'),
      ],
    );
  }
}

//! наш любимый inherit
class DataProviderInherited extends InheritedWidget {
  final int value;
  const DataProviderInherited(
      {Key? key, required this.value, required Widget child})
      : super(key: key, child: child);

  static DataProviderInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DataProviderInherited>();
  }

//! Сравнивает старый с новым
  @override
  bool updateShouldNotify(DataProviderInherited oldWidget) {
    return value != oldWidget.value;
  }
}

//! метод получения зн. для краткости в вызове
T? getInherit<T>(BuildContext context) {
  final element =
      context.dependOnInheritedWidgetOfExactType<DataProviderInherited>();

  if (element is T) {
    return element as T;
  } else {
    return null;
  }
}
