import 'package:flutter/material.dart';

class Order extends StatefulWidget {
  String image;
  String size;
  Order({Key key, this.image, this.size});
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.greenAccent,
        title: new Text("Order"),
        centerTitle: true,
      ),
      body: Column(

        children: <Widget>[
          new Container(
            height: 50.0,
          ),
          new Card(
            child: new Container(
              height: 244.0,
              width: 244.0,
              decoration: new BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: new BorderRadius.circular(18.0),
                  boxShadow: <BoxShadow>[
                    new BoxShadow(
                        color: Colors.white,
                        blurRadius: 10.0,
                        offset: new Offset(0.0, 10.0))
                  ]),
              child: new Container(
                child: new Image.network(
                  widget.image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          new Container(height: 20.0,),
          new Text("Size -> ${widget.size}",style: new TextStyle(color: Colors.black,fontSize: 45.0),),
          new Container(height: 50.0,),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Container(
               child: new FlatButton(onPressed: null, child: new Text("Add To Cart",style: new TextStyle(color: Colors.black),),),
                color: Colors.redAccent,
              ),
              new Container(
                child: new FlatButton(onPressed: null, child: new Text("Move To WishList",style: new TextStyle(color: Colors.black),),),
                color: Colors.redAccent,
              ),
              new Container(
                child: new FlatButton(onPressed: null, child: new Text("Place Order",style: new TextStyle(color: Colors.black),),),
                color: Colors.redAccent,
              ),
            ],
          )
        ],
      )
    );
  }
}
