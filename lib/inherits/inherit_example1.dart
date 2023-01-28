import 'package:flutter/material.dart';

class ExampleInheriter extends StatelessWidget {
  const ExampleInheriter({Key? key}) : super(key: key);

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
        const DataConsumerStateless(),
      ],
    );
  }
}

class DataConsumerStateless extends StatelessWidget {
  const DataConsumerStateless({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value =
        context.findAncestorStateOfType<_DataOwnerStatefullState>()?._value ??
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
    final value =
        context.findAncestorStateOfType<_DataOwnerStatefullState>()?._value ??
            0;
    return Column(
      children: [
        Text('$value'),
      ],
    );
  }
}
