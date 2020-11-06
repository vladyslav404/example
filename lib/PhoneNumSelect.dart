import 'package:example/const.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class Phones {
  String state;
  String number;
  DateTime time;
  Flag flag;
  Phones({this.number, this.state, this.time});
}

class PhoneNumSelect extends StatelessWidget {
  final Flag flagImage;

  PhoneNumSelect({Key key, this.flagImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Phones one = Phones(state: 'MONNEE', number: '+125824192324', time: DateTime.now().subtract(Duration(minutes: 3535)));
    Phones two = Phones(state: 'CALIFORNIA', number: '+1258241935324', time: DateTime.now().subtract(Duration(minutes: 5)));
    Phones three = Phones(state: 'FLORIDA', number: '+12354643324', time: DateTime.now().subtract(Duration(minutes: 74543)));
    Phones four = Phones(state: 'COLORADO', number: '+1258241924645', time: DateTime.now().subtract(Duration(minutes: 59)));

    final List<Phones> items = [one, two, three, four];


    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          selPhoneNumber,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            elevation: 10,
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: AspectRatio(
                          child: flagImage,
                          aspectRatio: 7 / 3,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          item.state,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: DecoratedBox(
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                item.number,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: Color(0xFF55B5A4),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(timeago.format(item.time)),
                      Spacer(),
                      IconButton(
                        icon: Icon(Icons.arrow_right),
                        onPressed: () {
                          item.flag = flagImage;
                          Navigator.pushNamed(context, messagesPage, arguments: item);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
