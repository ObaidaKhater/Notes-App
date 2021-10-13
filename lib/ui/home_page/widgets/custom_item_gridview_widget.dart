import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/data/theme_data.dart';
import 'package:notes_app/providers/home_provider.dart';
import 'package:notes_app/models/note_request.dart';
import 'package:notes_app/ui/home_page/widgets/custom_checkbox_home_page_widget.dart';
import 'package:provider/provider.dart';

class CustomItemGridviewWidget extends StatelessWidget {
  NoteRequest noteRequest;

  CustomItemGridviewWidget({@required this.noteRequest});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Provider.of<HomeProvider>(context, listen: false)
          .editNote(noteRequest),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        padding: EdgeInsets.only(bottom: 15.h),
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: (this.noteRequest.note.colorHexCode !=
                        AppThemeData.theme.colorHexCard)
                    ? Color(this.noteRequest.note.colorHexCode).withOpacity(0.3)
                    : Colors.transparent,
                blurRadius: 9,
                spreadRadius: 1,
                offset: Offset(0, 5))
          ],
          borderRadius: BorderRadius.circular(18.r),
          color: (this.noteRequest.note.colorHexCode !=
                  AppThemeData.theme.colorHexCard)
              ? Color(this.noteRequest.note.colorHexCode)
              : Color(AppThemeData.theme.colorHexCard),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Draw Image -----------------------------------------------------
            (this.noteRequest.note.imagePath != null)
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.r),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: FileImage(File(this.noteRequest.note.imagePath)),
                      ),
                    ),
                  )
                : Container(),
            // Draw Title -----------------------------------------------------
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
              child: Text(
                this.noteRequest.note.title,
                style: AppThemeData.theme.titleItemGridviewTextStyle(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            // Draw Description -----------------------------------------------------
            (this.noteRequest.note.description != null &&
                    this.noteRequest.note.description.isNotEmpty)
                ? Container(
                    padding:
                        EdgeInsets.only(left: 15.w, right: 5.w, bottom: 10.h),
                    child: Text(
                      this.noteRequest.note.description,
                      maxLines:
                          (this.noteRequest.itemsCheck.length != 0) ? 3 : 25,
                      overflow: TextOverflow.ellipsis,
                      style: AppThemeData.theme.descItemGridviewTextStyle(
                          this.noteRequest.note.colorHexCode),
                    ),
                  )
                : Container(),

            // Draw Items Check -----------------------------------------------
            (this.noteRequest.itemsCheck.length != 0)
                ? Container(
                    padding:
                        EdgeInsets.only(bottom: 5.h, left: 15.w, right: 5.w),
                    child: Column(
                      children: this.noteRequest.itemsCheck.map((itemCheck) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.h),
                          child: CustomCheckBoxHomePageWidget(
                            isDone: itemCheck.isDone,
                            title: itemCheck.title,
                            colorHexCode: this.noteRequest.note.colorHexCode,
                          ),
                        );
                      }).toList(),
                    ))
                : Container(),

            // Draw Category -----------------------------------------------------
            (this.noteRequest.category != null)
                ? Container(
                    margin: EdgeInsets.only(top: 10.h, left: 15.w, right: 15.w),
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                        color: (this.noteRequest.note.colorHexCode !=
                                AppThemeData.theme.colorHexCard)
                            ? Color(AppThemeData.theme.colorHexDescriptionLight)
                            : Color(AppThemeData.theme.colorHexDescriptionDark),
                      ),
                    ),
                    child: Text(
                      this.noteRequest.category.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppThemeData.theme.titleCatHomePageTextStyle(
                          this.noteRequest.note.colorHexCode),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
