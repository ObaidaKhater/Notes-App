import 'package:flutter/material.dart';
import 'package:notes_app/data/note_data.dart';
import 'package:notes_app/ui/add_update_category_page/add_update_category_page.dart';
import 'package:notes_app/ui/add_update_note_page/add_update_note_page.dart';
import 'package:notes_app/ui/home_page/home_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 739),
      builder: () => MaterialApp(
        home: AddUpdateNotePage(actionOnPage: ActionOnPage.ADD,note: NoteData.noteData.getAllNotes()[2],),
        theme: ThemeData(
          primaryColor: Color(0xFFFFFFFF),
          cardColor: Color(0xFFFFFFFF),
          buttonColor:Color(0xFF3269FF),
          canvasColor: Colors.transparent,
            bottomSheetTheme: BottomSheetThemeData(
                backgroundColor: Colors.transparent,
            )
        ),
      ),
    );
  }
}
