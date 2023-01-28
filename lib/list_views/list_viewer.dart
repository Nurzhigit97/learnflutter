import 'package:flutter/material.dart';

class ListViewer extends StatefulWidget {
  const ListViewer({Key? key}) : super(key: key);

  @override
  _ListViewerState createState() => _ListViewerState();
}

class _ListViewerState extends State<ListViewer> {
  final controller = ScrollController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      controller.addListener(() {
        print(controller.offset);
      });
    });

    Future.delayed(const Duration(seconds: 3))
        .then((value) => controller.animateTo(2000.0,
            duration: const Duration(seconds: 4), curve: Curves.easeInOut))
        .then((value) => controller.animateTo(0.0,
            duration: const Duration(seconds: 4), curve: Curves.slowMiddle));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      width: double.infinity,
      child: ListView.builder(
          shrinkWrap: true,
          controller: controller,
          itemCount: 80,
          itemBuilder: (BuildContext context, index) => Container(
              color: Colors.amber,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(20),
              //! Получаем на какой позиции каждый эл. в экране
              child: Text('Hello ${controller.offset}'))),
    );
  }
}
