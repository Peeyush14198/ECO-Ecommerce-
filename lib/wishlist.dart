import 'dart:async';
import 'dart:io'as io;
import 'package:ecommerce/ProductDetail.dart';
import 'package:ecommerce/databaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class WishList extends StatefulWidget {
  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  databaseHelper db = new databaseHelper();
  List<String> list = new List();
  var count;
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      db.getEmployees().then((List<String> val){
        print(val.toString());
        count  = val.length;
        list = val.toList();
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Wishlist'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: new GridView.count(crossAxisCount: 2,
          children: List.generate(list.length, (index){
            final document = list[index];
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
                    child: new Image.network(document,fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductDetail(
                          image: document,
                        )));
              },
            );
          }),
        )
    );
  }
}
