
import 'package:http/http.dart';

Future<dynamic> getContents (dynamic url){
  return get(Uri.parse(url));
}
