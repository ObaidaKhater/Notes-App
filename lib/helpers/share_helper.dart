import 'package:flutter/services.dart';
import 'package:notes_app/models/note.dart';
import 'package:share/share.dart';

class ShareHelper {
  ShareHelper._();

  static ShareHelper shareHelper = ShareHelper._();

  shareContentNote(Note note) {
    Share.share(note.title + '\n\n' + note.description);
  }

  makeACopyContentNote(Note note){
    Clipboard.setData(new ClipboardData(text: note.title + '\n\n' + note.description));
  }
}
