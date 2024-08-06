// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WorldwidePanel extends StatelessWidget {
  // const WorldwidePanel({super.key});
  final Map worldData;

  const WorldwidePanel({Key? key, required this.worldData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2),
        children: [
          StatusPanel(
            title: 'Confirmed',
            panelColor: Colors.red[100]!,
            textColor: Colors.red,
            count: worldData['cases'].toString(),
          ),
          StatusPanel(
            title: 'Active',
            panelColor: Colors.blue[100]!,
            textColor: Colors.blue[900]!,
            count: worldData['active'].toString(),
          ),
          StatusPanel(
            title: 'Recovered',
            panelColor: Colors.green[100]!,
            textColor: Colors.green,
            count: worldData['recovered'].toString(),
          ),
          StatusPanel(
            title: 'Confirmed',
            panelColor: Colors.grey[400]!,
            textColor: Colors.grey[900]!,
            count: worldData['deaths'].toString(),
          ),
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;
  const StatusPanel({
    Key? key,
    required this.panelColor,
    required this.textColor,
    required this.title,
    required this.count,
  }) : super(key: key);

  // const StatusPanel({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(10),
      height: 80,
      color: panelColor,
      width: width / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'title',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: textColor),
          ),
          Text(count,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 16, color: textColor)),
        ],
      ),
    );
  }
}