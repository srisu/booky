import 'package:flutter/material.dart';
class ProductBox extends StatelessWidget {

//  final booksDao = booksDao();
  ProductBox({Key key, this.name,this.isbn}) :
        super(key: key);
  final String name;
  final String isbn;

  Widget build(BuildContext context) {
    return InkWell(
        onTap: null, // handle your onTap here
        splashColor: Colors.blue,
        child: Container(
            padding: EdgeInsets.all(2),
            height: 120,
            child: Card(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
//                  Image.asset("assets/appimages/" + image),
                      Expanded(
                          child: Container(
                              padding: EdgeInsets.all(5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                      "Name:" + this.name, style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  )
                                  ),
                                  Text("ISBN:" + this.isbn)
                                ],
                              ),
                          )
                      )
                    ]
                )
            )
        ));
  }
}