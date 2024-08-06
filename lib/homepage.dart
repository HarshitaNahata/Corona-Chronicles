import 'package:covid/datasource.dart';
import 'package:covid/pages/countryPage.dart';
import 'package:covid/panels/infoPanel.dart';
import 'package:covid/panels/worldwidepanel.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'panels/mosteffectedcountries.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map? worldData;
  fetchWorldWideData() async {
    http.Response response =
        await http.get(Uri.parse('https://corona.lmao.ninja/all'));
    setState(() {
      worldData = jsonDecode(response.body);
    });
  }

  List? countryData;
  fetchCountryData() async {
    http.Response response =
        await http.get(Uri.parse('https://corona.lmao.ninja/countries'));
    setState(() {
      countryData = jsonDecode(response.body);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchWorldWideData();
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Corona Chronicles',
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 100,
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              color: Colors.orange[100],
              child: Text(
                DataSource.quote,
                style: TextStyle(
                    color: Colors.orange[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              )),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Worlwide',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CountryPage()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: primaryBlack,
                        borderRadius: BorderRadius.circular(15)),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Regional',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          worldData == null
              ? CircularProgressIndicator()
              : WorldwidePanel(
                  worldData: worldData!,
                ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'Most affected countries',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          countryData == null
              ? Container()
              : MostEffectedPanel(
                  countryData: countryData!,
                ),
          InfoPanel(),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              'Lets fight it together',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      )),
    );
  }
}
