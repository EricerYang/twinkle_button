import 'package:flutter/material.dart';
import 'package:twinkle_button/twinkle_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Twinkle Button'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Center(
                child: TwinkleButton(
                    buttonTitle: Text(
                      'Download',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 17.0,
                      ),
                    ),
                    buttonColor: Color(0xffFF4758),
                    twinkleTime: 100,
                    onclickButtonFunction: () {
                      print('hello');
                    }
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: TwinkleButton(
                    buttonTitle: Text(
                      'Subscribe with Free Trial',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 17.0,
                      ),
                    ),
                    buttonColor: Color(0xff3dce89),
                    onclickButtonFunction: () {
                      print('hello');
                    }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
