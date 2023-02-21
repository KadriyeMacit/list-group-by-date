import 'package:flutter/material.dart';
import 'package:group_by_date_example/extensions/extensions.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map> list = [
    {
      "time": "2023-06-16T10:31:12.000Z",
      "message":
          "P2 BGM-01 HV buiten materieel (Gas lekkage) Franckstraat Arnhem 073631"
    },
    {
      "time": "2023-06-16T10:29:35.000Z",
      "message": "A1 Brahmslaan 3862TD Nijkerk 73278"
    },
    {
      "time": "2023-06-16T10:29:35.000Z",
      "message": "A2 NS Station Rheden Dr. Langemijerweg 6991EV Rheden 73286"
    },
    {
      "time": "2023-06-15T09:41:18.000Z",
      "message": "A2 VWS Utrechtseweg 6871DR Renkum 74636"
    },
    {
      "time": "2023-06-14T09:40:58.000Z",
      "message":
          "B2 5623EJ : Michelangelolaan Eindhoven Obj: ziekenhuizen 8610 Ca CATH route 522 PAAZ Rit: 66570"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (_, index) {
            bool isSameDate = true;
            final String dateString = list[index]['time'];
            final DateTime date = DateTime.parse(dateString);
            if (index == 0) {
              isSameDate = false;
            } else {
              final String prevDateString = list[index - 1]['time'];
              final DateTime prevDate = DateTime.parse(prevDateString);
              isSameDate = date.isSameDate(prevDate);
            }
            if (index == 0 || !(isSameDate)) {
              return Column(
                children: [
                  const SizedBox(height: 10),
                  Text(
                    date.formatDate(),
                  ),
                  Card(child: ListTile(title: Text('item $index')))
                ],
              );
            } else {
              return Card(child: ListTile(title: Text('item $index')));
            }
          },
        ),
      ),
    );
  }
}
