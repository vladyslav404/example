import 'package:example/CountryList.dart';
import 'package:example/PhoneNumSelect.dart';
import 'package:example/RouteGenerator.dart';
import 'package:example/const.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF31CAAB),
      ),
      initialRoute: countryListPage,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
