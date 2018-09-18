import 'package:flutter/material.dart';
class ProductDetail extends StatefulWidget {
  final String image;
  ProductDetail({Key key , this.image});
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
/*
int _value =1;
int counter  = 0;
void _decrementCounter(){
  setState(() {
    if(counter!=0)
      {
        counter--;
      }
  });
}
void _incrementCounter()
{
  setState(() {
    counter++;
  });
}
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Coming Soon"),
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
                new Container(height: 150.0,),
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
                                    print("If you stand for nothing, Burr, what’ll you fall for?");
                                  }
                              ),
                              new Container(width: 10.2,),
                              new ActionChip(
                                  avatar: new CircleAvatar(
                                    backgroundColor: Colors.grey.shade800,
                                  ),
                                  label: new Text('M'),
                                  onPressed: () {
                                    print("If you stand for nothing, Burr, what’ll you fall for?");
                                  }
                              ),
                              new Container(width: 10.2,),
                              new ActionChip(
                                  avatar: new CircleAvatar(
                                    backgroundColor: Colors.grey.shade800,
                                  ),
                                  label: new Text('L'),
                                  onPressed: () {
                                    print("If you stand for nothing, Burr, what’ll you fall for?");
                                  }
                              ),
                              new Container(width: 10.2,),
                              new ActionChip(
                                  avatar: new CircleAvatar(
                                    backgroundColor: Colors.grey.shade800,
                                  ),
                                  label: new Text('XL'),
                                  onPressed: () {
                                    print("If you stand for nothing, Burr, what’ll you fall for?");
                                  }
                              ),
                            ],
                          )
                        ),
                        new SizedBox(
                          height: 10.0,
                        ),
                        new Text(
                          "Total Items",
                          style: new TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w700),
                        ),
                        new Container(height: 20.0,),
                        new SizedBox(
                          height: 10.0,
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            new FloatingActionButton(
                              onPressed: _decrementCounter,
                              tooltip: 'Increment',
                              backgroundColor: Colors.greenAccent,
                              child: new Icon(Icons.remove,color: Colors.black),
                            ),
                            new Text("$counter"),
                            new FloatingActionButton(
                              onPressed: _incrementCounter,
                              tooltip: 'Increment',
                              backgroundColor: Colors.greenAccent,
                              child: new Icon(Icons.add,color: Colors.black,),
                            ),
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
            child: new Icon(Icons.shopping_cart),
            backgroundColor: Colors.greenAccent,
          ),
          new CircleAvatar(
            radius: 10.0,
            backgroundColor: Colors.red,
            child: new Text(
              "$counter",
              style: new TextStyle(color: Colors.white, fontSize: 12.0),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: new BottomAppBar(
        color: Colors.greenAccent,
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
                child: new Text(
                  "ADD TO FAVORITES",
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
              ),
              new Container(
                width: (screenSize.width - 20) / 2,
                child: new Text(
                  "ORDER NOW",
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/
int counter=0;
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
                                      print("If you stand for nothing, Burr, what’ll you fall for?");
                                    }
                                ),
                                new Container(width: 10.2,),
                                new ActionChip(
                                    avatar: new CircleAvatar(
                                      backgroundColor: Colors.grey.shade800,
                                    ),
                                    label: new Text('M'),
                                    onPressed: () {
                                      print("If you stand for nothing, Burr, what’ll you fall for?");
                                    }
                                ),
                                new Container(width: 10.2,),
                                new ActionChip(
                                    avatar: new CircleAvatar(
                                      backgroundColor: Colors.grey.shade800,
                                    ),
                                    label: new Text('L'),
                                    onPressed: () {
                                      print("If you stand for nothing, Burr, what’ll you fall for?");
                                    }
                                ),
                                new Container(width: 10.2,),
                                new ActionChip(
                                    avatar: new CircleAvatar(
                                      backgroundColor: Colors.grey.shade800,
                                    ),
                                    label: new Text('XL'),
                                    onPressed: () {
                                      print("If you stand for nothing, Burr, what’ll you fall for?");
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
                  print("hello");
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
                    print("hello");
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