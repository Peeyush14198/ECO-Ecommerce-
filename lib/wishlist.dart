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
      body: new ListView.builder(itemCount: list.length,
      itemBuilder: (context,position){
        return Card(
          child: Image.network(list[position]),// Add image view in python to create analysis 
        );
      },
      )
    );
  }
}
