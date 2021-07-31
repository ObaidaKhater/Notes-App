import 'package:flutter/material.dart';
import 'package:notes_app/data/note_data.dart';
import 'package:notes_app/ui/home_page/widgets/custom_item_drawer_widget.dart';
import 'package:notes_app/ui/shared/theme_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/ui/shared/widgets/custom_button_bottom_app_bar_widget.dart';

class CustomDrawerWidget extends StatelessWidget {
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
                SizedBox(height: 30.h),
                Text(
                  'Categories',
                  style: AppThemeData.theme.descDrawerTextStyle(),
                ),
                SizedBox(height: 5.h),
                Container(
                  child: Column(
                    children: NoteData.noteData
                        .getAllCategories()
                        .map((category) => CustomItemDrawerWidget(
                              title: category.title,
                              pathIcon: 'assets/icons/category_icon.png',
                              onTap: () {},
                            ))
                        .toList(),
                  ),
                ),
                CustomItemDrawerWidget(
                  title: 'Add new category',
                    onTap: () {},pathIcon: 'assets/icons/add_icon.png',),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
