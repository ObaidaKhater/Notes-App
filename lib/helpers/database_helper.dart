import 'dart:io';

import 'package:notes_app/data/note_data.dart';
import 'package:notes_app/models/category.dart';
import 'package:notes_app/models/item_check.dart';
import 'package:notes_app/models/note.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  DbHelper._();

  static DbHelper dbHelper = DbHelper._();
  final String fileName = 'notesDb.db';

  static final String notesTableName = 'notes';
  static final String idNotesColumn = 'id';
  static final String titleNotesColumn = 'title';
  static final String desNotesColumn = 'description';
  static final String catIdNotesColumn = 'categoryId';
  static final String imagePathNotesColumn = 'imagePath';
  static final String colorNotesColumn = 'colorHexCode';

  static final String categoriesTableName = 'categories';
  static final String idCategoryColumn = 'id';
  static final String titleCategoryColumn = 'title';

  static final String itemsCheckTableName = 'itemsCheck';
  static final String idNoteItemCheckColumn = 'noteId';
  static final String titleItemCheckColumn = 'title';
  static final String isDoneItemCheckColumn = 'isDone';

  Database database;

  initDatabase() async {
    database = await getDatabaseConnection();
  }

  Future<Database> getDatabaseConnection() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + '/$fileName';
    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, v) {
        db.execute('''CREATE TABLE $notesTableName (
          $idNotesColumn INTEGER PRIMARY KEY, 
          $titleNotesColumn TEXT,
          $desNotesColumn TEXT,
          $catIdNotesColumn INTEGER NULL,
          $imagePathNotesColumn TEXT,
          $colorNotesColumn INTEGER,
         FOREIGN KEY ($catIdNotesColumn) 
         REFERENCES $categoriesTableName ($idCategoryColumn)
         ON DELETE CASCADE)''');

        db.execute('''CREATE TABLE $categoriesTableName (
          $idCategoryColumn INTEGER PRIMARY KEY, 
          $titleCategoryColumn TEXT)''');

        db.execute('''CREATE TABLE $itemsCheckTableName (
          $idNoteItemCheckColumn INTEGER, 
          $titleItemCheckColumn TEXT,
          $isDoneItemCheckColumn INTEGER)''');
      },
      onConfigure: (db) {
        db.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (db) {
        print("Create Database");
      },
    );
    return database;
  }

  // Insert Category
  insertCat(Category category) async {
    await database.insert(categoriesTableName, category.toMap());
  }

  // Update Category
  updateCategory(Category category) async {
    await database.update(categoriesTableName, category.toMap(),
        where: '$idCategoryColumn=?', whereArgs: [category.id]);
  }

  // Delete Category
  deleteCategory(int id) async {
    await database.delete(categoriesTableName,
        where: '$idCategoryColumn=?', whereArgs: [id]);
  }

  // get All  Categories
  Future<List<Category>> getAllCategories() async {
    List<Map<String, Object>> result =
        await database.query(categoriesTableName);
    List<Category> categories = result.map((category) {
      return Category.fromMap(category);
    }).toList();
    return categories;
  }

  // Insert Note
  insertNote() async {
    if (NoteData.noteData.title.length > 0) {
      Note note = Note(
        title: NoteData.noteData.title,
        description: NoteData.noteData.description,
        colorHexCode: NoteData.noteData.colorHexCode,
        categoryId: (NoteData.noteData.category == null)
            ? null
            : NoteData.noteData.category.id,
        imagePath: NoteData.noteData.imagePath,
      );
      int noteId = await database.insert(notesTableName, note.toMap());
      await insertListItemsCheck(noteId);
    }
  }

  // Insert List Items Check
  insertListItemsCheck(int noteId) async {
    if (NoteData.noteData.itemsCheck.length > 0) {
      NoteData.noteData.itemsCheck.map((item) async {
        ItemCheck itemCheck =
            ItemCheck(noteId: noteId, title: item.title, isDone: item.isDone);
        await database.insert(itemsCheckTableName, itemCheck.toMap());
      }).toList();
    }
  }

  // Update Note
  updateNote(Note note) async {
    await database.update(notesTableName, note.toMap(),
        where: '$idNotesColumn=?', whereArgs: [note.id]);
    if (NoteData.noteData.itemsCheck.length == 0) {
      await deleteAllItemsCheckNote(note.id);
    } else {
      await deleteAllItemsCheckNote(note.id);
      await insertListItemsCheck(note.id);
    }
    print('done update --------------------------------------');
  }

  // Delete Note
  deleteNote(int noteId) async {
    await database
        .delete(notesTableName, where: '$idNotesColumn=?', whereArgs: [noteId]);
    // Clear All Items Check To Note
    await deleteAllItemsCheckNote(noteId);
  }

  // Delete All Items Check To Note
  deleteAllItemsCheckNote(int noteId) async {
    await database.delete(itemsCheckTableName,
        where: '$idNoteItemCheckColumn', whereArgs: [noteId]);
  }
}
