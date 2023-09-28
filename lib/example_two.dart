import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExampleTwo extends StatefulWidget {
  const ExampleTwo({super.key});

  @override
  State<ExampleTwo> createState() => _ExampleTwoState();
}

class _ExampleTwoState extends State<ExampleTwo> {
  List<PhotoModel> photoList = [];

  Future<List<PhotoModel>> getPhoto() async {
    final response =
        await http.get(Uri.parse("http://jsonplaceholder.typicode.com/photos"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        PhotoModel photos = PhotoModel(title: i['title'], url: i['url']);
        photoList.add(photos);
      }
      log(photoList.length.toString());
      return photoList;
    } else {
      return photoList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API 2"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPhoto(),
              builder: (context, AsyncSnapshot<List<PhotoModel>> snapshot) {
                return ListView.builder(
                  itemCount: photoList.length,
                  itemBuilder: (context, index) => ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(snapshot.data![index].url.toString()),
                      ),
                      title: Text(
                        // "adil",
                        snapshot.data![index].title.toString(),
                      )),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class PhotoModel {
  String title, url;
  PhotoModel({
    required this.title,
    required this.url,
  });
}
