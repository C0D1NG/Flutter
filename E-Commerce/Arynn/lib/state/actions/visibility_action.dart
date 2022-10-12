

import 'package:ecommerce_app/state/model/visibility.dart';


class VisibilityAction{
  Visibility payload;
  String type;

  VisibilityAction(this.type,this.payload);
}