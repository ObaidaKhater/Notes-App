import 'dart:io';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/helpers/route_helper.dart';
import 'package:notes_app/providers/note_provider.dart';
import 'package:notes_app/ui/add_update_note_page/add_update_note_page.dart';
import 'package:painter/painter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class PainterProvider extends ChangeNotifier {
  PainterController painterController;

  setPainterController() {
    painterController = PainterController();
    painterController.thickness = 5.0;
    painterController.backgroundColor = Colors.white;
    painterController.drawColor = Colors.blue;
  }

  setThickness(double thicknessValue) {
    painterController.thickness = thicknessValue;
    notifyListeners();
  }

  setNewColor(bool background, Color newColor) {
    if (background)
      painterController.backgroundColor = newColor;
    else
      painterController.drawColor = newColor;
    notifyListeners();
  }

  setPainterImageToNote(bool fromHomePage) async {
    // Change File From Unit8List To File And Get Path
    PictureDetails picture = painterController.finish();
    final imgPng = await picture.toPNG();
    final tempDir = await getTemporaryDirectory();
    final file = await File('${tempDir.path}/${Random().nextInt(1000)}.jpg').create();
    file.writeAsBytesSync(imgPng);
    //
    if (fromHomePage) {
      Provider.of<NoteProvider>(RouteHelper.routeHelper.navKey.currentContext,
              listen: false)
          .fillingControllerWhenAdd();
    }
    //
    Provider.of<NoteProvider>(RouteHelper.routeHelper.navKey.currentContext,
            listen: false)
        .changeImage(file.path);
    // Close Painter Page
    RouteHelper.routeHelper.pop();
    // Go To Add Note Page
    if (fromHomePage) {
      RouteHelper.routeHelper.pushNamed(AddUpdateNotePage.addRouteName);
    }
    // Close add more menu
    if(!fromHomePage){
      RouteHelper.routeHelper.pop();
    }
  }
}
