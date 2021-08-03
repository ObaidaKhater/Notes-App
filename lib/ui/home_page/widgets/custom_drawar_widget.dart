import 'package:flutter/material.dart';
import 'package:notes_app/data/note_data.dart';
import 'package:notes_app/helpers/database_helper.dart';
import 'package:notes_app/helpers/navigator_helper.dart';
import 'package:notes_app/models/category.dart';
import 'package:notes_app/ui/add_update_category_page/add_update_category_page.dart';
import 'package:notes_app/ui/home_page/widgets/custom_item_drawer_widget.dart';
import 'package:notes_app/data/theme_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/ui/shared/widgets/custom_button_bottom_app_bar_widget.dart';

class CustomDrawerWidget extends StatelessWidget {

  Function toggleOnHomePage;

  CustomDrawerWidget(
      {@required this.toggleOnHomePage});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding:
            EdgeInsets.only(left: 25.w, right: 10.w, top: 20.h, bottom: 20.h),
        color: Color(AppThemeData.theme.colorHexCard),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Notes App",
                  style: AppThemeData.theme.titleHomePageTextStyle(),
                ),
                SizedBox(height: 20.h),
                CustomItemDrawerWidget(
                  title: 'All Notes',
                  pathIcon:
                  'assets/icons/notes_icon.png',
                  onTap: () {
                    NoteData.noteData.currentCategoryId = null;
                    NavigatorHelper.navigatorHelper.pop();
                    toggleOnHomePage();
                  },
                ),
                SizedBox(height: 30.h),
                Text(
                  'Categories',
                  style: AppThemeData.theme.descDrawerTextStyle(),
                ),
                SizedBox(height: 5.h),
                FutureBuilder<List<Category>>(
                    future: DbHelper.dbHelper.getAllCategories(),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.waiting:
                          return CircularProgressIndicator();
                          break;
                        case ConnectionState.done:
                        case ConnectionState.active:
                          if (!snapshot.hasError) {
                            return Container(
                              child: Column(
                                children: snapshot.data
                                    .map((category) => CustomItemDrawerWidget(
                                          title: category.title,
                                          pathIcon:
                                              'assets/icons/category_icon.png',
                                          onTap: () {
                                            NoteData.noteData.currentCategoryId = category.id;
                                            NavigatorHelper.navigatorHelper.pop();
                                            toggleOnHomePage();
                                          },
                                        ))
                                    .toList(),
                              ),
                            );
                          } else {
                            return CircularProgressIndicator();
                          }
                          break;
                        default:
                          return CircularProgressIndicator();
                      }
                    }),
                CustomItemDrawerWidget(
                  title: 'Add new category',
                  pathIcon: 'assets/icons/add_icon.png',
                  onTap: () {
                    NavigatorHelper.navigatorHelper.pop();
                    NavigatorHelper.navigatorHelper.push(
                      AddUpdateCategoryPage(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
