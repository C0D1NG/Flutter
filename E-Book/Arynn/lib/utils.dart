import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

//Color
const black = CupertinoColors.black;
const white = CupertinoColors.white;
const grey1 = CupertinoColors.systemGrey2;
final grey2 = Colors.grey[200];

//Data
var font = GoogleFonts.montserrat(
  color: CupertinoColors.black,
  fontSize: 14,
  letterSpacing: 1,
  fontWeight: FontWeight.w500,
);

var fontw = GoogleFonts.montserrat(
  color: CupertinoColors.white,
  fontSize: 14,
  letterSpacing: 1,
  fontWeight: FontWeight.w500,
);

var fontb = GoogleFonts.montserrat(
  color: CupertinoColors.black,
  fontSize: 14,
  letterSpacing: 1,
  fontWeight: FontWeight.bold,
);

//GetX
class Data extends GetxController {
  var isActive1 = false.obs;
  void setActive1() => isActive1.value = !isActive1.value;

  var isActive2 = false.obs;
  void setActive2() => isActive2.value = !isActive2.value;

  var isActive3 = false.obs;
  void setActive3() => isActive3.value = !isActive3.value;

  var isActive4 = false.obs;
  void setActive4() => isActive4.value = !isActive4.value;

  var isActive5 = false.obs;
  void setActive5() => isActive5.value = !isActive5.value;

  var isActive6 = false.obs;
  void setActive6() => isActive6.value = !isActive6.value;

  var isActive7 = false.obs;
  void setActive7() => isActive7.value = !isActive7.value;
}
