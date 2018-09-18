
/*

class MessageList extends StatelessWidget {
  MessageList({this.firestore});

  final Firestore firestore;

  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('eco').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return const Text('Loading...');
        final int messageCount = snapshot.data.documents.length;
        return new ListView.builder(
          itemCount: messageCount,
          itemBuilder: (_, int index) {
            final DocumentSnapshot document = snapshot.data.documents[index];
            return new ListTile(
              title: new Text(document['data '] ?? '<No message retrieved>'),
              subtitle: new Text('Message ${index + 1} of $messageCount'),
            );
          },
        );
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({this.firestore});
  final Firestore firestore;
  CollectionReference get messages => firestore.collection('messages');

  Future<Null> _addMessage() async {
    final DocumentReference document = messages.document();
    document.setData(<String, dynamic>{
      'message': 'Hello world!',
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Firestore Example'),
      ),
      body: new MessageList(firestore: firestore),
      floatingActionButton: new FloatingActionButton(
        onPressed: _addMessage,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}*/
/*class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StreamSubscription<DocumentSnapshot> subscription;
  final DocumentReference documentReference =
  Firestore.instance.document("myData/1");
  void click()
  {
    documentReference.snapshots().listen((datasnapshot) {
       print(datasnapshot.data.toString());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new FlatButton(onPressed: click, child: new Text("click",style: new TextStyle(color: Colors.blue),)),
    );
  }
}*/
import 'dart:async';

import 'package:ecommerce/ProductDetail.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class MessageList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('myData').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        final int messageCount = snapshot.data.documents.length;
         return new GridView.count(crossAxisCount: 2,
           children: List.generate(messageCount, (index){
             final DocumentSnapshot document = snapshot.data.documents[index];
             return new InkWell(
                 child: new Card(
                   child: new Container(
                     height: 124.0,
                     decoration: new BoxDecoration(color: Colors.white,
                         shape: BoxShape.rectangle,
                         borderRadius: new BorderRadius.circular(8.0),
                         boxShadow: <BoxShadow>[
                           new BoxShadow(
                               color: Colors.white,
                               blurRadius: 10.0,
                               offset: new Offset(0.0, 10.0)
                           )
                         ]
                     ),
                     child: new Container(
                       child: new Image.network(document['image'],fit: BoxFit.fill,
                       ),
                     ),
                   ),
                 ),
               onTap: (){
                 Navigator.push(
                     context,
                     MaterialPageRoute(
                         builder: (context) => ProductDetail(
                           image: document['image'],
                         )));
               },
             );
           }),
         );
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({this.firestore});
  final Firestore firestore;
  CollectionReference get messages => firestore.collection('eco');

  Future<Null> _addMessage() async {
    final DocumentReference document = messages.document();
    document.setData(<String, dynamic>{
      'message': 'Hello world!',
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firestore Example'),
      ),
      body: MessageList(),

    );
  }
}
