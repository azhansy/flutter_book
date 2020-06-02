import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_book/core/base_config.dart';
import 'package:flutter_book/page/clip_test_page.dart';
import 'package:flutter_book/page/flutter_error_page.dart';
import 'package:flutter_book/page/new_route_page.dart';
import 'package:flutter_book/page/scroll_page.dart';

void main() {
  ///1、处理Flutter为我们捕获的异常
  FlutterError.onError = (FlutterErrorDetails details) {
    print(details);
  };
  runZoned(
    () {
      runApp(MyApp());
    },
    //拦截所有的print
    zoneSpecification: new ZoneSpecification(
        print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
      if (BaseConfig.DEBUG) {
        parent.print(zone, "Intercepted: $line");
      }
    }),
    onError: (obj, stack) {
      print("onError");
//      var details=makeDetails(obj,stack);
//      reportError(details);
    },
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
//      onGenerateRoute: (RouteSettings settings) {
//        String routeName = settings.name;
//        print("有趣======$routeName");
//        return null;
//
//        return MaterialPageRoute(builder: (context) {
//          return MyHomePage(title: 'Flutter Demo Home Page');
//        });
//      },
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> list = ["跳转路由", "flutter异常处理", "进度条", "clip"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                if (index == 0) {
                  pushNewRoutePage(context);
                } else if (index == 1) {
                  pushFlutterErrorPage(context);
                } else if (index == 2) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ScrollPage()));
                } else if (index == 3) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ClipTestPage()));
                }
              },
              child: ListTile(
                title: Text(list[index], style: TextStyle(color: Colors.blue)),
              ),
            );
          },
          itemCount: list.length,
        ),
      ),
    );
  }

  Future pushNewRoutePage(BuildContext context) async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) {
            return NewRoutePage();
          },
          fullscreenDialog: false,
          maintainState: false),
    );
    //              var result  = await Navigator.pushNamed(context, "routeName");

    print("路由返回值：$result");
  }

  void pushFlutterErrorPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return FlutterErrorPage();
    }));
  }
}
