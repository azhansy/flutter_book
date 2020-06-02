import 'package:flutter/material.dart';

class FlutterErrorPage extends StatefulWidget {
  @override
  _FlutterErrorPageState createState() => _FlutterErrorPageState();
}

class _FlutterErrorPageState extends State<FlutterErrorPage> {

  @override
  Widget build(BuildContext context) {
    print("FlutterErrorPage===========");

    try{
      Future.delayed(Duration(seconds: 1)).then((e) => Future.error("xxx"));
    }catch (e){
      print(e);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("title"),
      ),
      body: Container(
        child: Column(
          children: [
            Text("data"),
            Container(
              color: Colors.red,
              width: 300,
              height: 300,
              child: Text("这个是很大的空间"),
            ),
            Container(
              color: Colors.red,
              width: 300,
              height: 300,
              child: Text("这个是很大的空间"),
            ),
            Container(
              color: Colors.blue,
              width: 300,
              height: 300,
              child: Text("这个是很大的空间"),
            ),
          ],
        ),
      ),
    );
  }
}
