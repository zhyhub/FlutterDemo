import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "电影海报",
      home: Scaffold(
        appBar: AppBar(
          title: Text("ListView Widget"),
        ),
        body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 2.0,
              crossAxisSpacing: 2.0,
              childAspectRatio: 0.7),
          children: <Widget>[
            Image.network(
                "https://img3.mukewang.com/szimg/59b8a486000107fb05400300.jpg",
                fit: BoxFit.cover),
            Image.network(
                "https://img2.mukewang.com/szimg/5c38442a09edab9312000676.jpg",
                fit: BoxFit.cover),
            Image.network(
                "https://img2.mukewang.com/szimg/5a7127370001a8fa05400300.jpg",
                fit: BoxFit.cover),
            Image.network(
                "https://img4.mukewang.com/szimg/5c18d2d8000141c506000338.jpg",
                fit: BoxFit.cover),
            Image.network(
                "https://img4.mukewang.com/szimg/5b5835a60001907e05400300.jpg",
                fit: BoxFit.cover),
            Image.network(
                "https://img2.mukewang.com/szimg/5c106a8f0001d0ea06000338.jpg",
                fit: BoxFit.cover),
            Image.network(
                "https://img4.mukewang.com/5bfe54bd000131e306000338-240-135.jpg",
                fit: BoxFit.cover),
            Image.network(
                "https://img3.mukewang.com/szimg/5c46c4a308ad3b3406000338.jpg",
                fit: BoxFit.cover),
            Image.network(
                "https://img1.mukewang.com/szimg/5c26f19508ce8c8100000000.jpg",
                fit: BoxFit.cover),
            Image.network(
              "https://img2.mukewang.com/5bbf2def000118ab06000336-240-135.jpg",
              fit: BoxFit.cover,
            ),
            Image.network(
              "https://img3.mukewang.com/5c18cf540001ac8206000338-240-135.jpg",
              fit: BoxFit.cover,
            ),
            Image.network(
              "https://img3.mukewang.com/5b86566a0001d31106000338-240-135.jpg",
              fit: BoxFit.cover,
            ),
            Image.network(
              "https://img3.mukewang.com/5c18cf540001ac8206000338-240-135.jpg",
              fit: BoxFit.cover,
            ),
            Image.network(
              "https://img3.mukewang.com/5c18cf540001ac8206000338-240-135.jpg",
              fit: BoxFit.cover,
            ),
            Image.network(
              "https://img3.mukewang.com/5c18cf540001ac8206000338-240-135.jpg",
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
