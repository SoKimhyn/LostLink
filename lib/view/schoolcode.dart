import 'package:finder/view/menu-list.dart';
import 'package:flutter/material.dart';


class SchoolCode extends StatefulWidget {
  const SchoolCode({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SchoolCodeState();
  }

}

class _SchoolCodeState extends State<SchoolCode>{
  String region = '';
  String regionDetail="";

  List<String>? regionList = [];


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: Row(
          children: [
            Expanded(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                child: Center(
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                    child: buildFormContainer(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  buildFormContainer() {
    late String dropdownValue;
    final myController = TextEditingController();
    List<String>? regionDetailList;
    String schoolcode ='';
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 40.0),
        TextField(
          controller: myController,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'insert your school ID.',
          ),
          onChanged: ((value){
            schoolcode = myController.text;
          }),
        ),
        const SizedBox(height: 20.0),
        const SizedBox(height: 20.0),

        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFF8DB653),
                        Color(0xFF8DB653),
                        Color(0xFF8DB653)
                      ],
                    ),
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(16.0),
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MenuList(schoolCode: schoolcode),
                      ));
                  // Navigator.push(context, route)MenuList(schoolCode: schoolcode,);
                },
                child: const Text('Enter'),
              ),
            ],
          ),
        ),
      ],
    );

  }
}
