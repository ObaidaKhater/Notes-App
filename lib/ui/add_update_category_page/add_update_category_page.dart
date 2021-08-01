import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/data/note_data.dart';
import 'package:notes_app/helpers/navigator_helper.dart';
import 'package:notes_app/ui/add_update_category_page/widgets/custom_list_text_field_cats_widget.dart';
import 'package:notes_app/data/theme_data.dart';
import 'package:notes_app/ui/shared/widgets/custom_button_bottom_app_bar_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddUpdateCategoryPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(NoteData.noteData.colorHexCode),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Update Categories',
          style: AppThemeData.theme.titleCatPageTextStyle(),
        ),
        backgroundColor: Color(NoteData.noteData.colorHexCode),
        leading: CustomButtonBottomAppBarWidget(
          heroTag: 'backCatPage',
          onTap: () => NavigatorHelper.navigatorHelper.pop(),
          imagePath: 'assets/icons/left_icon.png',
          size: 20,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20.w,right: 10.w),
              child: TextField(
                  style: AppThemeData.theme.textSearchBoxHomePageTextStyle(),
                  decoration: InputDecoration(
                      suffixIcon: CustomButtonBottomAppBarWidget(
                        heroTag: 'addCatPage',
                        onTap: null,
                        imagePath: 'assets/icons/add_icon.png',
                        size:17,
                      ),
                      hintText: 'Add new category',
                      hintStyle:
                          AppThemeData.theme.hintTextSearchBoxHomePageTextStyle(),
                      border: InputBorder.none),
                ),
              ),
              CustomListTextFieldCatsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
