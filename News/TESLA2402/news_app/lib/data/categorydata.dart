import 'package:news_app/models/category_models.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = new List<CategoryModel>.empty(growable: true);
  CategoryModel categoryModel = CategoryModel();

  categoryModel.categoryName = "Sports";
  categoryModel.imageURL =
      "https://htmlcolorcodes.com/assets/images/colors/electric-blue-color-solid-background-1920x1080.png";
  category.add(categoryModel);
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Science";
  categoryModel.imageURL =
      "https://htmlcolorcodes.com/assets/images/colors/aquamarine-color-solid-background-1920x1080.png";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "General";
  categoryModel.imageURL =
      "https://htmlcolorcodes.com/assets/images/colors/light-blue-color-solid-background-1920x1080.png";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Health";
  categoryModel.imageURL =
      "https://htmlcolorcodes.com/assets/images/colors/seafoam-green-color-solid-background-1920x1080.png";
  category.add(categoryModel);
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Business";
  categoryModel.imageURL =
      "https://htmlcolorcodes.com/assets/images/colors/baby-blue-color-solid-background-1920x1080.png";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Technology";
  categoryModel.imageURL =
      "https://upload.wikimedia.org/wikipedia/commons/f/fb/Light_blue.png";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Entertainment";
  categoryModel.imageURL =
      "https://static.onecms.io/wp-content/uploads/sites/28/2017/05/blue0517.jpg";
  category.add(categoryModel);

  return category;
}
