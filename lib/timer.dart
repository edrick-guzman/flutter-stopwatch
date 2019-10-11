import 'package:flutter/material.dart';

void main() => runApp(Timer());

class Timer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _Timer();
  }
}

class _Timer extends State<Timer> {
  int secondsPassed = 0;
  bool isActive = false;
  
  @override
  Widget build(BuildContext context) {

  }
  
}