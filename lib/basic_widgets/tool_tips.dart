import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ToolTips extends StatelessWidget {
  const ToolTips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<TooltipState> tooltipkey = GlobalKey<TooltipState>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Tooltip(
                // Provide a global key with the "TooltipState" type to show
                // the tooltip manually when trigger mode is set to manual.
                key: tooltipkey,
                triggerMode: TooltipTriggerMode.longPress,
                showDuration: const Duration(seconds: 1),
                message: 'I am a Tooltip',
                child: const Text('Tap on the FAB'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Show Tooltip programmatically on button tap.
                tooltipkey.currentState?.ensureTooltipVisible();
              },
              child: const Text('Show Tooltip'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Tooltip(
              triggerMode: TooltipTriggerMode.tap,
              richMessage: TextSpan(
                text: 'I am a rich tooltip. ',
                style: TextStyle(color: Colors.red),
                children: <InlineSpan>[
                  TextSpan(
                    text: 'I am another span of this rich tooltip',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              child: Text('Tap this text and hold down to show a tooltip.'),
            ),
          ],
        ),
        Stack(
          children: <Widget>[
            Center(
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: 'https://picsum.photos/250?image=9',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
