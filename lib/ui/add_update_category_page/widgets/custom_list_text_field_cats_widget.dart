import 'package:flutter/material.dart';
import 'package:notes_app/data/note_data.dart';
import 'package:notes_app/ui/shared/theme_data.dart';
import 'package:notes_app/ui/shared/widgets/custom_button_bottom_app_bar_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListTextFieldCatsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        children: NoteData.noteData.categories
            .map(
              (category) => TextField(
                controller: TextEditingController(text: category.title),
                style: AppThemeData.theme.textSearchBoxHomePageTextStyle(),
                decoration: InputDecoration(
                    prefixIcon: CustomButtonBottomAppBarWidget(
                      onTap: null,
                      imagePath: 'assets/icons/category_icon.png',
                      size: 17,
                    ),
                    suffixIcon: CustomButtonBottomAppBarWidget(
                      onTap: () {},
                      imagePath: 'assets/icons/delete_icon.png',
                      size: 17,
                    ),
                    hintText: 'Add new category',
                    hintStyle:
                        AppThemeData.theme.hintTextSearchBoxHomePageTextStyle(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(AppThemeData.theme.colorHexBlue),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    filled: true,
                    focusColor: Colors.tealAccent,
                    hoverColor: Colors.redAccent),
              ),
            )
            .toList(),
      ),
    );
  }
}
