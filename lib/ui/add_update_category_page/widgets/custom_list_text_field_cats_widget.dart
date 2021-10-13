import 'package:flutter/material.dart';
import 'package:notes_app/data/theme_data.dart';
import 'package:notes_app/providers/category_provider.dart';
import 'package:notes_app/ui/shared/widgets/custom_icon_button_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CustomListTextFieldCatsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context, catProvider, x) {
        if (catProvider.categories != null)
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              children: catProvider.categories
                  .map(
                    (category) => TextField(
                      controller: TextEditingController(text: category.title),
                      style:
                          AppThemeData.theme.textSearchBoxHomePageTextStyle(),
                      decoration: InputDecoration(
                        prefixIcon: CustomIconButtonWidget(

                          onTap: null,
                          imagePath: 'assets/icons/category_icon.png',
                          size: 17,
                        ),
                        hintText: 'Add new category',
                        hintStyle: AppThemeData.theme
                            .hintTextSearchBoxHomePageTextStyle(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(AppThemeData.theme.colorHexBlue),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        filled: true,
                        focusColor: Colors.tealAccent,
                        hoverColor: Colors.redAccent,
                        suffixIcon: CustomIconButtonWidget(
                          imagePath: 'assets/icons/delete_icon.png',
                          size: 17,
                          onTap: () => catProvider.deleteCategory(category.id),
                        ),
                      ),
                      onSubmitted: (value) =>
                          catProvider.updateCategory(value, category),
                    ),
                  )
                  .toList(),
            ),
          );
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
