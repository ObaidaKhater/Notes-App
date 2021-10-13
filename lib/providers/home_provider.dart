import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notes_app/helpers/database_helper.dart';
import 'package:notes_app/helpers/file_helper.dart';
import 'package:notes_app/helpers/route_helper.dart';
import 'package:notes_app/models/note_request.dart';
import 'package:notes_app/providers/note_provider.dart';
import 'package:notes_app/ui/add_update_note_page/add_update_note_page.dart';
import 'package:notes_app/ui/home_page/home_page.dart';
import 'package:notes_app/ui/painter_page/painter_page.dart';
import 'package:provider/provider.dart';

class HomeProvider extends ChangeNotifier {
  List<NoteRequest> notes;
  int currentCategoryId;
  bool isGridviewShow = false;
  String searchNoteValue = '';

  HomeProvider() {
    getAllNotes();
  }

  changeGridViewShowType() {
    isGridviewShow = !isGridviewShow;
    notifyListeners();
  }

  setCurrentCatIdNote(int currentCategoryId) {
    this.currentCategoryId = currentCategoryId;
    getAllNotes();
  }

  getAllNotes() async {
    if (currentCategoryId != null)
      notes = await DbHelper.dbHelper.getAllNoteToCategory(currentCategoryId);
    else {
      notes = await DbHelper.dbHelper.getAllNote();
    }
    if (searchNoteValue.length > 0) {
      notes.removeWhere((element) => element.note.title != searchNoteValue);
    }
    notifyListeners();
  }

  addNewNoteWithImage(ImageSource imageSource) async {
    File file = await FileHelper.fileHelper
        .getImage(imageSource, Random().nextInt(10000).toString());
    //
    Provider.of<NoteProvider>(RouteHelper.routeHelper.navKey.currentContext,
            listen: false)
        .fillingControllerWhenAdd();
    //
    Provider.of<NoteProvider>(RouteHelper.routeHelper.navKey.currentContext,
            listen: false)
        .imagePath = file.path;
    //
    RouteHelper.routeHelper.pushNamed(AddUpdateNotePage.addRouteName);
  }

  addNewNoteWithCheckBox() async {
    Provider.of<NoteProvider>(RouteHelper.routeHelper.navKey.currentContext,
            listen: false)
        .fillingControllerWhenAdd();
    //
    Provider.of<NoteProvider>(RouteHelper.routeHelper.navKey.currentContext,
            listen: false)
        .isShowAddCheckBox = true;
    //
    RouteHelper.routeHelper.pushNamed(AddUpdateNotePage.addRouteName);
  }

  addNewNote() {
    Provider.of<NoteProvider>(RouteHelper.routeHelper.navKey.currentContext,
            listen: false)
        .fillingControllerWhenAdd();
    RouteHelper.routeHelper.pushNamed(AddUpdateNotePage.addRouteName);
  }

  editNote(NoteRequest noteRequest) async {
    Provider.of<NoteProvider>(RouteHelper.routeHelper.navKey.currentContext,
            listen: false)
        .noteRequest = noteRequest;
//
    Provider.of<NoteProvider>(RouteHelper.routeHelper.navKey.currentContext,
            listen: false)
        .fillingControllerWhenEdit();
    //
    RouteHelper.routeHelper.pushNamed(AddUpdateNotePage.editRouteName);
  }

  setSearchToNoteValue(String titleValue) {
    this.searchNoteValue = titleValue.trim();
    getAllNotes();
  }

  addNewNoteWithPainter() {
    RouteHelper.routeHelper.pushNamed(PainterPage.routeNameFromHome);
  }

  goToHomePage() {
    RouteHelper.routeHelper.pushReplacementNamed(HomePage.routeName);
  }
}
