import 'package:example/CountryList.dart';
import 'package:example/Messages.dart';
import 'package:example/PhoneNumSelect.dart';
import 'package:example/const.dart';
import 'package:flag/flag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {

      case countryListPage:
        return MaterialPageRoute(builder: (_) => CountryList());

      case phoneNumSelectPage:
        if (args is Flag) {
          return MaterialPageRoute(
            builder: (_) => PhoneNumSelect(
              flagImage: args,
            ),
          );
        }
        return _errorRoute();

      case messagesPage:
        if(args is Phones){
          return MaterialPageRoute(
            builder: (_) => Messages(
              phone: args,
            ),
          );
        }
        return _errorRoute();

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Error'),
          ),
          body: Center(
            child: Text('ERROR'),
          ),
        );
      },
    );
  }
}
