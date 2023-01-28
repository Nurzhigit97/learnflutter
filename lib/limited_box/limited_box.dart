import 'package:flutter/material.dart';

class LimitedBoxes extends StatefulWidget {
  const LimitedBoxes({Key? key}) : super(key: key);

  @override
  State<LimitedBoxes> createState() => _LimitedBoxesState();
}

class _LimitedBoxesState extends State<LimitedBoxes> {
  //! получаем зн. и переходим автоматически в нужную позицию controller SizeBox
  //? И Контроллер должень быть в Statfull widget
  final controller = ScrollController();
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      print('${controller.offset}');
    });

    Future.delayed(const Duration(seconds: 4)).then((value) {
      controller.animateTo(2000.0,
          duration: const Duration(seconds: 4), curve: Curves.easeInOut);
    }).then((value) => print('$value jumped'));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //! родительский размер height не должен быть длиннее дочернего, чем размер ListView
      height: 500,
      width: double.infinity,

      //! ListView оптимизированнее чем SingleScrollView Потому-что он сразу рендерип свои дочерние эл. сразу а LIstVIew смотря на скрол рендерит доч. эл.
      child: ListView(
        controller: controller,
        children: [
          for (var i = 0; i < 50; i++)
            LimitedBox(
              maxHeight: 100,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 40,
                  height: 40,
                  color: (i % 2 == 0 ? Colors.green : Colors.red),
                  child: Text('$i'),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
