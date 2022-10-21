import 'package:flutter_riverpod/flutter_riverpod.dart';

class Constants {
  static const String CATEGORY_SELECTED_SHARED_PREFERNCE = 'category_selected';
}

final constantsProvider = Provider<Constants>((ref) {
  return Constants();
});
