import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/providers/home_provider.dart';
import 'package:notes_app/ui/home_page/widgets/custom_item_gridview_widget.dart';
import 'package:notes_app/ui/shared/widgets/custom_hint_widget.dart';
import 'package:notes_app/ui/shared/widgets/custom_loading_widget.dart';

import 'package:provider/provider.dart';

class CustomGridviewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, x) {
        if (homeProvider.notes != null) {
          // When no Notes
          if (homeProvider.notes.length == 0)
            return CustomHintWidget(
              icon: Icons.hdr_strong_sharp,
              hintText: 'The notes you add are shown here.',
            );
          return Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 5.h),
              child: StaggeredGridView.countBuilder(
                  crossAxisCount: 4,
                  itemCount: homeProvider.notes.length,
                  itemBuilder: (BuildContext context, int index) =>
                      CustomItemGridviewWidget(
                        noteRequest: homeProvider.notes[index],
                      ),
                  staggeredTileBuilder: (int index) =>
                      StaggeredTile.fit((homeProvider.isGridviewShow) ? 4 : 2)),
            ),
          );
        }
        return CustomLoadingWidget();
      },
    );
  }
}
