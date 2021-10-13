import 'dart:io';

import 'package:notes_app/data/note_data.dart';
import 'package:notes_app/models/category.dart';
import 'package:notes_app/models/item_check.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/models/note_request.dart';
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
  insertNote(Note note,List<ItemCheck> itemsCheck) async {
    int noteId = await database.insert(notesTableName, note.toMap());
    await insertListItemsCheck(noteId,itemsCheck);
  }

  // Insert List Items Check
  insertListItemsCheck(int noteId,List<ItemCheck> itemsCheck) async {
    if (itemsCheck.length > 0) {
      itemsCheck.map((item) async {
        ItemCheck itemCheck =
            ItemCheck(noteId: noteId, title: item.title, isDone: item.isDone);
        await database.insert(itemsCheckTableName, itemCheck.toMap());
      }).toList();
    }
  }

  // Update Note
  updateNote(Note newNote,int noteId,List<ItemCheck> items) async {

    List<ItemCheck> itemsCheck = await getSpecificItemsCheck(noteId);
    if (itemsCheck.length > 0) {
      await deleteAllItemsCheckNote(noteId);
      await insertListItemsCheck(noteId,items);
    } else {
      await insertListItemsCheck(noteId,items);
    }

    await database.update(notesTableName, newNote.toMap(),
        where: '$idNotesColumn=?', whereArgs: [noteId]);
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
        where: '$idNoteItemCheckColumn=?', whereArgs: [noteId]);
    List<ItemCheck> itemsCheck = await getSpecificItemsCheck(noteId);
    if (itemsCheck.length > 0) {
      deleteAllItemsCheckNote(noteId);
    }
  }

  // get All  Note Full Data
  Future<List<NoteRequest>> getAllNote() async {
    List<NoteRequest> notes = [];
    List<Map<String, Object>> result = await database.query(notesTableName);
    for (var item in result) {
      Note note = Note.fromMap(item);
      Category category;
      (note.categoryId != null)
          ? category = await getSpecificCategory(note.categoryId)
          : null;
      List<ItemCheck> itemsCheck = await getSpecificItemsCheck(note.id);
      notes.add(
          NoteRequest(note: note, category: category, itemsCheck: itemsCheck));
    }
    return notes;
  }

// Get Specific Category
  Future<Category> getSpecificCategory(int categoryId) async {
    List<Map<String, Object>> result = await database.query(categoriesTableName,
        where: '$idCategoryColumn=?', whereArgs: [categoryId]);
    Category category = Category.fromMap(result.first);
    return category;
  }

  // Get Specific Items Check
  Future<List<ItemCheck>> getSpecificItemsCheck(int noteId) async {
    List<ItemCheck> itemsCheck = [];
    List<Map<String, Object>> result = await database.query(itemsCheckTableName,
        where: '$idNoteItemCheckColumn=?', whereArgs: [noteId]);
    result.map((item) {
      ItemCheck itemCheck = ItemCheck.fromMap(item);
      itemsCheck.add(itemCheck);
    }).toList();
    return itemsCheck;
  }

  // get All  Note To Category Full Data
  Future<List<NoteRequest>> getAllNoteToCategory(int categoryId) async {
    List<NoteRequest> notes = [];
    List<Map<String, Object>> result = await database.query(notesTableName,
        where: '$catIdNotesColumn=?', whereArgs: [categoryId]);
    for (var item in result) {
      Note note = Note.fromMap(item);
      Category category;
      (note.categoryId != null)
          ? category = await getSpecificCategory(note.categoryId)
          : null;
      List<ItemCheck> itemsCheck = await getSpecificItemsCheck(note.id);
      notes.add(
          NoteRequest(note: note, category: category, itemsCheck: itemsCheck));
    }
    return notes;
  }

}
