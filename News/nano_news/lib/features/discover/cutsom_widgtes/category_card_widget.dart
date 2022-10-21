import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nano_news/features/feeds/feeds_page_widget.dart';
import 'package:nano_news/home_page_widget.dart';
import 'package:nano_news/models/category.dart';
import 'package:nano_news/utility/app_theme.dart';
import 'package:nano_news/utility/dependency_assembly.dart';
import 'package:nano_news/utility/shared_utility.dart';
import 'package:nano_news/view_model/catergory_view_model.dart';
import 'package:nano_news/view_model/home_view_model.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

class CategoryCardWidget extends ConsumerWidget {
  final Function animatePageView;
  final CategoryViewModel categoryViewModel;
  final int index;
  CategoryCardWidget(
      {this.categoryViewModel, this.index, this.animatePageView});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.imageBlendGreyColor,
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            offset: const Offset(4, 4),
            blurRadius: 16,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        child: InkWell(
          onTap: () {
            final _category = categoryViewModel.getCategoryAtIndex(index);
            ref
                .read(categoryViewModelProvider)
                .setCurrentCatgory(category: _category);

            dependencyAssembler<SharedUtility>()
                .setSelectedCategory(_category.id);
            animatePageView(AppPageViewNavigate.forward);
          },
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey[700],
                        blurRadius: 18.0,
                        offset: Offset(1.0, 5.0),
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25.0),
                      bottomRight: Radius.circular(25.0),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25.0),
                      bottomRight: Radius.circular(25.0),
                    ),
                    child: Image.asset(
                      categoryViewModel.getCategoryImagePathAtIndex(index),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                height: 50.0,
                child: Center(
                  child: Text(
                    categoryViewModel.getCategoryNameAtIndex(index),
                    style: AppTheme.cardItemTitleStyle,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
