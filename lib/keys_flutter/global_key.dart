// import 'package:flutter/material.dart';

// /* 
// 1. GlobalKey
// 2. GlobalObjectKey
// 3. LabeledGlobalKey
// глобальный доступ шаринг стейта между одинаковыми виджетами
//  */
// class GlobalKeyState extends StatelessWidget {
//   const GlobalKeyState({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       height: 600,
//       child: PageView.builder(
//         itemCount: 3,
//         itemBuilder: (context, index) {
//           switch (index) {
//             case 0:
//               return Container(
//                 color: Colors.green,
//                 child: const _Page(
//                   key: PageStorageKey('first'),
//                 ),
//               );
//             case 1:
//               return Container(
//                 color: Colors.red,
//                 child: const _Page(
//                   //! PageStorageKey for saving state Page
//                   key: PageStorageKey('second'),
//                 ),
//               );
//             case 2:
//               return Container(
//                 color: Colors.blue,
//                 //! PageStorageKey here reset dont saving state Page
//                 child: const _Page(),
//               );
//           }
//         },
//       ),
//     );
//   }
// }

// class _Page extends StatefulWidget {
//   const _Page({Key? key}) : super(key: key);

//   @override
//   State<_Page> createState() => _PageState();
// }

// class _PageState extends State<_Page> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemBuilder: (BuildContext context, index) {
//         return Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text('$index'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
