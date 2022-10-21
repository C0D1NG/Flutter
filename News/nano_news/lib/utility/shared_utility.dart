import 'package:nano_news/utility/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedUtility {
  SharedPreferences sharedPreferences;

  void initialize(Function completed) {
    SharedPreferences.getInstance().then((SharedPreferences sp) {
      sharedPreferences = sp;
      completed(true);
    });
  }

  String getSelectedCategory() {
    return sharedPreferences
            .getString(Constants.CATEGORY_SELECTED_SHARED_PREFERNCE) ??
        'all';
  }

  void setSelectedCategory(String category) {
    sharedPreferences.setString(
        Constants.CATEGORY_SELECTED_SHARED_PREFERNCE, category);
  }
}
