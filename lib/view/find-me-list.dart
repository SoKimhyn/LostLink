import 'package:finder/view/find-me.dart';
import 'package:flutter/material.dart';


class FindMeList extends StatefulWidget {
  final schoolCode;
  const FindMeList({Key? key, required this.schoolCode}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FindMeListState(schoolCode: schoolCode);
  }

}

class _FindMeListState extends State<FindMeList>{
  final String schoolCode;

  _FindMeListState({required this.schoolCode});


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
      body: GridView.count(
          crossAxisCount : 2,
          children: <Widget>[
            InkWell(
              onTap: ((){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FindMe(schoolCode: schoolCode,category: "clothes",),
                    ));
              }),
              child: Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: Image.asset('assets/clothes.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FindMe(schoolCode: schoolCode,category: "clothes",),
                          ));
                    },
                  )
              ),
            ),
            InkWell(
              onTap: ((){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FindMe(schoolCode: schoolCode,category: "Accessories",),
                    ));
              }),
              child: Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: Image.asset('assets/Accessories.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FindMe(schoolCode: schoolCode,category: "Accessories",),
                          ));
                    },
                  )
              ),
            ),
            InkWell(
              onTap: ((){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FindMe(schoolCode: schoolCode,category: "Waterbottle",),
                    ));
              }),
              child: Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: Image.asset('assets/Waterbottle.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FindMe(schoolCode: schoolCode,category: "Waterbottle",),
                          ));
                    },
                  )
              ),
            ),
            InkWell(
              onTap: ((){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FindMe(schoolCode: schoolCode,category: "ETC",),
                    ));
              }),
              child: Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: Image.asset('assets/ETC.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FindMe(schoolCode: schoolCode,category: "ETC",),
                          ));
                    },
                  )
              ),
            )
          ]
      ),
    );
  }
}
