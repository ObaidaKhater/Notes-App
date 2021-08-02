import 'package:flutter/material.dart';
import 'package:notes_app/data/note_data.dart';
import 'package:notes_app/data/theme_data.dart';
import 'package:notes_app/helpers/database_helper.dart';
import 'package:notes_app/models/category.dart';
import 'package:notes_app/ui/shared/widgets/custom_button_bottom_app_bar_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListTextFieldCatsWidget extends StatelessWidget {
  Function toggleOnCategoriesPage;

  CustomListTextFieldCatsWidget(this.toggleOnCategoriesPage);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      child: FutureBuilder<List<Category>>(
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
                  return Column(
                    children: snapshot.data
                        .map(
                          (category) => TextField(
                            controller:
                                TextEditingController(text: category.title),
                            style: AppThemeData.theme
                                .textSearchBoxHomePageTextStyle(),
                            decoration: InputDecoration(
                              prefixIcon: CustomButtonBottomAppBarWidget(
                                heroTag: 'text' + category.title + 'catPage',
                                onTap: null,
                                imagePath: 'assets/icons/category_icon.png',
                                size: 17,
                              ),
                              hintText: 'Add new category',
                              hintStyle: AppThemeData.theme
                                  .hintTextSearchBoxHomePageTextStyle(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(AppThemeData.theme.colorHexBlue),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              filled: true,
                              focusColor: Colors.tealAccent,
                              hoverColor: Colors.redAccent,
                              suffixIcon: CustomButtonBottomAppBarWidget(
                                heroTag: 'delete' + category.title + 'catPage',
                                imagePath: 'assets/icons/delete_icon.png',
                                size: 17,
                                onTap: () async {
                                  await DbHelper.dbHelper.deleteCategory(category.id);
                                  toggleOnCategoriesPage();
                                },
                              ),
                            ),
                            onSubmitted: (value) async {
                              if (value.trim().length > 0) {
                                category.title = value;
                                await DbHelper.dbHelper
                                    .updateCategory(category);
                              }
                            },
                          ),
                        )
                        .toList(),
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
