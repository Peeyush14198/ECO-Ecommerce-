import 'dart:async';
import 'dart:io'as io;
import 'package:ecommerce/order.dart';
import 'package:ecommerce/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
class ProductDetail extends StatefulWidget {
  final String image;
  ProductDetail({Key key , this.image});
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
int counter=0;
String size;
static Database _db;

Future<Database> get db async {
  if(_db != null)
    return _db;
  _db = await initDb();
  return _db;
}

//Creating a database with name test.dn in your directory
initDb() async {
  io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String path = join(documentsDirectory.path, "test.db");
  var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
  return theDb;
}

// Creating a table name Employee with fields
void _onCreate(Database db, int version) async {
  // When creating the db, create the table
  await db.execute(
      "CREATE TABLE Employee(id INTEGER PRIMARY KEY, image TEXT )");
  print("Created tables");
}
  void saveEmployee(String value) async {
    var dbClient = await db;
    await dbClient.transaction((txn) async {
      return await txn.rawInsert(
          'INSERT INTO Employee(image ) VALUES(' +
              '\'' +
              value  +
              '\'' +
              ')');
    });
    print("Data Added");
  }
  Future<List<String>> getEmployees() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Employee');
    print(list.length);
    List<String> employees = new List();
    for (int i = 0; i < list.length; i++) {
      employees.add(list[i]["image"]);
    }
    print(employees.length);
    return employees;
  }
