
import '../sampleData/data.dart';

class Helper{

  List<Map<String,dynamic>> getSearchedItems (String searchedKey){
    List<Map<String,dynamic>> defaultSearchedItems = [];
    for (Map<String,dynamic> item in searchedItem){
      String productName = item["productName"];
      if (productName.toLowerCase().contains(searchedKey.toLowerCase()) && searchedKey.isNotEmpty){
        defaultSearchedItems.add(item);
      }
    }
    return defaultSearchedItems;
  }
}