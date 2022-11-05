import 'package:flutter/material.dart';

class SkillSet extends StatelessWidget {
  const SkillSet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titles = [
      'Flutter',
      'Java',
      'Kotlin',
      'Html',
      'Css',
      'Javascript',
      'NodeJs',
      'VueJs'
    ];
    return Scaffold(
      appBar: AppBar(title: const Text("Skills"), centerTitle: true, backgroundColor: Colors.teal,),
      body: ListView.builder(
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5.0,
            child: ListTile(
              title: Text(titles[index]),
            ),
          );
        },
      ),
    );
  }
}
