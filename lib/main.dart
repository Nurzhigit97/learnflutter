// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learnflutter/inherits/best_example/inherit_notifier_widget_ui.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future main() async {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Tab AppBar'),
              centerTitle: true,
              bottom: const TabBar(
                tabs: [
                  Tab(
                    text: 'Cat',
                  ),
                  Tab(
                    text: 'Dogs',
                  ),
                  Tab(
                    text: 'Tiger',
                  ),
                ],
              ),
            ),
            body: const App(),
          ),
        ),
      ),
    ),
  );
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            // ListsData(),
            // Lists_Data_optimized(),
            //! NeedReSizeAll(),
            //! Practice(),
            //! LimitedBoxes(),
            // Stacked(),
            // Transforms(),
            // ToolTips(),
            // Tabless(),
            //! PageViews(),
            //todo Futuress(),
            //todo FuturessUser(),
            // Wraper(),
            // LimitedBoxes(),
            //? ListViewer(),
            //todo Practice(),
            // Buttons(),
            // Firebasess(),
            // HomePageAuth(),
            //! FormData(),
            //! SixBtns(),
            // DialogExample(),
            // CanvasPage(),
            // StatefulLifeExample(),
            //! keys
            // LocalKeyUnique_ValueKey(),
            // GlobalKeyState(),
            //! contexts
            // BuildContextt(),
            // Director(),
            // ContextClass(),
            //! inherits
            // ExampleInheriter(),
            // ExampleInheriterUpgrade(),
            // InheritModels(),
            // ChangeNotifierModelExampleCalc21(),
            //! own stateManagement
            InheritNotifierWidgetUi(),
          ],
        ),
      ),
    ]);
  }
}
