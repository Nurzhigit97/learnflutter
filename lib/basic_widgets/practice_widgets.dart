import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class WrapperBtn extends StatelessWidget {
  const WrapperBtn({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10, left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Divider(
            height: 20,
            color: Colors.green,
          ),
          Column(
            children: [
              PhysicalModel(
                color: Colors.white,
                shadowColor: Colors.green,
                elevation: 18,
                shape: BoxShape.rectangle,
                child: Container(
                  decoration: BoxDecoration(border: Border.all(width: 2)),
                  padding: const EdgeInsets.all(3),
                  margin: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(
                        image: const NetworkImage(
                            'https://i.stack.imgur.com/ILTQq.png'),
                        width: 25,
                        loadingBuilder: (context, child, loadingProgress) {
                          return loadingProgress == null
                              ? child
                              : const Center(
                                  child: SizedBox(
                                      width: 20,
                                      child: LinearProgressIndicator()));
                        },
                      ),
                      Text(1.toString()),
                      ShaderMask(
                          shaderCallback: (bounds) => const RadialGradient(
                                  center: Alignment.topLeft,
                                  radius: 1,
                                  tileMode: TileMode.mirror,
                                  colors: [Colors.yellow, Colors.red])
                              .createShader(bounds),
                          child: const Text(
                            'Name',
                            style: TextStyle(color: Colors.white),
                          )),
                      const SelectableText(
                          maxLines: 1,
                          scrollPhysics: ClampingScrollPhysics(),
                          'HelloMyName is'),
                      AnimatedTextKit(
                          totalRepeatCount: 10,
                          pause: const Duration(seconds: 50),
                          animatedTexts: [
                            TypewriterAnimatedText('text.name'.toString()),
                          ]),
                      AnimatedTextKit(animatedTexts: [
                        TyperAnimatedText('text.lastName'.toString()),
                      ]),
                      const Text('22'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                width: 50,
                child: RefreshIndicator(
                  triggerMode: RefreshIndicatorTriggerMode.onEdge,
                  onRefresh: _refresh,
                  child: Scrollbar(
                    controller: ScrollController(),
                    scrollbarOrientation: ScrollbarOrientation.left,
                    child: ListWheelScrollView(
                      itemExtent: 42,
                      offAxisFraction: -0.5,
                      magnification: 2,
                      children: const [
                        Text('skills'),
                        Text('skills'),
                        Text('skills'),
                        Text('skills'),
                        Text('skills'),
                        Text('skills'),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _refresh() {
    return Future.delayed(const Duration(seconds: 0));
  }
}
