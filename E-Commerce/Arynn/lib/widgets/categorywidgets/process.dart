
import 'package:ecommerce_app/services/urls.dart';
import 'package:ecommerce_app/services/get.dart';

  processCategoryContents(){
    return getContents(urls["getcategory"]);
  }
