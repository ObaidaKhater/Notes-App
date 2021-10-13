import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/data/theme_data.dart';
import 'package:notes_app/providers/home_provider.dart';
import 'package:notes_app/ui/home_page/widgets/custom_button_widget.dart';
import 'package:provider/provider.dart';

class CustomSearchBoxWidget extends StatelessWidget {
  GlobalKey<ScaffoldState> scKey;

  CustomSearchBoxWidget(this.scKey);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, homeProvider, x) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 15.w),
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        height: 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
          color: Color(AppThemeData.theme.colorHexCard),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: CustomButtonWidget(
                icon: Icons.sort_rounded,
                onPressed: () => scKey.currentState.openDrawer(),
              ),
            ),
            Expanded(
              flex: 4,
              child: TextField(
                style: AppThemeData.theme.textSearchBoxHomePageTextStyle(),
                onChanged: (value) => homeProvider.setSearchToNoteValue(value),
                decoration: InputDecoration(
                    hintStyle:
                        AppThemeData.theme.hintTextSearchBoxHomePageTextStyle(),
                    hintText: 'Search your notes',
                    border: InputBorder.none),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  CustomButtonWidget(
                    onPressed: () => homeProvider.changeGridViewShowType(),
                    icon: (!homeProvider.isGridviewShow)
                        ? Icons.view_agenda_outlined
                        : Icons.grid_view_outlined,
                  ),
                  CircleAvatar(
                    radius: 18.r,
                    backgroundImage:
                        ExactAssetImage('assets/images/user_logo.png'),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
