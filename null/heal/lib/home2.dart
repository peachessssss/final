import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heal/addfood.dart';
import 'package:heal/css/color.dart';
import 'package:heal/meal.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// ignore: must_be_immutable
class home2 extends StatefulWidget {
  @override
  _home2 createState() => _home2();
}

class _home2 extends State<home2> {
  List<calories> _chartData1;
  List<protein> _chartData2;
  List<carp> _chartData3;
  List<fat> _chartData4;
  @override
  void initState() {
    _chartData1 = getChartData1();
    _chartData2 = getChartData2();
    _chartData3 = getChartData3();
    _chartData4 = getChartData4();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      SizedBox(
        height: 100,
      ),
      CarouselSlider(
        items: [
          //calories bar chart
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: SfCartesianChart(
              isTransposed: true,
              title: ChartTitle(text: 'ปริมาณแคลอรี่ต่อวัน'),
              series: <ChartSeries>[
                BarSeries<calories, String>(
                    dataSource: _chartData1,
                    xValueMapper: (calories gdp, _) => gdp.continent,
                    yValueMapper: (calories gdp, _) => gdp.gdp,
                    dataLabelSettings: DataLabelSettings(isVisible: true),
                    enableTooltip: true)
              ],
              primaryXAxis: CategoryAxis(),
              primaryYAxis: NumericAxis(
                  edgeLabelPlacement: EdgeLabelPlacement.shift,
                  title: AxisTitle(text: 'ปริมาณแคลอรี่(กิโลแคลอรี่)')),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: SfCartesianChart(
              isTransposed: true,
              title: ChartTitle(text: 'ปริมาณโปรตีนต่อวัน'),
              series: <ChartSeries>[
                BarSeries<protein, String>(
                    dataSource: _chartData2,
                    xValueMapper: (protein gdp, _) => gdp.continent,
                    yValueMapper: (protein gdp, _) => gdp.gdp,
                    dataLabelSettings: DataLabelSettings(isVisible: true),
                    enableTooltip: true)
              ],
              primaryXAxis: CategoryAxis(),
              primaryYAxis: NumericAxis(
                  edgeLabelPlacement: EdgeLabelPlacement.shift,
                  title: AxisTitle(text: 'ปริมาณโปรตีน(กรัม)')),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: SfCartesianChart(
              isTransposed: true,
              title: ChartTitle(text: 'ปริมาณคาร์โบไฮเดรทต่อวัน'),
              series: <ChartSeries>[
                BarSeries<carp, String>(
                    dataSource: _chartData3,
                    xValueMapper: (carp gdp, _) => gdp.continent,
                    yValueMapper: (carp gdp, _) => gdp.gdp,
                    enableTooltip: true)
              ],
              primaryXAxis: CategoryAxis(),
              primaryYAxis: NumericAxis(
                  edgeLabelPlacement: EdgeLabelPlacement.shift,
                  title: AxisTitle(text: 'ปริมาณคาร์โบไฮเดรท(กรัม)')),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: SfCartesianChart(
              isTransposed: true,
              title: ChartTitle(text: 'ปริมาณไขมันต่อวัน'),
              series: <ChartSeries>[
                BarSeries<fat, String>(
                    dataSource: _chartData4,
                    xValueMapper: (fat gdp, _) => gdp.continent,
                    yValueMapper: (fat gdp, _) => gdp.gdp,
                    enableTooltip: true)
              ],
              primaryXAxis: CategoryAxis(),
              primaryYAxis: NumericAxis(
                  edgeLabelPlacement: EdgeLabelPlacement.shift,
                  title: AxisTitle(text: 'ปริมาณไขมัน(กรัม)')),
            ),
          )
        ],
        //Slider Container properties
        options: CarouselOptions(
          autoPlay: false,
        ),
      ),
      //protein bar chart
      //fat bar chart
    ])));
  }

  List<calories> getChartData1() {
    final List<calories> barchart1 = [
      calories('10', 2360),
      calories('11', 2385),
      calories('12', 2218),
      calories('13', 2147),
      calories('14', 1748),
      calories('15', 1928),
      calories('16', 2149)
    ];
    return barchart1;
  }

  List<protein> getChartData2() {
    final List<protein> barchart2 = [
      protein('10', 440),
      protein('11', 380),
      protein('12', 368),
      protein('13', 352),
      protein('14', 368),
      protein('15', 296),
      protein('16', 236)
    ];
    return barchart2;
  }

  List<carp> getChartData3() {
    final List<carp> barchart3 = [
      carp('10', 1200),
      carp('11', 1240),
      carp('12', 1220),
      carp('13', 1120),
      carp('14', 840),
      carp('15', 984),
      carp('16', 1184)
    ];
    return barchart3;
  }

  List<fat> getChartData4() {
    final List<fat> barchart4 = [
      fat('10', 720),
      fat('11', 765),
      fat('12', 630),
      fat('13', 675),
      fat('14', 540),
      fat('15', 648),
      fat('16', 729)
    ];
    return barchart4;
  }
}

class calories {
  calories(this.continent, this.gdp);
  final String continent;
  final double gdp;
}

class protein {
  protein(this.continent, this.gdp);
  final String continent;
  final double gdp;
}

class carp {
  carp(this.continent, this.gdp);
  final String continent;
  final double gdp;
}

class fat {
  fat(this.continent, this.gdp);
  final String continent;
  final double gdp;
}
