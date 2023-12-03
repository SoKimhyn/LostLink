
import 'package:finder/view/chat-bubble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Messages extends StatelessWidget {
  Messages({required this.schoolCode,required this.category});
  final schoolCode;
  final category;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection(category).snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot<Map<String,dynamic>>> snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final chatDoc = snapshot.data!.docs;
          return ListView.builder(
              reverse: true,
              itemCount: chatDoc.length,
              itemBuilder: (context,index){
            return ChatBubble(
                name : chatDoc[index]['name'],
                place : chatDoc[index]['place'],
                description : chatDoc[index]['description'],
                imgUrl : chatDoc[index]['imgUrl'],
                time : (chatDoc[index]['time'] as Timestamp).toDate(),
                schoolCode: schoolCode,
                category: category,
            );
          });
        }
    );
  }
}
