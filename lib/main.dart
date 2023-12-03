import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finder/app.dart';
import 'package:finder/firebase_options.dart';
import 'package:finder/view/schoolcode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // ).then((value) => {
  runApp(MyApp(startWidget: SchoolCode()));
  // });

}
