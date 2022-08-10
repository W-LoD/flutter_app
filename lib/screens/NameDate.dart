import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import 'package:dio/dio.dart';
class NameDate extends StatefulWidget {
  const NameDate({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => NameDateState();
}
var text = "Hello friend";
void getHttp() async {
  try {
    var response = await Dio().get('http://www.boredapi.com/api/activity?type=diy');
    text = response.data['activity'];
        print(response.data);
  } catch (e) {
    print(e);
  }
}

class NameDateState extends State<NameDate> {

  @override
  Widget build(BuildContext context) {
    getHttp();
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Text(text, style: AppTypography.font36),
            ],
          )
      );
    }
    )
    );
      }
  }