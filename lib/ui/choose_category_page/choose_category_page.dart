import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/helpers/database_helper.dart';
import 'package:notes_app/helpers/route_helper.dart';
import 'package:notes_app/models/category.dart';
import 'package:notes_app/data/theme_data.dart';
import 'package:notes_app/ui/shared/widgets/custom_icon_button_widget.dart';
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
        leading: CustomIconButtonWidget(
          onTap: () => RouteHelper.routeHelper.pop(),
          imagePath: 'assets/icons/left_icon.png',
          size: 20,
        ),
      ),
      body: FutureBuilder<List<Category>>(
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
                    margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
                    child: SingleChildScrollView(
                      child: Column(
                        children: snapshot.data
                            .map((category) => ListTile(
                                  onTap: () => RouteHelper.routeHelper
                                      .pop(values: category),
                                  title: Padding(
                                    padding: EdgeInsets.only(left: 10.w),
                                    child: Text(
                                      category.title,
                                      style: AppThemeData.theme
                                          .textSearchBoxHomePageTextStyle(),
                                    ),
                                  ),
                                  trailing: CustomIconButtonWidget(
                                    onTap: null,
                                    imagePath: 'assets/icons/category_icon.png',
                                    size: 17,
                                  ),
                                ))
                            .toList(),
                      ),
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
    );
  }
}
