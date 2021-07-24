import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/ui/home_page/widgets/custom_button_widget.dart';

class CustomSearchBoxWidget extends StatelessWidget {
  GlobalKey<ScaffoldState> scaffoldKey;
  Function toggleFunction;
  bool isGridViewShow;

  CustomSearchBoxWidget(
      {@required this.scaffoldKey,
      @required this.toggleFunction,
      @required this.isGridViewShow});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
        color: Theme.of(context).cardColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomButtonWidget(
            icon: Icons.sort_rounded,
            onPressed: () {
              this.scaffoldKey.currentState.openDrawer();
            },
          ),
          Expanded(
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  hintStyle:
                      TextStyle(fontSize: 15.sp, color: Color(0xFF5A6372)),
                  hintText: 'Search your notes',
                  border: InputBorder.none),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButtonWidget(
                onPressed: () {
                  this.toggleFunction(this.isGridViewShow);
                },
                icon: (!this.isGridViewShow)
                    ? Icons.view_agenda_outlined
                    : Icons.grid_view_outlined,
              ),
              CircleAvatar(
                radius: 18.r,
                backgroundImage: ExactAssetImage('assets/images/user_logo.png'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
