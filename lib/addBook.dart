import 'package:flutter/material.dart';
import 'homepage.dart';
import 'models/book.dart';
import 'service/booksDao.dart';


class AddBook extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddBookState();
  }
}

class _AddBookState extends State<AddBook> {

  final myBookController = TextEditingController();
  final myIsbnCntroller = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myBookController.dispose();
    myIsbnCntroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String outputs = "";
    return Scaffold(
        appBar: AppBar(
          title: Text("Add a bok"),
        ),
        body: new SafeArea(
            top: false,
            bottom: false,
            child: new Form(
                child: new ListView(children: <Widget>[
                  new TextFormField(
                      controller: myBookController,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.book),
                        hintText: 'Enter the name of the book',
                        labelText: 'Name',
                      )), new TextFormField(
                      controller: myIsbnCntroller,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.confirmation_number),
                        hintText: 'Enter the ISBN',
                        labelText: 'ISBN',
                      )), new Container(

                      padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                      child: new RaisedButton(
                        child: const Text('Submit'),
                        onPressed: () {
                          outputs = "Failed";
                          insertBook(Book(
                              name: myBookController.text,
                              isbn: myIsbnCntroller.text)).then((s)=>{outputs= s});
                          return showDialog<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Add Book'),
                                content: Text(outputs),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text("Close"),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        new MaterialPageRoute(
                                          builder: (context) => new MyHomePage(),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          );
//                          return AlertDialog(title: Text(insertBook(Book(
//                              name: myBookController.text,
//                              isbn: myIsbnCntroller.text)).toString()));
                        },
                      ))
                ]))));
  }
}


