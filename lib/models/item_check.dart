import 'package:flutter/cupertino.dart';
import 'package:notes_app/helpers/database_helper.dart';

class ItemCheck {
  int noteId;
  String title;
  bool isDone;

  ItemCheck({this.noteId, this.title, this.isDone});

  ItemCheck.fromMap(Map<String, dynamic> map) {
    this.noteId = map[DbHelper.idNoteItemCheckColumn];
    this.title = map[DbHelper.titleItemCheckColumn];
    this.isDone = (map[DbHelper.isDoneItemCheckColumn] == 1) ? true : false;
  }

  toMap() {
    return {
      DbHelper.idNoteItemCheckColumn: this.noteId,
      DbHelper.titleItemCheckColumn: this.title,
      DbHelper.isDoneItemCheckColumn: (this.isDone == true) ? 1 : 0,
    };
  }
}
