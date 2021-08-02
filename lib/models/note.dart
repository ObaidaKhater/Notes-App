import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/helpers/database_helper.dart';
import 'package:notes_app/models/category.dart';
import 'package:notes_app/models/item_check.dart';
import 'package:notes_app/data/theme_data.dart';

class Note {
  int id;
  String title;
  String description;
  int colorHexCode;
  String imagePath;
  int categoryId;

  Note(
      {this.id,
      @required this.title,
      this.description,
      this.colorHexCode,
      this.categoryId,
      this.imagePath});

  Note.fromMap(Map<String, dynamic> map) {
    this.id = map[DbHelper.idNotesColumn];
    this.title = map[DbHelper.titleNotesColumn];
    this.description = map[DbHelper.desNotesColumn];
    this.colorHexCode = map[DbHelper.colorNotesColumn];
    this.categoryId = map[DbHelper.catIdNotesColumn];
    this.imagePath = map[DbHelper.imagePathNotesColumn];
  }

  toMap() {
    return {
      DbHelper.titleNotesColumn: this.title,
      DbHelper.desNotesColumn: this.description,
      DbHelper.colorNotesColumn: this.colorHexCode,
      DbHelper.imagePathNotesColumn: this.imagePath,
      DbHelper.catIdNotesColumn: this.categoryId,
    };
  }
}
