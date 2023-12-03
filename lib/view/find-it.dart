import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart';

class FindIt extends StatefulWidget {
  final schoolCode;
  final category;
  const FindIt({Key? key, required this.schoolCode,required this.category}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FindItState(schoolCode: schoolCode,category:category);
  }
}

class _FindItState extends State<FindIt>{
  _FindItState({required this.schoolCode,required this.category});
  final schoolCode;
  final category;
  File? _photo;
  String uploadName = '';
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    final nameController = TextEditingController();
    final descController = TextEditingController();
    final placeController = TextEditingController();


    String name='';
    String description='';
    String place='';
    final screenWidth = MediaQuery.of(context).size.width;

    firebase_storage.FirebaseStorage storage =
        firebase_storage.FirebaseStorage.instance;

    final ImagePicker picker = ImagePicker();


    Future uploadFile() async {
      if (_photo == null) return;
      final fileName = basename(_photo!.path);
      final destination = 'image/$fileName';
      //gs://finder-310f0.appspot.com/files/image_picker_A2C6C0E4-A9D4-4950-BCBD-02267D79E7F7-23512-0000028123B23F68.jpg
      try {
        final ref = firebase_storage.FirebaseStorage.instance
            .ref(destination)
            .child('file/');

        await ref.putFile(_photo!);
      } catch (e) {
        print('error occured');
      }

    }
    void save(String name,String place, String description){
      uploadFile().then((value) => {
        FirebaseFirestore.instance.collection(category).add({
          "name":name,
          "place":place,
          "imgUrl":uploadName,
          "description":description,
          "time":Timestamp.now()
        })
      }).then((value) => {
        Navigator.pop(context)
      });
    }
    Future imgFromGallery() async {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      setState(() {
        if (pickedFile != null) {
          _photo = File(pickedFile.path);
        } else {
          print('No image selected.');

        }
      });
      return pickedFile!;
    }

    Future imgFromCamera() async {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);

      setState(() {
        if (pickedFile != null) {
          _photo = File(pickedFile.path);
          uploadFile();
        } else {
          print('No image selected.');
        }
      });
    }
    void _showPicker(context) {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext bc) {
            return SafeArea(
              child: Container(
                child: Wrap(
                  children: <Widget>[
                    ListTile(
                        leading: const Icon(Icons.photo_library),
                        title: const Text('Gallery'),
                        onTap: () {
                          imgFromGallery().then((value) => {
                              setState((){
                                uploadName = value;
                                nameController.text = name;
                                descController.text = description;
                                placeController.text = place;
                              })
                          });
                          Navigator.of(context).pop();
                        }),
                    ListTile(
                      leading: const Icon(Icons.photo_camera),
                      title: const Text('Camera'),
                      onTap: () {
                        imgFromCamera();
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            );
          });
    }

    return Scaffold(
        appBar: AppBar(
            title: const Text('Lost Items'),
            leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () {
              Navigator.pop(context);
            },),
            backgroundColor: const Color.fromARGB(255, 0, 36, 66)),
        body: SingleChildScrollView(
          child:
          Container(
            child: Padding(
              padding: const EdgeInsets.all(80),
              child: Center(

                child: Column(
                  children: [
                    TextField(
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name of the item',
                      ),
                      onChanged: ((value){
                        name = nameController.text; //WHERE IT STORES THE USER INPUT OF NAME
                        //nameController.value = name as TextEditingValue;
                      }),
                    ),
                    const SizedBox(height: 10,),
                    TextField(
                      controller: descController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'description of the item',
                      ),
                      onChanged: ((value){
                        description = descController.text; //WHERE IT STORES THE USER INPUT OF DESCRIPTION
                      }),
                    ),
                    const SizedBox(height: 10,),
                    TextField(
                      controller: placeController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'place you found the item',
                      ),
                      onChanged: ((value){
                        place = placeController.text; // WHERE IT STORES THE USER INPUT OF PLACE
                      }),
                    ),
                    //SizedBox(height: 40,),
                    //ImageUploads(),
                    const SizedBox(height: 30,),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          _showPicker(context);
                        },
                        child: CircleAvatar(
                          radius: 55,
                          backgroundColor: const Color(0xff002442),
                          child: _photo != null
                              ? ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.file(
                              _photo!,
                              width: 100,
                              height: 100,
                              fit: BoxFit.fitHeight,
                            ),
                          )
                              : Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(50)),
                            width: 100,
                            height: 100,
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.grey[800],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30,),
                    ElevatedButton(
                        onPressed: ((){
                          save(name,place,description);
                        }),
                        child: const Text('save')
                    ),
                  ],
                ),
              ),
            ),
          ),
        )

    );

  }

}
