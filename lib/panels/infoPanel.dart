import 'package:covid/datasource.dart';
import 'package:covid/pages/faqs.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class InfoPanel extends StatelessWidget {
  const InfoPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => FAQPage()));
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 10,
              ),
              margin: EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 10,
              ),
              color: primaryBlack,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'FAQs',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              launchUrlString('https://covid19responsefund.org/');
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 10,
              ),
              margin: EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 10,
              ),
              color: primaryBlack,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Donate',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              launchUrlString(
                  'https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters');
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 10,
              ),
              margin: EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 10,
              ),
              color: primaryBlack,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Myth Busters',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
