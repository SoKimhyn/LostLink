import 'package:finder/view/message.dart';
import 'package:flutter/material.dart';


class FindMe extends StatefulWidget {
  final schoolCode;
  final category;
  const FindMe({Key? key, required this.schoolCode,required this.category}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FindMeState(schoolCode: schoolCode,category: category);
  }

}

class _FindMeState extends State<FindMe>{

  final schoolCode;
  final category;
  _FindMeState({required this.schoolCode,required this.category});


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
            title: const Text('Lost Items'),
            leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () {
              Navigator.pop(context);
            },),
            backgroundColor: const Color.fromARGB(255, 0, 36, 66)),
        body: Container(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              Expanded(child: Messages(schoolCode: schoolCode,category: category,)),
            ],),));
  }
}