void _decrementCounter()
{
  if(counter!=0)
    {
      setState(() {
        counter--;
      });
    }
}
void _incrementCounter()
{
  {
    setState(() {
      counter++;
    });
  }
}
/*Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/counter.txt');
}
Future<File> writeFavorites()
async {
     final file  = await _localFile;
     return file.writeAsString('${widget.image}');
}
Future<String> readCounter() async {
  try {
    final file = await _localFile;

    // Read the file
    String contents = await file.readAsString();

    return contents;
  } catch (e) {
    // If we encounter an error, return 0
    return '$e';
  }
}*/
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: new AppBar(
        title: new Text("COMING SOON",style: new TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: new Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          new Container(
            height: 300.0,
            decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: new NetworkImage(widget.image),
                    fit: BoxFit.fitHeight),
                borderRadius: new BorderRadius.only(
                  bottomRight: new Radius.circular(120.0),
                  bottomLeft: new Radius.circular(120.0),
                )),
          ),
          new Container(
            height: 300.0,
            decoration: new BoxDecoration(
                color: Colors.grey.withAlpha(50),
                borderRadius: new BorderRadius.only(
                  bottomRight: new Radius.circular(120.0),
                  bottomLeft: new Radius.circular(120.0),
                )),
          ),
          new SingleChildScrollView(
            child: new Column(
              children: <Widget>[
                new SizedBox(
                  height: 50.0,
                ),
                new Container(height: 180.0,),
                new Card(
                  child: new Container(
                    width: screenSize.width,
                    height: 150.0,
                    child: new ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return new Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              new Container(
                                margin:
                                new EdgeInsets.only(left: 5.0, right: 5.0),
                                height: 140.0,
                                width: 100.0,
                                child: new Image.network(widget.image),
                              ),
                              new Container(
                                margin:
                                new EdgeInsets.only(left: 5.0, right: 5.0),
                                height: 140.0,
                                width: 100.0,
                                decoration: new BoxDecoration(
                                    color: Colors.grey.withAlpha(50)),
                              ),
                            ],
                          );
                        }),
                  ),
                ),
                new Card(
                  child: new Container(
                    width: screenSize.width,
                    margin: new EdgeInsets.only(left: 20.0, right: 20.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new SizedBox(
                          height: 10.0,
                        ),
                        new Text(
                          "Description",
                          style: new TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w700),
                        ),
                        new SizedBox(
                          height: 10.0,
                        ),
                        new Text(
                          "My item full information",
                          style: new TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.w400),
                        ),
                        new SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                ),
                new Card(
                  child: new Container(
                    width: screenSize.width,
                    margin: new EdgeInsets.only(left: 20.0, right: 20.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new SizedBox(
                          height: 10.0,
                        ),
                        new SizedBox(
                          height: 10.0,
                        ),
                        new Text(
                          "Sizes",
                          style: new TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w700),
                        ),
                        new SizedBox(
                          height: 10.0,
                        ),
                        new SizedBox(
                            height: 50.0,
                            child: new Row(
                              children: <Widget>[
                                new ActionChip(
                                    avatar: new CircleAvatar(
                                      backgroundColor: Colors.grey.shade800,
                                    ),
                                    label: new Text('S'),
                                    onPressed: () {
                                      print("Selected Size S");
                                      setState(() {
                                        size="S";
                                      });
                                    }
                                ),
                                new Container(width: 10.2,),
                                new ActionChip(
                                    avatar: new CircleAvatar(
                                      backgroundColor: Colors.grey.shade800,
                                    ),
                                    label: new Text('M'),
                                    onPressed: () {
                                      print("Selected Size M");
                                      setState(() {
                                        size="M";
                                      });
                                    }
                                ),
                                new Container(width: 10.2,),
                                new ActionChip(
                                    avatar: new CircleAvatar(
                                      backgroundColor: Colors.grey.shade800,
                                    ),
                                    label: new Text('L'),
                                    onPressed: () {
                                      print("Selected Size L");
                                      setState(() {
                                        size="L";
                                      });
                                    }
                                ),
                                new Container(width: 10.2,),
                                new ActionChip(
                                    avatar: new CircleAvatar(
                                      backgroundColor: Colors.grey.shade800,
                                    ),
                                    label: new Text('XL'),
                                    onPressed: () {
                                      print("Selected Size XL");
                                      setState(() {
                                        size="XL";
                                      });
                                    }
                                ),
                              ],
                            )
                        ),
                        new SizedBox(
                          height: 20.0,
                        ),
                        new Text(
                          "Total Items",
                          style: new TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w700),
                        ),
                        new Container(height: 30.0,),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            new FlatButton(
                              child: new Icon(Icons.remove,color: Colors.black,),
                              onPressed: _decrementCounter,
                              color: Colors.greenAccent,
                              splashColor: Colors.redAccent,
                              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.2)),
                            ),
                            new Text("$counter"),
                            new FlatButton(
                                child: new Icon(Icons.add,color: Colors.black,),
                                onPressed: _incrementCounter,
                                color: Colors.greenAccent,
                                splashColor: Colors.redAccent,
                                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.2)),
                            )
                          ],
                        ),
                        new SizedBox(
                          height: 50.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: new Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          new FloatingActionButton(
            onPressed: () {
            },
            child: new Icon(Icons.shopping_cart,color: Colors.black,),
            backgroundColor: Colors.greenAccent,
          ),
          new CircleAvatar(
            radius: 10.0,
            backgroundColor: Colors.red,
            child: new Text(
              "$counter",
              style: new TextStyle(color: Colors.black, fontSize: 12.0),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: new BottomAppBar(
        color:Colors.greenAccent,
        elevation: 0.0,
        shape: new CircularNotchedRectangle(),
        notchMargin: 5.0,
        child: new Container(
          height: 50.0,
          decoration: new BoxDecoration(color: Colors.greenAccent),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Container(
                width: (screenSize.width - 20) / 2,
                child: new FlatButton(onPressed:(){
                  saveEmployee(widget.image);
                  return showDialog(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return new AlertDialog(
                        title: new Text('Added To Wishlist'),
                        content: new SingleChildScrollView(
                        ),
                        actions: <Widget>[
                          new FlatButton(
                            child: new Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          new FlatButton(onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WishList(
                                    )));
                          }, child: new Text('Go to Wishlist'))
                        ],
                      );
                    },
                  );
                }, child: new Text(
                  "ADD TO FAVORITES",
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w700),
                ),)
              ),
              new Container(
                  width: (screenSize.width - 20) / 2,
                  child: new FlatButton(onPressed:(){
                    print("button pressed");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Order(
                              image: widget.image,
                              size: size,
                            )));
                  }, child: new Text(
                    "ORDER NOW",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w700),
                  ),)
              ),
            ],
          ),
        ),
      ),
    );
  }
}