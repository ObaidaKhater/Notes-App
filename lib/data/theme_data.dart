import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/data/note_data.dart';

class AppThemeData {
  AppThemeData._();

  static AppThemeData theme = AppThemeData._();
  int colorHexPrimary = 0xFFFFFFFF;
  int colorHexDescriptionDark = 0xFF828A9B;
  int colorHexDescriptionLight = 0xFFF2F3F4;
  int colorHexCard = 0xFF171C26;
  int colorHexBlue = 0xFF3269FF;
  int colorHexBackground = 0xFF0E121B;
  int colorHexPink = 0xFFAE3B76;
  int colorHexOrange = 0xFFFE7745;
  int colorHexTeal = 0xFF0BEAAF;
  int colorHoxBlack = 0xFF000000;

  TextStyle titleNotePageTextStyle() => TextStyle(
        color: Color(colorHexPrimary),
        fontSize: 26.sp,
        fontWeight: FontWeight.w600,
      );

  TextStyle descriptionNotePageTextStyle() => TextStyle(
        color: (NoteData.noteData.colorHexCode == colorHexCard)
            ? Color(colorHexDescriptionDark)
            : Color(colorHexDescriptionLight),
        fontSize: 18.sp,

      );

  TextStyle textCheckBocNotePageTextStyle(bool isDone) => TextStyle(
    color: (NoteData.noteData.colorHexCode == colorHexCard)
        ? Color(colorHexDescriptionDark)
        : Color(colorHexDescriptionLight),
    fontSize: 18.sp,
    decoration:(isDone)? TextDecoration.lineThrough:null,

  );

  TextStyle dateAndNumCharactersTextStyle() => TextStyle(
        color: (NoteData.noteData.colorHexCode == colorHexCard)
            ? Color(colorHexDescriptionDark)
            : Color(colorHexDescriptionLight),
        fontSize: 12.sp,
      );

  TextStyle titleItemButtonMenuTextStyle() => TextStyle(
        color: Color(colorHexPrimary),
        fontSize: 16.sp,
      );

  TextStyle titleHomePageTextStyle() => TextStyle(
        color: Color(colorHexPrimary),
        fontSize: 28.sp,
        fontWeight: FontWeight.w600,
      );

  TextStyle textSearchBoxHomePageTextStyle() => TextStyle(
        color: Color(colorHexPrimary),
        fontSize: 16.sp,
      );

  TextStyle hintTextSearchBoxHomePageTextStyle() => TextStyle(
        color: Color(colorHexDescriptionDark),
        fontSize: 15.sp,
      );

  TextStyle titleItemGridviewTextStyle() => TextStyle(
        color: Color(colorHexPrimary),
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
      );

  TextStyle descItemGridviewTextStyle(int colorHexCode) => TextStyle(
        color: (colorHexCode == colorHexCard)
            ? Color(colorHexDescriptionDark)
            : Color(colorHexDescriptionLight),
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
      );

  TextStyle titleCheckboxTextStyle(int colorHexCode, bool isDone) => TextStyle(
        color: (colorHexCode == colorHexCard)
            ? Color(colorHexDescriptionDark)
            : Color(colorHexDescriptionLight),
        fontSize: 15.sp,
        decoration: (isDone) ? TextDecoration.lineThrough : null,
        fontWeight: FontWeight.w400,
      );

  TextStyle titleCatHomePageTextStyle(int colorHexCode) => TextStyle(
        color: (colorHexCode == colorHexCard)
            ? Color(colorHexDescriptionDark)
            : Color(colorHexDescriptionLight),
        fontSize: 14.sp,
      );

  TextStyle descDrawerTextStyle() => TextStyle(
        color: Color(colorHexDescriptionDark),
        fontSize: 12.sp,
      );

  TextStyle titleCatDrawerTextStyle() => TextStyle(
        color: Color(colorHexPrimary),
        fontSize: 16.sp,
      );

  TextStyle titleCatPageTextStyle() => TextStyle(
        color: Color(colorHexPrimary),
        fontSize: 22.sp,
        fontWeight: FontWeight.w600,
      );

  TextStyle hintAddCheckBoxTextField() => TextStyle(
        color: (NoteData.noteData.colorHexCode == colorHexCard)
            ? Color(colorHexDescriptionDark)
            : Color(colorHexDescriptionLight),
        fontSize: 18.sp,
      );

  TextStyle titleCatNotePageTextStyle() => TextStyle(
    color: (NoteData.noteData.colorHexCode == colorHexCard)
        ? Color(colorHexDescriptionDark)
        : Color(colorHexDescriptionLight),
    fontSize: 14.sp,
  );
}
