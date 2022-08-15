import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../widgets/widgets.dart';

class NameDate extends StatefulWidget {
  const NameDate({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => NameDateState();
}

List<String> text = [' ', ' '];

void getHttp() async {
  try {
    var response = await Dio()
        .get('https://rickandmortyapi.com/api/character/1')
        .timeout(const Duration(seconds: 3));
    text[0] = response.data['name'];
    text[1] = response.data['image'];
  } catch (e) {
    print(e);
  }
}

class NameDateState extends State<NameDate> {
  @override
  void initState() {
    super.initState();
    getHttp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(text[0], style: AppTypography.font36),
                      CachedNetworkImage(
                        imageUrl: text[1],
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Padding(
                            padding: const EdgeInsets.all(8),
                            child: ElevatedButton(
                                onPressed: () {
                                  getHttp();
                                },
                                child: const Icon(Icons.refresh))),
                      ),
                    ],
                  ));
            }));
  }
}
