import 'package:flutter/material.dart';
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
        home: AddUpdateNotePage(),
        theme: ThemeData(
          backgroundColor: Color(0xFF0E121B),
          primaryColor: Color(0xFFFFFFFF),
          cardColor: Color(0xFF171C26),
          buttonColor:Color(0xFF3269FF),
          canvasColor: Colors.transparent,
        ),
      ),
    );
  }
}
