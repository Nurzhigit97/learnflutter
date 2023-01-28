import 'package:flutter/material.dart';
import 'package:learnflutter/fore_each_data/WITH_OPTIMIZED/separatedIViewAndData/practice.dart';

@override
class WrapperBtn extends StatelessWidget {
  WrapperBtn({Key? key, required this.text}) : super(key: key);
  //! Getting data users
  User text;
  @override
  Widget build(BuildContext context) {
    //! Map Skills
    List<Widget> skills = text.skills
        .map((e) => Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.5), color: Colors.green),
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(1),
            child: Text(e)))
        .toList();
    return Container(
      margin: const EdgeInsets.only(right: 10, left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image(
                      image: NetworkImage(text.img),
                      width: 25,
                    ),
                    Text(text.id.toString()),
                    Text(
                      text.name,
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(text.age.toString()),
                  ],
                ),
              ),
              Row(
                children: skills,
              )
            ],
          ),
        ],
      ),
    );
  }
}
