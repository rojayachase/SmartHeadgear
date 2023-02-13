import 'package:anapact/core/utils/screen_util.dart';

class Sizes {
  Sizes._();

  static const double s0 = 0;
  static const double s1 = 1;
  static const double s2 = 2;
  static const double s3 = 3;
  static const double s4 = 4;
  static const double s5 = 5;
  static const double s6 = 6;
  static const double s7 = 7;
  static const double s8 = 8;
  static const double s9 = 9;
  static const double s10 = 10;
  static const double s12 = 12;
  static const double s13 = 13;
  static const double s14 = 14;
  static const double s15 = 15;
  static const double s16 = 16;
  static const double s17 = 17;
  static const double s18 = 18;
  static const double s19 = 19;
  static const double s20 = 20;
  static const double s22 = 22;
  static const double s24 = 24;
  static const double s25 = 25;
  static const double s26 = 26;
  static const double s28 = 28;
  static const double s30 = 30;
  static const double s32 = 32;
  static const double s33 = 33;
  static const double s34 = 34;
  static const double s35 = 35;
  static const double s38 = 38;
  static const double s40 = 40;
  static const double s45 = 45;
  static const double s42 = 42;
  static const double s44 = 44;
  static const double s46 = 46;
  static const double s48 = 48;
  static const double s50 = 50;
  static const double s60 = 60;
  static const double s64 = 64;
  static const double s70 = 70;
  static const double s80 = 80;
  static const double s90 = 90;
  static const double s95 = 95;
  static const double s100 = 100;
  static const double s105 = 105;
  static const double s110 = 110;
  static const double s120 = 120;
  static const double s130 = 130;
  static const double s140 = 140;
  static const double s150 = 150;
  static const double s160 = 160;
  static const double s170 = 170;
  static const double s180 = 180;
  static const double s190 = 190;
  static const double s200 = 200;
  static const double s220 = 220;
  static const double s230 = 230;
  static const double s240 = 240;
  static const double s250 = 250;
  static const double s260 = 260;
  static const double s270 = 270;
  static const double s280 = 280;
  static const double s290 = 290;
  static const double s300 = 300;
}

extension SizeExtension on double {
  double get w => ScreenUtil().setWidth(this);

  double get h => ScreenUtil().setHeight(this);

  double get sp => ScreenUtil().setSp(this);

  double get r => ScreenUtil().radius(this);
}
