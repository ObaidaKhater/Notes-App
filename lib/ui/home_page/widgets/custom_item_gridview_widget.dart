import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/models/note.dart';

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
            : Theme.of(context).cardColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
            padding: EdgeInsets.only(
                top: 20.h, bottom: 10.h, left: 15.w, right: 15.w),
            child: Text(
              this.note.title,
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          (this.note.description != null &&
                  this.note.description.isNotEmpty &&
                  this.note.itemsCheck == null)
              ? Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 15.w, right: 5.w),
                    child: Text(
                      this.note.description,
                      style: TextStyle(
                          color: (note.colorHexCode!=null)?Color(0xFFC1D3FF):Color(0xFF828A9B),
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,textBaseline: TextBaseline.ideographic),
                    ),
                  ),
                )
              : Container(),
          (this.note.itemsCheck != null)
              ? Expanded(
                child: Container(
                    padding: EdgeInsets.only(
                        bottom: 5.h, left: 15.w, right: 5.w),
                    child: ListView(
                      physics: NeverScrollableScrollPhysics(),
                      children: note.itemsCheck.map((itemCheck) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.h),
                          child: Row(
                            children: [
                              SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Checkbox(
                                      side: BorderSide(
                                          width: 1,
                                          color: (note.colorHexCode!=null)?Color(0xFFC1D3FF):Color(0xFF828A9B)),
                                      checkColor: (note.colorHexCode !=
                                              null)
                                          ? Colors.black
                                          : Theme.of(context).primaryColor,
                                      fillColor: (note.colorHexCode != null)
                                          ? MaterialStateProperty.all<
                                              Color>(Colors.white)
                                          : MaterialStateProperty
                                              .all<Color>(Theme.of(context)
                                                  .buttonColor),
                                      value: itemCheck.isDone,
                                      shape: CircleBorder(),
                                      onChanged: null)),
                              SizedBox(
                                width: 8.w,
                              ),
                              Expanded(
                                  child: Text(
                                itemCheck.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,
                                  color: (note.colorHexCode!=null)?Color(0xFFC1D3FF):Color(0xFF828A9B),
                                  decoration: (itemCheck.isDone)
                                      ? TextDecoration.lineThrough
                                      : null,
                                ),
                              )),
                            ],
                          ),
                        );
                      }).toList(),
                    )
                    ),
              )
              : Container(),
          (this.note.category != null)
              ? Visibility(
                  visible: (this.note.category != null),
                  child: Container(
                    margin:
                        EdgeInsets.only(top: 10.h ,left: 15.w,right: 15.w),
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: (note.colorHexCode!=null)?Color(0xFFC1D3FF):Color(0xFF828A9B))),
                    child: Text(
                      this.note.category.title,
                      style:
                          TextStyle(color: (note.colorHexCode!=null)?Color(0xFFC1D3FF):Color(0xFF828A9B), fontSize: 14.sp),
                    ),
                  ))
              : Container(),
        ],
      ),
    );
  }
}
