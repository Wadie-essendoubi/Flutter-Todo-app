import 'package:flutter/material.dart';
//import 'package:device_simulator/device_simulator.dart';

import 'screens/addtodoScreen.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home:AddTodo()
      
     
    );
  }
}

