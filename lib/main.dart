import 'package:flutter/material.dart';
import 'package:notes_app/helpers/database_helper.dart';
import 'package:notes_app/helpers/route_helper.dart';
import 'package:notes_app/providers/category_provider.dart';
import 'package:notes_app/providers/home_provider.dart';
import 'package:notes_app/providers/note_provider.dart';
import 'package:notes_app/providers/painter_provider.dart';
import 'package:notes_app/ui/add_update_note_page/add_update_note_page.dart';
import 'package:notes_app/ui/home_page/home_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/ui/painter_page/painter_page.dart';
import 'package:notes_app/ui/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.dbHelper.initDatabase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 739),
      builder: () => MultiProvider(
        providers: [
          ChangeNotifierProvider<HomeProvider>(
              create: (context) => HomeProvider()),
          ChangeNotifierProvider<CategoryProvider>(
              create: (context) => CategoryProvider()),
          ChangeNotifierProvider<NoteProvider>(
              create: (context) => NoteProvider()),
          ChangeNotifierProvider<PainterProvider>(
              create: (context) => PainterProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
          navigatorKey: RouteHelper.routeHelper.navKey,
          routes: {
            AddUpdateNotePage.addRouteName: (context) =>
                AddUpdateNotePage(actionOnPage: ActionOnPage.ADD),
            AddUpdateNotePage.editRouteName: (context) =>
                AddUpdateNotePage(actionOnPage: ActionOnPage.EDIT),
            HomePage.routeName: (context) => HomePage(),
            PainterPage.routeNameFromHome: (context) => PainterPage(true),
            PainterPage.routeNameFromNote: (context) => PainterPage(false),
          },
          theme: ThemeData(
              primaryColor: Color(0xFFFFFFFF),
              accentColor: Colors.transparent,
              cardColor: Color(0xFFFFFFFF),
              buttonColor: Color(0xFF3269FF),
              canvasColor: Colors.transparent,
              bottomSheetTheme: BottomSheetThemeData(
                backgroundColor: Colors.transparent,
              )),
        ),
      ),
    );
  }
}
