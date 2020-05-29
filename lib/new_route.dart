import 'package:flutter/material.dart';

class NewRoutePage extends StatefulWidget {
  @override
  _NewRoutePageState createState() => _NewRoutePageState();
}

class _NewRoutePageState extends State<NewRoutePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New route")),
      body: Center(
        child: Column(
          children: [
            Text('This is newRoute'),
            FlatButton(
              onPressed: () {
                Navigator.pop(context, "我是返回值");
              },
              textColor: Colors.blue,
              child: Text("返回"),
            )
          ],
        ),
      ),
    );
  }
}
