import 'package:notes_app/models/category.dart';
import 'package:notes_app/models/item_check.dart';
import 'package:notes_app/models/note.dart';

class NoteData {
  NoteData._();

  static NoteData noteData = NoteData._();

  int colorHexCode = 0xFF0E121B;
  String title;
  String description;
  String imagePath;
  Category category;
  List<ItemCheck> itemsCheck;
  int currentCategoryId;
}
