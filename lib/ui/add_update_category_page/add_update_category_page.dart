import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/data/note_data.dart';
import 'package:notes_app/helpers/database_helper.dart';
import 'package:notes_app/helpers/navigator_helper.dart';
import 'package:notes_app/models/category.dart';
import 'package:notes_app/ui/add_update_category_page/widgets/custom_list_text_field_cats_widget.dart';
import 'package:notes_app/data/theme_data.dart';
import 'package:notes_app/ui/shared/widgets/custom_button_bottom_app_bar_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddUpdateCategoryPage extends StatefulWidget {
  @override
  _AddUpdateCategoryPageState createState() => _AddUpdateCategoryPageState();
}

class _AddUpdateCategoryPageState extends State<AddUpdateCategoryPage> {
  TextEditingController _catController;

  toggleOnCategoriesPage() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _catController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _catController.dispose();
  }

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
                padding: EdgeInsets.only(left: 20.w, right: 10.w),
                child: TextField(
                  controller: _catController,
                  style: AppThemeData.theme.textSearchBoxHomePageTextStyle(),
                  decoration: InputDecoration(
                    hintText: 'Add new category',
                    hintStyle:
                        AppThemeData.theme.hintTextSearchBoxHomePageTextStyle(),
                    border: InputBorder.none,
                    suffixIcon: CustomButtonBottomAppBarWidget(
                      heroTag: 'addCatPage',
                      imagePath: 'assets/icons/add_icon.png',
                      size: 17,
                      onTap: () async {
                        if (_catController.text.trim().isNotEmpty) {
                          Category category =
                              Category(title: _catController.text.trim());
                          await DbHelper.dbHelper.insertCat(category);
                          _catController.clear();
                          setState(() {});
                        }
                      },
                    ),
                  ),
                ),
              ),
              CustomListTextFieldCatsWidget(toggleOnCategoriesPage),
            ],
          ),
        ),
      ),
    );
  }
}
