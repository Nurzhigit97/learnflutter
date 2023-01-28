import 'package:flutter/material.dart';

class PageViews extends StatelessWidget {
  const PageViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return Column(
      children: [
        SizedBox(
          height: 200,
          width: double.infinity,
          child: PageView(
            scrollDirection: Axis.vertical,
            controller: controller,
            children: <Widget>[
              const Center(
                child: Text('First Page'),
              ),
              Container(
                color: Colors.blue,
                child: const Center(
                  child: Text('Second Page'),
                ),
              ),
              Container(
                color: Colors.amber,
                child: const Center(
                  child: Text('Third Page'),
                ),
              ),
            ],
          ),
        ),
        const Divider(),
        SizedBox(
          height: 200,
          width: double.infinity,
          child: PageView(
            scrollDirection: Axis.horizontal,
            controller: controller,
            children: <Widget>[
              Container(
                child: const Center(
                  child: Text('First Page'),
                ),
              ),
              Container(
                color: Colors.blue,
                child: const Center(
                  child: Text('Second Page'),
                ),
              ),
              Container(
                color: Colors.amber,
                child: const Center(
                  child: Text('Third Page'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
