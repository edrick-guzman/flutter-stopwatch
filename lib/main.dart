import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(TimerAppState());


class TimerAppState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _TimerAppState();
  }
  
}

class _TimerAppState extends State<TimerAppState> {
  static const duration = const Duration(seconds:1);

  int secondsPassed = 0;
  bool isActive = false;

  Timer timer;

  void handleTick() {
    if (isActive) {
      setState(() {
        secondsPassed = secondsPassed + 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    if (timer == null)
      timer = Timer.periodic(duration, (Timer t) {
        handleTick();
    });

    int seconds = secondsPassed % 60;
    int minutes = secondsPassed ~/ 60;
    int hours = secondsPassed ~/ (60*60);

    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stopwatch App'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 20.0),
                child: Text(
                  'Basic Timer',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w300
                  ) ,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TimerTextContainer(label: 'HRS', value: hours.toString().padLeft(2, '0')),
                  TimerTextContainer(label: 'MIN', value: minutes.toString().padLeft(2, '0')),
                  TimerTextContainer(label: 'SEC', value: seconds.toString().padLeft(2, '0'))
                ],
              ),
              Container(
                margin: EdgeInsets.only(left:10.0,right: 10.0, top:10.0),
                child: RaisedButton(
                  color: Colors.blue,
                  child: Text(isActive ? 'STOP' : 'START'),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)
                  ),
                  onPressed: () {
                    setState(() {
                      isActive = !isActive;
                    });
                  },
                )
              ),
              Container(
                margin: EdgeInsets.only(left:10.0,right: 10.0, bottom:10.0),
                child: RaisedButton(
                  color: Colors.white,
                  child: Text('RESET'),
                  textColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(width: 1.0, color: Colors.blue)
                  ),
                  onPressed: () {
                    setState(() {
                      isActive = false;
                      secondsPassed = 0;
                    });
                  },
                )
              )
            ],
          )
          
        ),
      ),
    );
  }
}

class TimerTextContainer extends StatelessWidget {

  TimerTextContainer({this.label, this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.all(20.0),
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.circular(10.0),
        color: Colors.blue
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            '$value',
            style: TextStyle(
              color: Colors.white,
              fontSize: 35,
              fontWeight: FontWeight.bold
            )
          ),
          Text(
            '$label',
            style: TextStyle(
              color: Colors.white70,
            )
          )
        ]
      )
    );
  }
}
