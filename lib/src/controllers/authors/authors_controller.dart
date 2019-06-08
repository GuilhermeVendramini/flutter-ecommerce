import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/data/authors_data.dart';
import 'package:flutter_ecommerce/src/models/author_model.dart';

class AuthorsController with ChangeNotifier {
  List<Map<String, dynamic>> _authorsData;
  List<AuthorModel> _authors = [];
  Iterable<AuthorModel> _author;
  bool _isAuthorsLoaded;
}

class Authors extends AuthorsController {
  List<AuthorModel> get getAuthorsItems {
    return _authors;
  }

  AuthorModel getAuthor(int id) {
    _author = _authors.where((author) => author.id == id);
    return _author.first;
  }

  bool get isAuthorsLoaded {
    return _isAuthorsLoaded;
  }
}

class AuthorsService extends Authors {
  loadAuthors() {
    if (_isAuthorsLoaded != null) {
      return null;
    }

    _authors = [];
    _authorsData = authorsData;
    _authorsData.forEach((item) {
      AuthorModel _author = AuthorModel(
        id: item['id'],
        name: item['name'],
        logo: 'assets/images/${item['logo']}',
        followers: item['followers'],
        slogan: item['slogan'],
      );
      _authors.add(_author);
    });
    _isAuthorsLoaded = true;
    return null;
  }
}
