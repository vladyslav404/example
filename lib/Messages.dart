import 'package:clipboard/clipboard.dart';
import 'package:example/PhoneNumSelect.dart';
import 'package:example/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class Messages extends StatefulWidget {
  Messages({this.phone});
  final Phones phone;

  @override
  MessagesState createState() {
    return MessagesState();
  }
}

class Sms {
  String from;
  DateTime received;
  String message;

  Sms({this.from, this.message, this.received});
}

class MessagesState extends State<Messages> {
  List<Sms> lst = [
    Sms(
        from: '+1204250942095',
        message: 'Hjfaefkbkajwnkdkljkbrsekamejrjfekmjrjnvdck',
        received: DateTime.now().subtract(Duration(minutes: 5))),
    Sms(
        from: '+1204250942095',
        message: 'Hjfaefkb kajwnkdkljk brsekamejrjfek mjrjnvdck',
        received: DateTime.now().subtract(Duration(minutes: 23))),
    Sms(
        from: '+1204250942095',
        message: 'Hjfaefkbk ajwnkdkl jkbrsekamej rjfekmjrj nvdck',
        received: DateTime.now().subtract(Duration(minutes: 55))),
    Sms(
        from: '+1204250942095',
        message: 'Hjfaefkb kajwnk dklj kbrsekamejrj fekmjrjnvdck',
        received: DateTime.now().subtract(Duration(minutes: 123))),
    Sms(
        from: '+1204250942095',
        message:
            'Hjfaefk bkajwnkd ljkbrseka mej rjfekmj rjnvdckf efwefefs efefwejf kwje gkjqe f jqjfkeq fj,qjf qkjegnqlkfmqljekgkrwlfkmewjgrbwlnwlekfnlweknfl',
        received: DateTime.now().subtract(Duration(minutes: 563))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          messagesFor + widget.phone.number,
          textScaleFactor: 0.9,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.phone.number,
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                    FlatButton(
                      child: DecoratedBox(
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Copy',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            width: 3,
                            color: Color(0xFF55B5A4),
                          ),
                        ),
                      ),
                      onPressed: () => FlutterClipboard.copy(widget.phone.number).then(
                        (value) => {},
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Expanded(
                      child: AspectRatio(
                        child: widget.phone.flag,
                        aspectRatio: 7 / 3,
                      ),
                    ),
                    Text(widget.phone.state),
                    Spacer(),
                    Text(timeago.format(widget.phone.time)),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                    onPressed: _refreshAction,
                    child: DecoratedBox(
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          refresh,
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          width: 1,
                          color: Color(0xFF55B5A4),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ]..addAll(
            List.generate(
              lst.length,
              (index) {
                var item = lst[index];
                return Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: EdgeInsets.all(17.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'from:',
                                  style: TextStyle(
                                    fontSize: 17,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Received:',
                                  style: TextStyle(
                                    fontSize: 17,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.from,
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  timeago.format(item.received),
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Message:',
                              style: TextStyle(
                                fontSize: 17,
                              ),
                            ),SizedBox(
                              width: 60,
                            ),
                            Expanded(
                              child: Text(
                                item.message,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
      ),
    );
  }

  _refreshAction() {
    setState(
      () {
        //When backend is ready
      },
    );
  }
}
