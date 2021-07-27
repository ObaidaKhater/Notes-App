import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/data/note_data.dart';
import 'package:notes_app/models/category.dart';
import 'package:notes_app/models/item_check.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/ui/home_page/widgets/custom_item_gridview_widget.dart';

class CustomGridviewWidget extends StatelessWidget {
  bool isGridviewShow;

  CustomGridviewWidget({@required this.isGridviewShow});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 5.h),
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: NoteData.noteData.getAllNotes().length,
          itemBuilder: (BuildContext context, int index) =>
              CustomItemGridviewWidget(
            note: NoteData.noteData.getAllNotes()[index],
          ),
          staggeredTileBuilder: (int index) => StaggeredTile.count(
              (this.isGridviewShow) ? 4 : 2, index == 0 ? 3 : 4),
        ),
      ),
    );
  }
}
