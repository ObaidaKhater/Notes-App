import 'package:flutter/material.dart';
import 'package:notes_app/data/theme_data.dart';
import 'package:notes_app/providers/home_provider.dart';
import 'package:notes_app/providers/note_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DescriptionNoteWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteProvider>(builder: (context, provider, x) {
      return Container(
        margin: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 10.h),
        child: TextFormField(
          controller: provider.desController,
          keyboardType: TextInputType.multiline,
          onChanged: (value) => provider.setNumCharactersNote(value),
          maxLines: null,
          style: AppThemeData.theme.descriptionNotePageTextStyle(),
          decoration: InputDecoration(
            hintText: 'The Note ...',
            hintStyle: AppThemeData.theme.descriptionNotePageTextStyle(),
            border: InputBorder.none,
          ),
        ),
      );
    });
  }
}
