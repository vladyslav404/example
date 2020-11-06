import 'package:example/PhoneNumSelect.dart';
import 'package:example/const.dart';
import 'package:flutter/material.dart';
import 'package:flag/flag.dart';

class CountryList extends StatefulWidget {
  @override
  _CountryListState createState() => _CountryListState();
}

class CountryHardCode {
  String countryName;
  Flag countryFlag;

  CountryHardCode({this.countryFlag, this.countryName});
}

class _CountryListState extends State<CountryList> {


  static CountryHardCode canada = CountryHardCode(
      countryFlag: Flag(
        'ca',
      ),
      countryName: 'Canada');
  static CountryHardCode us = CountryHardCode(
      countryFlag: Flag(
        'us',
      ),
      countryName: 'USA');

  List<CountryHardCode> items = [canada, us];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Choose a country",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return Card(
            elevation: 10,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Container(
                    height: 70,
                    width: 100,
                    child: item.countryFlag,
                  ),
                ),
                Text(
                  item.countryName,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.arrow_right),
                  onPressed: () {
                    Navigator.pushNamed(context, phoneNumSelectPage, arguments: item.countryFlag);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
