import 'package:flutter/material.dart';
import 'package:notes_app/helpers/database_helper.dart';
import 'package:notes_app/models/category.dart';

class CategoryProvider extends ChangeNotifier {
  List<Category> categories;
  TextEditingController catController = TextEditingController();

  CategoryProvider() {
    getAllCategories();
  }

  addCategory() async {
    if (catController.text.trim().isNotEmpty) {
      Category category = Category(title: catController.text.trim());
      await DbHelper.dbHelper.insertCat(category);
      catController.clear();
      getAllCategories();
    }
  }

  getAllCategories() async {
    categories = await DbHelper.dbHelper.getAllCategories();
    notifyListeners();
  }

  deleteCategory(int categoryId) async {
    await DbHelper.dbHelper.deleteCategory(categoryId);
    getAllCategories();
  }

  updateCategory(String newTitle, Category oldCategory) async {
    if (newTitle.trim().length > 0) {
      oldCategory.title = newTitle;
      await DbHelper.dbHelper.updateCategory(oldCategory);
      getAllCategories();
    }
  }
}
