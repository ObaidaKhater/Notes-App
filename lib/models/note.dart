import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/models/category.dart';
import 'package:notes_app/models/item_check.dart';

class Note {
  String id;
  String title;
  String description;
  int colorHexCode;
  String imagePath;
  Category category;
  List<ItemCheck> itemsCheck;

  Note(
      {@required this.id,
      @required this.title,
      this.description,
      this.colorHexCode,
      this.category,
      this.imagePath,
      this.itemsCheck});
}
