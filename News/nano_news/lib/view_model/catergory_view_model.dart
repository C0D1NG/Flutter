import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nano_news/models/category.dart';

final categoryViewModelProvider = Provider<CategoryViewModel>((ref) {
  return CategoryViewModel();
});

class CategoryViewModel {
  final List<Category> _allCategories = [
    Category(id: 'arts', name: 'Arts', imageName: 'arts.jpg'),
    Category(id: 'business', name: 'Business', imageName: 'business.jpg'),
    Category(id: 'sports', name: 'Sports', imageName: 'sports.jpg'),
    Category(id: 'movies', name: 'Movies', imageName: 'movies.jpg'),
    Category(id: 'travel', name: 'Travel', imageName: 'travel.jpg'),
    Category(id: 'fashion', name: 'Fashion', imageName: 'fashion.jpg'),
    Category(id: 'magazine', name: 'Magazines', imageName: 'magazine.jpg'),
    Category(
        id: 'automobiles', name: 'Automobiles', imageName: 'automobile.jpg'),
    Category(id: 'books', name: 'Books', imageName: 'books.jpg'),
    Category(id: 'theater', name: 'Theater', imageName: 'theater.jpg'),
    Category(id: 'politics', name: 'Politics', imageName: 'politics.jpg'),
    Category(id: 'technology', name: 'Technology', imageName: 'technology.jpg'),
    Category(
        id: 'realestate', name: 'Real Estate', imageName: 'real-estate.jpg')
  ];

  Category _currentCategory;

  List<Category> getAllCategories() {
    return _allCategories;
  }

  int getAllCategoriesCount() {
    return _allCategories.length;
  }

  String getCategoryNameAtIndex(int index) {
    return _allCategories[index].name;
  }

  String getCategoryImageNameAtIndex(int index) {
    return _allCategories[index].imageName;
  }

  String getCategoryImagePathAtIndex(int index) {
    return 'assets/images/${_allCategories[index].imageName}';
  }

  String getCategoryIdAtIndex(int index) {
    return _allCategories[index].id;
  }

  Category getCategoryAtIndex(int index) {
    return _allCategories[index];
  }

  Category getCategoryForId({String catId}) {
    return _allCategories.firstWhere((element) => element.id == catId);
  }

  void setCurrentCatgory({Category category}) {
    _currentCategory = category;
  }

  Category getCurrentCatgory() {
    return (_currentCategory == null) ? _allCategories.first : _currentCategory;
  }
}
