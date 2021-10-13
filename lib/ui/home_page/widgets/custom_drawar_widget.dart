import 'package:flutter/material.dart';
import 'package:notes_app/data/note_data.dart';
import 'package:notes_app/helpers/database_helper.dart';
import 'package:notes_app/helpers/route_helper.dart';
import 'package:notes_app/models/category.dart';
import 'package:notes_app/ui/add_update_category_page/add_update_category_page.dart';
import 'package:notes_app/data/theme_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/providers/home_provider.dart';
import 'package:notes_app/ui/home_page/widgets/custom_item_drawer_widget.dart';
import 'package:provider/provider.dart';

class CustomDrawerWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, homeProvider, x) {
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
                      homeProvider.setCurrentCatIdNote(null);
                      RouteHelper.routeHelper.pop();
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
                                      .map((category) =>
                                      CustomItemDrawerWidget(
                                        title: category.title,
                                        pathIcon:
                                        'assets/icons/category_icon.png',
                                        onTap: () {
                                          homeProvider.setCurrentCatIdNote(category.id);
                                          RouteHelper.routeHelper.pop();
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
                      RouteHelper.routeHelper.pop();
                      RouteHelper.routeHelper.push(AddUpdateCategoryPage());
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
