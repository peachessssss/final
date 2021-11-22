import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

Color blue1 = Color(0xFFC0FEFC);
Color blue2 = Color(0xFF3EDBF0);
Color blue3 = Color(0xFF77ACF1);
Color blue4 = Color(0xFF04009A);
Color orange1 = Color(0xFFFFB677);
Color orange2 = Color(0xFFFF8364);
Color grey1 = Colors.grey[200];
LinearPercentIndicator linear1 = LinearPercentIndicator(
  width: 200.0,
  lineHeight: 10.0,
  percent: 0.8,
  linearStrokeCap: LinearStrokeCap.butt,
  progressColor: Colors.red,
);
Image a = Image.asset("assets/images/icon4white.png", height: 200);
