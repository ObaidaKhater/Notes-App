import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/data/note_data.dart';
import 'package:notes_app/ui/add_update_category_page/widgets/custom_list_text_field_cats_widget.dart';
import 'package:notes_app/ui/shared/theme_data.dart';
import 'package:notes_app/ui/shared/widgets/custom_button_bottom_app_bar_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseCategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(AppThemeData.theme.colorHexBackground),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Choose Category',
          style: AppThemeData.theme.titleCatPageTextStyle(),
        ),
        backgroundColor: Color(AppThemeData.theme.colorHexBackground),
        leading: CustomButtonBottomAppBarWidget(
          onPressed: () {},
          imagePath: 'assets/icons/left_icon.png',
          size: 20,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
          child: Column(
            children: NoteData.noteData.categories
                .map((category) => ListTile(
                          onTap: () => Navigator.pop(context, category),
                          title: Padding(
                            padding: EdgeInsets.only(left: 10.w),
                            child: Text(
                              category.title,
                              style: AppThemeData.theme
                                  .textSearchBoxHomePageTextStyle(),
                            ),
                          ),
                          trailing: CustomButtonBottomAppBarWidget(
                            onPressed: null,
                            imagePath: 'assets/icons/category_icon.png',
                            size: 17,
                          ),
                        )
                    )
                .toList(),
          ),
        ),
      ),
    );
  }
}
