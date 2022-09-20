// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:covid_nineteen/Model/world.dart';
import 'package:covid_nineteen/Services/api-service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../widget/row.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import 'country.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  final pieColor = <Color>[
    Color(0XFFde5246),
    Color(0XFF4285F4),
    Color(0XFF1aa260),
  ];
  @override
  Widget build(BuildContext context) {
    //Imported function
    ApiService worldState = ApiService();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              FutureBuilder(
                  future: worldState.fetchWorld(),
                  builder: (c, AsyncSnapshot<World> s) {
                    if (!s.hasData) {
                      return Expanded(
                          child: SpinKitFadingCircle(
                        color: Colors.white,
                        size: 50,
                        controller: _controller,
                      ));
                    } else {
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 12, right: 12, top: 12),
                        child: Column(
                          children: [
                            PieChart(
                              colorList: pieColor,
                              chartType: ChartType.ring,
                              animationDuration: Duration(seconds: 1),
                              chartValuesOptions: const ChartValuesOptions(
                                  showChartValuesInPercentage: true),
                              legendOptions: const LegendOptions(
                                  legendPosition: LegendPosition.left),
                              dataMap: {
                                "Died":
                                    double.parse(s.data!.deaths.toString()),
                                "Affected":
                                    double.parse(s.data!.cases.toString()),
                                "Secure": double.parse(
                                    s.data!.recovered.toString()),
                              },
                            ),
                            const SizedBox(
                                  height: 12,
                                ),
                            Container(
                              height: MediaQuery.of(context).size.height-360,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  children: [
                              
                                const Text(
                                  'Today',
                                  style: TextStyle(fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                TotalRow(
                                    title: 'Death',
                                    value: s.data!.todayDeaths.toString()),
                                const SizedBox(
                                  height: 12,
                                ),
                                TotalRow(
                                    title: 'Affected',
                                    value: s.data!.todayCases.toString()),
                                const SizedBox(
                                  height: 12,
                                ),
                                TotalRow(
                                    title: 'Recoverd',
                                    value: s.data!.todayRecovered.toString()),
                                const SizedBox(
                                  height: 12,
                                ),
                                const Text(
                                  'Total',
                                  style: TextStyle(fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                TotalRow(
                                    title: 'Affected',
                                    value: s.data!.cases.toString()),
                                const SizedBox(
                                  height: 12,
                                ),
                                TotalRow(
                                    title: 'Deaths',
                                    value: s.data!.deaths.toString()),
                           const SizedBox(
                                  height: 12,
                                ),          
                                  ],
                                ),
                              ),
                            ),
                             SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 53,
                              child: ElevatedButton.icon(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CountryTrack()));
                                  },
                                  icon: Icon(Icons.emoji_flags),
                                  label: Text('Affected on Country')),
                            )
                          ],
                        ),
                      );
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
