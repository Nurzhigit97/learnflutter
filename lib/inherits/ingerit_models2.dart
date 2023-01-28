import 'package:flutter/material.dart';

class InheritModels extends StatelessWidget {
  const InheritModels({Key? key}) : super(key: key);

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
  var _value2 = 0;

  void increment() {
    _value += 1;
    setState(() {});
  }

  void increment2() {
    _value2 += 1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: increment,
          child: const Text('Click1'),
        ),
        ElevatedButton(
          onPressed: increment2,
          child: const Text('Click2'),
        ),
        DataProviderInherited(
          value: _value,
          value2: _value2,
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
    //! 1. aspect- это ключ по которому если он изменился то делаем перерендер
    final value = context
            .dependOnInheritedWidgetOfExactType<DataProviderInherited>(
                aspect: 'one')
            ?.value ??
        0;
    return Column(
      children: [
        Text('$value'),
        const DataConsumerStatefull(),
      ],
    );
  }
}

class DataConsumerStatefull extends StatelessWidget {
  const DataConsumerStatefull({Key? key}) : super(key: key);
//! с пом. aspect когда нажимаю на вторую кнопку вызывается только вторая, без aspect если нажали на одну то вызовится и отсальные без aspect
  @override
  Widget build(BuildContext context) {
    final value2 = getInherit<DataProviderInherited>(context)?.value2 ?? 0;
    return Column(
      children: [
        Text('$value2'),
      ],
    );
  }
}

//! наш любимый inherit
class DataProviderInherited extends InheritedModel<String> {
  final int value;
  final int value2;

  const DataProviderInherited(
      {Key? key,
      required this.value,
      required this.value2,
      required Widget child})
      : super(key: key, child: child);

  static DataProviderInherited? of(BuildContext context) {
    //! 2. aspect- это ключ по которому если он изменился то делаем перерендер
    return context.dependOnInheritedWidgetOfExactType<DataProviderInherited>(
        aspect: 'two');
  }

//! Сравнивает старый с новым
  @override
  bool updateShouldNotify(DataProviderInherited oldWidget) {
    return value != oldWidget.value || value2 != oldWidget.value2;
  }

  @override
  bool updateShouldNotifyDependent(
    covariant DataProviderInherited oldWidget,
    Set<String> dependencies,
  ) {
    final isValueOneUpdated =
        value != oldWidget.value && dependencies.contains('one');
    final isValueTwoUpdated =
        value2 != oldWidget.value2 && dependencies.contains('two');

    return isValueOneUpdated || isValueTwoUpdated;
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
