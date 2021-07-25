import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/ui/home_page/widgets/custom_app_bar_widget.dart';
import 'package:notes_app/ui/home_page/widgets/custom_bottom_app_bar_widget.dart';
import 'package:notes_app/ui/home_page/widgets/custom_floating_action_button_widget.dart';
import 'package:notes_app/ui/home_page/widgets/custom_search_box_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isGridviewShow = true;

  toggleShowGridview(bool isGridviewShow) {
    _isGridviewShow = !isGridviewShow;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFloatingActionButtonWidget(onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      backgroundColor: Theme.of(context).backgroundColor,
      bottomNavigationBar:CustomBottomAppBarWidget(),
      key: _scaffoldKey,
      drawer: Drawer(
        elevation: 20,
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
            Center(
              child: Container(
                color: (_isGridviewShow) ? Colors.red : Colors.white,
                width: 10,
                height: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
