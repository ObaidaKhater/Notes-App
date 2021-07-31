import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/ui/shared/theme_data.dart';
import 'package:notes_app/ui/home_page/widgets/custom_checkbox_home_page_widget.dart';

class CustomItemGridviewWidget extends StatelessWidget {
  Note note;

  CustomItemGridviewWidget({@required this.note});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      padding: EdgeInsets.only(bottom: 15.h),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: (this.note.colorHexCode != null)
                  ? Color(this.note.colorHexCode).withOpacity(0.3)
                  : Colors.transparent,
              blurRadius: 9,
              spreadRadius: 1,
              offset: Offset(0, 5))
        ],
        borderRadius: BorderRadius.circular(18.r),
        color: (this.note.colorHexCode != null)
            ? Color(this.note.colorHexCode)
            : Color(AppThemeData.theme.colorHexCard),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          (this.note.imagePath != null)
              ? Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.r),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: ExactAssetImage(note.imagePath),
                    ),
                  ),
                )
              : Container(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
            child: Text(
              this.note.title,
              style: AppThemeData.theme.titleItemGridviewTextStyle(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          (this.note.description != null && this.note.description.isNotEmpty)
              ? Container(
                  padding:
                      EdgeInsets.only(left: 15.w, right: 5.w, bottom: 10.h),
                  child: Text(
                    this.note.description,
                    maxLines: (this.note.itemsCheck != null) ? 3 : 25,
                    overflow: TextOverflow.ellipsis,
                    style: AppThemeData.theme
                        .descItemGridviewTextStyle(note.colorHexCode),
                  ),
                )
              : Container(),
          (this.note.itemsCheck != null)
              ? Container(
                  padding: EdgeInsets.only(bottom: 5.h, left: 15.w, right: 5.w),
                  child: Column(
                    children: note.itemsCheck.map((itemCheck) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.h),
                        child: CustomCheckBoxHomePageWidget(
                          isDone: itemCheck.isDone,
                          title: itemCheck.title,
                          colorHexCode: this.note.colorHexCode,
                        ),
                      );
                    }).toList(),
                  ))
              : Container(),
          (this.note.category != null)
              ? Visibility(
                  visible: (this.note.category != null),
                  child: Container(
                    margin: EdgeInsets.only(top: 10.h, left: 15.w, right: 15.w),
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                        color: (note.colorHexCode != null)
                            ? Color(AppThemeData.theme.colorHexDescriptionLight)
                            : Color(AppThemeData.theme.colorHexDescriptionDark),
                      ),
                    ),
                    child: Text(
                      this.note.category.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppThemeData.theme
                          .titleCatTextStyle(this.note.colorHexCode),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
