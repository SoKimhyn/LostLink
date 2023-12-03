import 'package:finder/view/find-it-list.dart';
import 'package:finder/view/find-me-list.dart';
import 'package:flutter/material.dart';


class MenuList extends StatefulWidget {
  final schoolCode;
  const MenuList({Key? key, required this.schoolCode}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MenuListState(schoolCode:  schoolCode);
  }

}

class _MenuListState extends State<MenuList>{
  final schoolCode;
  _MenuListState({required this.schoolCode});

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    mainAxisSize: MainAxisSize.min;
    mainAxisAlignment: MainAxisAlignment.center;
    return Scaffold(
      appBar: AppBar(
          title: const Text('looking for a lost item?'),
          leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () {
            Navigator.pop(context);
          },),
          backgroundColor: const Color.fromARGB(255, 0, 36, 66)),

      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 270.0),

            ElevatedButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(16.0),
                  textStyle: const TextStyle(fontSize: 20),
                ),

                onPressed: ((){
                  Navigator.push(

                      context,
                      MaterialPageRoute(builder: (context) => FindItList(schoolCode: schoolCode),
                      ));
                }), child: const Text('Submit a lost item I found')),
            const SizedBox(height: 25.0),
            ElevatedButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(16.0),
                  textStyle: const TextStyle(fontSize: 20),

                ),
                onPressed: ((){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FindMeList(schoolCode: schoolCode),
                      ));
                }), child: const Text('Go find my lost item')),
          ],
        ),
      ),
    );
  }
}
