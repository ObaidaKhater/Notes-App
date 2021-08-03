import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/data/note_data.dart';
import 'package:notes_app/ui/home_page/widgets/custom_app_bar_widget.dart';
import 'package:notes_app/ui/home_page/widgets/custom_bottom_app_bar_widget.dart';
import 'package:notes_app/ui/home_page/widgets/custom_drawar_widget.dart';
import 'package:notes_app/ui/home_page/widgets/custom_floating_action_button_widget.dart';
import 'package:notes_app/ui/home_page/widgets/custom_gridview_widget.dart';
import 'package:notes_app/ui/home_page/widgets/custom_search_box_widget.dart';
import 'package:notes_app/data/theme_data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isGridviewShow = false;


  toggleShowGridview(bool isGridviewShow) {
    _isGridviewShow = !isGridviewShow;
    setState(() {});
  }

  toggleOnHomePage() {
    setState(() {});
  }

@override
  void initState() {
    super.initState();
    NoteData.noteData.currentCategoryId = null;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFloatingActionButtonWidget(toggleOnHomePage),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      backgroundColor: Color(AppThemeData.theme.colorHexBackground),
      bottomNavigationBar:
          CustomBottomAppBarWidget(toggleOnHomePage: toggleOnHomePage),
      key: _scaffoldKey,
      drawer: CustomDrawerWidget(
        toggleOnHomePage: toggleOnHomePage,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBarWidget(),
            CustomSearchBoxWidget(
              scaffoldKey: _scaffoldKey,
              toggleFunction: toggleShowGridview,
              isGridViewShow: _isGridviewShow,
            ),
            CustomGridviewWidget(
                isGridviewShow: _isGridviewShow,
                toggleOnHomePage: toggleOnHomePage,
            )
          ],
        ),
      ),
    );
  }
}
