import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/data/note_data.dart';
import 'package:notes_app/helpers/database_helper.dart';
import 'package:notes_app/helpers/route_helper.dart';
import 'package:notes_app/models/category.dart';
import 'package:notes_app/providers/category_provider.dart';
import 'package:notes_app/ui/add_update_category_page/widgets/custom_list_text_field_cats_widget.dart';
import 'package:notes_app/data/theme_data.dart';
import 'package:notes_app/ui/shared/widgets/custom_icon_button_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AddUpdateCategoryPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(builder: (context, catProvider, x) {
      return Scaffold(
        backgroundColor: Color(AppThemeData.theme.colorHexBackground),
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Update Categories',
            style: AppThemeData.theme.titleCatPageTextStyle(),
          ),
          backgroundColor: Color(AppThemeData.theme.colorHexBackground),
          leading: CustomIconButtonWidget(

            onTap: () => RouteHelper.routeHelper.pop(),
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
                    controller: catProvider.catController,
                    style: AppThemeData.theme.textSearchBoxHomePageTextStyle(),
                    decoration: InputDecoration(
                      hintText: 'Add new category',
                      hintStyle: AppThemeData.theme
                          .hintTextSearchBoxHomePageTextStyle(),
                      border: InputBorder.none,
                      suffixIcon: CustomIconButtonWidget(

                        imagePath: 'assets/icons/add_icon.png',
                        size: 17,
                        onTap: () => catProvider.addCategory(),
                      ),
                    ),
                  ),
                ),
                CustomListTextFieldCatsWidget(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
