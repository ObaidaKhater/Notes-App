import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/data/note_data.dart';
import 'package:notes_app/helpers/database_helper.dart';
import 'package:notes_app/models/category.dart';
import 'package:notes_app/models/item_check.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/ui/home_page/widgets/custom_item_gridview_widget.dart';

class CustomGridviewWidget extends StatelessWidget {
  bool isGridviewShow;
  Function toggleOnHomePage;


  CustomGridviewWidget({
    @required this.isGridviewShow,
    @required this.toggleOnHomePage,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
        future: (NoteData.noteData.currentCategoryId == null)
            ? DbHelper.dbHelper.getAllNote()
            : DbHelper.dbHelper.getAllNoteToCategory(NoteData.noteData.currentCategoryId),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
              break;
            case ConnectionState.done:
            case ConnectionState.active:
              if (!snapshot.hasError) {
                return Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 5.h),
                    child: StaggeredGridView.countBuilder(
                        crossAxisCount: 4,
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) =>
                            CustomItemGridviewWidget(
                              noteFullData: snapshot.data[index],
                              toggleOnHomePage: this.toggleOnHomePage,
                            ),
                        staggeredTileBuilder: (int index) =>
                            StaggeredTile.fit((this.isGridviewShow) ? 4 : 2)),
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
              break;
            default:
              return Center(child: CircularProgressIndicator());
          }
        });
  }
}
