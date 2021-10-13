import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notes_app/data/theme_data.dart';
import 'package:notes_app/helpers/database_helper.dart';
import 'package:notes_app/helpers/file_helper.dart';
import 'package:notes_app/helpers/route_helper.dart';
import 'package:notes_app/helpers/share_helper.dart';
import 'package:notes_app/models/category.dart';
import 'package:notes_app/models/item_check.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/models/note_request.dart';
import 'package:notes_app/providers/home_provider.dart';
import 'package:notes_app/ui/add_update_note_page/add_update_note_page.dart';
import 'package:notes_app/ui/home_page/home_page.dart';
import 'package:notes_app/ui/painter_page/painter_page.dart';
import 'package:provider/provider.dart';

class NoteProvider extends ChangeNotifier {
  int colorHexCode = 0xFF171C26;
  String imagePath;
  Category category;
  List<ItemCheck> itemsCheck = [];
  TextEditingController titleController;
  TextEditingController desController;
  TextEditingController checkboxController = TextEditingController();
  bool isShowAddCheckBox = false;
  int numCharactersNote = 0;
  NoteRequest noteRequest;

  fillingControllerWhenEdit() {
    titleController = TextEditingController(text: noteRequest.note.title);
    desController = TextEditingController(text: noteRequest.note.description);
    imagePath = noteRequest.note.imagePath;
    category = noteRequest.category;
    colorHexCode = noteRequest.note.colorHexCode;
    itemsCheck = noteRequest.itemsCheck;
  }

  fillingControllerWhenAdd() {
    titleController = TextEditingController();
    desController = TextEditingController();
    imagePath = null;
    category = null;
    colorHexCode = AppThemeData.theme.colorHexCard;
    itemsCheck = [];
    numCharactersNote = 0;
    isShowAddCheckBox = false;
  }

  changeColorNote(int newColorHexCode) {
    colorHexCode = newColorHexCode;
    notifyListeners();
  }

  deleteNote(ActionOnPage action) async {
    if (action == ActionOnPage.EDIT) {
      await DbHelper.dbHelper.deleteNote(noteRequest.note.id);
      Provider.of<HomeProvider>(RouteHelper.routeHelper.navKey.currentContext,
              listen: false)
          .getAllNotes();
      RouteHelper.routeHelper.pop();
      RouteHelper.routeHelper.pop();
    } else {
      RouteHelper.routeHelper.pop();
      RouteHelper.routeHelper.pop();
    }
  }

  copyNote() {
    Note note = Note(
      title: titleController.text.trim(),
      description: desController.text.trim(),
    );
    ShareHelper.shareHelper.makeACopyContentNote(note);
    RouteHelper.routeHelper.pop();
  }

  changeImage(String imagePath) {
    this.imagePath = imagePath;
    notifyListeners();
  }

  shareNote() {
    Note note = Note(
      title: titleController.text.trim(),
      description: desController.text.trim(),
    );
    ShareHelper.shareHelper.shareContentNote(note);
    RouteHelper.routeHelper.pop();
  }

  setCategory() async {
    RouteHelper.routeHelper.pop();
    category = await RouteHelper.routeHelper.pushChooseCategory();
    notifyListeners();
  }

  setImageToNote(ImageSource imageSource) async {
    RouteHelper.routeHelper.pop();
    File file = await FileHelper.fileHelper.getImage(imageSource,
        titleController.text.trim() + Random().nextInt(10000).toString());
    imagePath = file.path;
    notifyListeners();
  }

  showAddCheckBox() {
    isShowAddCheckBox = true;
    RouteHelper.routeHelper.pop();
    notifyListeners();
  }

  addNote() async {
    if (titleController.text.trim().isNotEmpty) {
      Note note = Note(
          title: titleController.text.trim(),
          description: desController.text.trim(),
          imagePath: imagePath,
          categoryId: category?.id,
          colorHexCode: colorHexCode);
      await DbHelper.dbHelper.insertNote(note, itemsCheck);
      //
      Provider.of<HomeProvider>(RouteHelper.routeHelper.navKey.currentContext,
              listen: false)
          .getAllNotes();
      //
      RouteHelper.routeHelper.pop();
    }
  }

  updateNote() async {
    if (titleController.text.trim().isNotEmpty) {
      Note note = Note(
          title: titleController.text.trim(),
          description: desController.text.trim(),
          imagePath: imagePath,
          categoryId: category?.id,
          colorHexCode: colorHexCode);
      await DbHelper.dbHelper.updateNote(note, noteRequest.note.id, itemsCheck);
      //
      Provider.of<HomeProvider>(RouteHelper.routeHelper.navKey.currentContext,
              listen: false)
          .getAllNotes();
      //
      RouteHelper.routeHelper.pop();
    }
  }

  removeImageFromNote() {
    imagePath = null;
    notifyListeners();
  }

  setNumCharactersNote(String text) {
    numCharactersNote = text.length;
    notifyListeners();
  }

  removeItemCheckBox(ItemCheck itemCheck) {
    itemsCheck.remove(itemCheck);
    notifyListeners();
  }

  addCheckBoxToPage() {
    if (itemsCheck == null) itemsCheck = [];
    if (checkboxController.text.trim().isNotEmpty) {
      itemsCheck.add(
        ItemCheck(
          title: checkboxController.text.trim(),
          isDone: false,
        ),
      );
      checkboxController.clear();
      notifyListeners();
    }
  }

  changeValueItemCheck() {
    notifyListeners();
  }

  deleteCategoryFromNote() {
    category = null;
    notifyListeners();
  }

  addPainterToNote() {
    RouteHelper.routeHelper.pushNamed(PainterPage.routeNameFromNote);
  }
}
