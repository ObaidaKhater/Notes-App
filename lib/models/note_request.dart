import 'package:flutter/cupertino.dart';
import 'package:notes_app/models/category.dart';
import 'package:notes_app/models/item_check.dart';
import 'package:notes_app/models/note.dart';

class NoteRequest {
  Note note;
  Category category;
  List<ItemCheck> itemsCheck;

  NoteRequest(
      {@required this.note,
      @required this.category,
      @required this.itemsCheck});
}
