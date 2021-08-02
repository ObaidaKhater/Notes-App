import 'package:flutter/cupertino.dart';
import 'package:notes_app/helpers/database_helper.dart';

class Category {
  int id;
  String title;

  Category({this.id, this.title});

  Category.fromMap(Map<String, dynamic> map) {
    this.id = map[DbHelper.idCategoryColumn];
    this.title = map[DbHelper.titleCategoryColumn];
  }

  toMap() {
    return {
      DbHelper.titleCategoryColumn: this.title,
    };
  }
}
