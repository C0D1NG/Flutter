import 'package:flutter/material.dart';
import 'package:nano_news/features/discover/cutsom_widgtes/category_card_widget.dart';
import 'package:nano_news/view_model/catergory_view_model.dart';

class CategoryListWidget extends StatelessWidget {
  final Function animatePageView;
  CategoryListWidget({this.animatePageView});
  final CategoryViewModel _categoryViewModel = CategoryViewModel();
  @override
  Widget build(BuildContext context) {
    return GridView(
        primary: false,
        shrinkWrap: true,
        padding:
            EdgeInsets.only(top: 20.0, bottom: 20.0, left: 15.0, right: 15.0),
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 19.0,
            crossAxisSpacing: 15.0,
            childAspectRatio: 0.8,
            crossAxisCount: 2),
        children: List.generate(
          _categoryViewModel.getAllCategoriesCount(),
          (_index) {
            return CategoryCardWidget(
              categoryViewModel: _categoryViewModel,
              index: _index,
              animatePageView: animatePageView,
            );
          },
        ));
  }
}
