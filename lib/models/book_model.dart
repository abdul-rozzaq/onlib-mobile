
// import 'dart:convert';

// List<Book> booksFromJson(String str) => List<Book>.from(json.decode(str).map((x) => Book.fromJson(x)));

// class Book {
//     int id;
//     String name;
//     String description;
//     String isbn;
//     int pagesCount;
//     int author;
//     List<int> categories;

//     Book({
//         required this.id,
//         required this.name,
//         required this.description,
//         required this.isbn,
//         required this.pagesCount,
//         required this.author,
//         required this.categories,
//     });

//     factory Book.fromJson(Map<String, dynamic> json) => Book(
//         id: json["id"],
//         name: json["name"],
//         description: json["description"],
//         isbn: json["isbn"],
//         pagesCount: json["pages_count"],
//         author: json["author"],
//         categories: List<int>.from(json["categories"].map((x) => x)),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "description": description,
//         "isbn": isbn,
//         "pages_count": pagesCount,
//         "author": author,
//         "categories": List<dynamic>.from(categories.map((x) => x)),
//     };
// }


import 'dart:convert';

import 'category_model.dart';

List<Book> booksFromJson(String str) => List<Book>.from(json.decode(str).map((x) => Book.fromJson(x)));


class Book {
    int id;
    Author author;
    List<Category> categories;
    String name;
    String description;
    String isbn;
    int pagesCount;

    Book({
        required this.id,
        required this.author,
        required this.categories,
        required this.name,
        required this.description,
        required this.isbn,
        required this.pagesCount,
    });

    factory Book.fromJson(Map<String, dynamic> json) => Book(
        id: json["id"],
        author: Author.fromJson(json["author"]),
        categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
        name: json["name"],
        description: json["description"],
        isbn: json["isbn"],
        pagesCount: json["pages_count"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "author": author.toJson(),
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "name": name,
        "description": description,
        "isbn": isbn,
        "pages_count": pagesCount,
    };
}

class Author {
    int id;
    String firstName;
    String lastName;

    Author({
        required this.id,
        required this.firstName,
        required this.lastName,
    });

    factory Author.fromJson(Map<String, dynamic> json) => Author(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
    };
}



