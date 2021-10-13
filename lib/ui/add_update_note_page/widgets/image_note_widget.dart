import 'dart:io';

import 'package:flutter/material.dart';
import 'package:notes_app/providers/home_provider.dart';
import 'package:notes_app/providers/note_provider.dart';
import 'package:notes_app/ui/shared/widgets/custom_icon_button_widget.dart';
import 'package:provider/provider.dart';

class ImageNoteWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<NoteProvider>(builder: (context, provider, x) {
      return Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Image.file(
              File(provider.imagePath),
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: CustomIconButtonWidget(
              size: 20,
              imagePath: 'assets/icons/close_icon.png',
              onTap: () => provider.removeImageFromNote(),
            ),
          ),
        ],
      );
    });
  }
}
