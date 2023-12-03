import 'package:flutter/material.dart';



class MyApp extends StatelessWidget {

  const MyApp({Key? key ,required this.startWidget})
      : super(key: key);
  final startWidget;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'df',
      home: startWidget,
    );
  }

}
