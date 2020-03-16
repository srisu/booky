import 'package:flutter/material.dart';
import 'package:unicorndial/unicorndial.dart';
import 'addBook.dart';
import 'service/booksDao.dart';
import 'models/book.dart';
import 'productBox.dart';


class MyHomePage extends StatelessWidget {


  Widget _profileOption({IconData iconData, Function onPressed}) {
    return UnicornButton(
        currentButton: FloatingActionButton(
          heroTag: null,
          backgroundColor: Colors.blue[700],
          mini: true,
          child: Icon(iconData),
          onPressed: onPressed,
        ));
  }

  Widget dynView(){
    return FutureBuilder<List<Book>>(
        future: getBooks(),
        builder: (context, snapshot) {
          if(snapshot.connectionState != ConnectionState.done) {
            // return: show loading widget
          }
          if(snapshot.hasError) {
            // return: show error widget
          }
          List<Book> users = snapshot.data ?? [];
          return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: users.length,
              itemBuilder: (context, index) {
                Book user = users[index];
                return new ProductBox(name: user.name,isbn: user.isbn);
              });
        });
  }

  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
//    List<Widget> list = [];
//    FutureBuilder<List<Book>>(
//        future: getBooks(), // async work
//        // ignore: missing_return
//        builder: (BuildContext context, AsyncSnapshot snapshot) {
//          switch (snapshot.connectionState) {
//            case ConnectionState.waiting:
//              return new Text('Loading....');
//            default:
//              if (snapshot.hasError)
//                return new Text('Error: ${snapshot.error}');
//              else {
//              for (var i=0; i < snapshot.data.length;i++){
//                list.add(new ProductBox(name:snapshot.data[i].name,isbn:snapshot.data[i].isbn));
//              }
//return  list;
//              }
//          }
//        },
//      );



//    };

    List<UnicornButton> _getProfileMenu() {
      List<UnicornButton> children = [];
      children.add(_profileOption(iconData: Icons.search, onPressed: () {
        getBooks();
      }));
      children.add(_profileOption(iconData: Icons.add, onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddBook()),
        );
      }));
      children.add(_profileOption(iconData: Icons.remove, onPressed: () {}));
      return children;
    }

    return Scaffold(
        appBar: AppBar(title: Text("Product Listing")),
        body:
        SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Row(
                children: <Widget>[Expanded(child: dynView())]
            )
        ),
//        ListView(
//            shrinkWrap: true,
//            padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
//            children: <Widget>[dynView()]
//        ),
//            <Widget>[ProductBox(
//                name: 'a',
//                isbn: 'a'
//            ),
//            ]),
        floatingActionButton: UnicornDialer(
          hasBackground: false,
          parentButtonBackground: Colors.blue[700],
          orientation: UnicornOrientation.VERTICAL,
          parentButton: Icon(Icons.settings),
          childButtons: _getProfileMenu(),
        )
    );
  }
}

