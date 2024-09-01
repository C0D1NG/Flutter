import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailScreenController extends GetxController {
  //TODO: Implement DetailScreenController

  final count = 0.obs;
  var filterContent=''.obs;

  // "publishedAt": "2022-12-20T07:08:00Z",
  //String s='2022-12-20T07:08:00Z';
  // void dateFormat(String s){
  //   String time=s.split('TO') as String;
  //   var date=time[0];
  //   var t=time[1];
  //   var inputFormat = DateFormat('yyyy/MM/dd HH:mm');
  //  // var inputDate = inputFormat.parse('31/12/2000 23:59');
  //   var inputDate = inputFormat.parse('$date $t');
  //   // <-- dd/MM 24H format
  //   var outputFormat = DateFormat('dd/MM/yyyy hh:mm a');
  //   var outputDate = outputFormat.format(inputDate);
  //   print('time >>'+outputDate);
  // }

  void contentFilter(String st){
    if(st.contains('...',)){
      String s=st.split('...') as String;
      filterContent=st[0] as RxString;
    }
    filterContent=st as RxString;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
