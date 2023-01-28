import 'package:flutter/material.dart';

Widget FormData() => Column(
      children: [
        Row(
          children: const [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter name...',
                    icon: Icon(Icons.verified_user)),
              ),
            ),
            Expanded(
              child: Center(child: Text('User name ')),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: const [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Email...',
                    icon: Icon(Icons.login)),
              ),
            ),
            Expanded(
              child: Center(child: Text('User Email ')),
            )
          ],
        )
      ],
    );
