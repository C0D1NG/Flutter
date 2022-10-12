
import 'package:ecommerce_app/state/model/visibility.dart';
import 'package:ecommerce_app/state/actions/visibility_action.dart';

Visibility visibilityReducer(Visibility state,dynamic action){

    switch(action.type){
      case "VISIBILITY":
        return action.payload;
      default:
        return state;
    }
}