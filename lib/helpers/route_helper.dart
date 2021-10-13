import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/models/category.dart';
import 'package:notes_app/ui/choose_category_page/choose_category_page.dart';

class RouteHelper {
  RouteHelper._();

  static RouteHelper routeHelper = RouteHelper._();
    GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  push(Widget widget) {
    navKey.currentState.push(
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  pop({var values}) {
    navKey.currentState.pop(values);
  }

  pushNamed(String routeName) {
    navKey.currentState.pushNamed(routeName);
  }

  pushReplacementNamed(String routeName) {
    navKey.currentState.pushReplacementNamed(routeName);
  }
  //
  Future<Category> pushChooseCategory() async {
    Category category = await navKey.currentState.push(MaterialPageRoute(builder: (context) {
      return ChooseCategoryPage();
    }));
    return category;
  }


}
