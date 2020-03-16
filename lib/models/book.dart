class Book {
  final String name;
  final String isbn;

  Book({this.name, this.isbn});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'isbn': isbn,
    };
  }

  String getBookName(){
    return this.name;
  }

  String getBookIsbn(){
    return this.isbn;
  }
}

