// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../widget/row.dart';

class Details extends StatelessWidget {
  String name, affected, recovered, death;
  Details(
      {Key? key,
      required this.death,
      required this.affected,
      required this.name,
      required this.recovered})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            PieChart(
              colorList: [Colors.yellow, Colors.green, Colors.pink],
              animationDuration: Duration(seconds: 1),
              chartValuesOptions:
                  const ChartValuesOptions(showChartValuesInPercentage: true),
              legendOptions:
                  const LegendOptions(legendPosition: LegendPosition.left),
              dataMap: {
                "Died": double.parse(death.toString()),
                "Affected": double.parse(affected.toString()),
                "Secure": double.parse(recovered.toString()),
              },
            ),
            SizedBox(height: 24),
            TotalRow(title: 'Country', value: name),
            SizedBox(height: 12),
            TotalRow(title: 'Death', value: death),
            SizedBox(height: 12),
            TotalRow(title: 'Affected', value: affected),
            SizedBox(height: 12),
            TotalRow(title: 'Recovered', value: recovered),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
