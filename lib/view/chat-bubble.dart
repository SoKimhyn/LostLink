import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatBubble extends StatefulWidget{
  final String name;
  final String place;
  final String description;
  final String imgUrl;
  final DateTime time;
  final String schoolCode;
  final String category;

  ChatBubble({required this.name,required this.place, required this.description, required this.imgUrl, required this.time
  ,required this.schoolCode,required this.category});
  @override
  ChatBubblesState createState() => ChatBubblesState(name:name, place: place, description: description
  ,imgUrl: imgUrl,time: time, schoolCode: schoolCode,category: category);
}

class ChatBubblesState extends State<ChatBubble> {
   ChatBubblesState({required this.name,required this.place,required this.description,
     required this.imgUrl,required this.time,required this.schoolCode, required this.category});

  final String name;
  final String place;
  final String description;
  final String imgUrl;
  final DateTime time;
   final String schoolCode;
   final String category;

  @override
  Widget build(BuildContext context) {
    String prefix = "https://firebasestorage.googleapis.com/v0/b/finder-310f0.appspot.com/o/image%2F";
    String suffix = "%2Ffile?alt=media";
    String imageResource = prefix+imgUrl+suffix;
    return
        Container(
          child: Column(
            children: [
              Image.network(
                  imageResource
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.blue,
                ),
                contentPadding: EdgeInsets.all(0),
                title: Text(name),
                subtitle: Text(place),
                isThreeLine: false,
                trailing:
                Text(description),
              ),

            ],
          ),
        );
  }
}
