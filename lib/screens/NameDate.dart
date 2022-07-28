import 'package:flutter/material.dart';

class NameDate extends StatefulWidget {
  const NameDate({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => NameDateState();
}

class NameDateState extends State<NameDate> {
  @override
  Widget build(BuildContext context) {
        return Scaffold(
    body: ListView.builder(
          padding: const EdgeInsets.all(8),
    itemCount: 1,
    itemBuilder: (BuildContext context, int index) {
      return Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Информация с любого API будет здесь'),
            ],
          )
      );
    }
    )
    );
      }
  }