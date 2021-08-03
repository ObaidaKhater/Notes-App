import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/data/note_data.dart';
import 'package:notes_app/models/category.dart';
import 'package:notes_app/models/item_check.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/ui/add_update_category_page/add_update_category_page.dart';
import 'package:notes_app/ui/add_update_note_page/add_update_note_page.dart';
import 'package:notes_app/ui/choose_category_page/choose_category_page.dart';

class NavigatorHelper {
  NavigatorHelper._();

  static NavigatorHelper navigatorHelper = NavigatorHelper._();
  GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  push(Widget widget) {
    navKey.currentState.push(
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  pop({var values}) {
    navKey.currentState.pop(values);
  }

  pushChooseCategory() async {
    pop();
    Category category =
        await navKey.currentState.push(MaterialPageRoute(builder: (context) {
      return ChooseCategoryPage();
    }));
    NoteData.noteData.category = category;
  }

  pushReplacement(Widget widget) {
    navKey.currentState.pushReplacement(
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  pushAddNotePage(Function toggle) async {
    await navKey.currentState.push(MaterialPageRoute(builder: (context) {
      return AddUpdateNotePage(actionOnPage: ActionOnPage.ADD);
    }));
    toggle();
  }

  pushUpdateNotePage(Function toggle, Note note, Category category,
      List<ItemCheck> itemsCheck) async {
    await navKey.currentState.push(MaterialPageRoute(builder: (context) {
      return    AddUpdateNotePage(
        actionOnPage: ActionOnPage.EDIT,
        note: note,
        noteCategory: category,
        noteItemsCheck: itemsCheck,
      );
    }));
    toggle();
  }


  pushAddNoteWithCheckBoxOnNotePage(Function toggle) async {
    await navKey.currentState.push(MaterialPageRoute(builder: (context) {
      return    AddUpdateNotePage(
        actionOnPage: ActionOnPage.ADD,
        isShowAddCheckBoxIcon: true,
      );
    }));
    toggle();
  }

  pushAddNoteWithImageOnNotePage(Function toggle,String imagePath) async {
    await navKey.currentState.push(MaterialPageRoute(builder: (context) {
      return    AddUpdateNotePage(
        actionOnPage: ActionOnPage.ADD,
        isShowAddCheckBoxIcon: false,
        imagePath: imagePath,
      );
    }));
    toggle();
  }
}
