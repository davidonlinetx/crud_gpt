import 'package:flutter/material.dart';

class NoteDetailPage extends StatefulWidget {
  @override
  _NoteDetailPageState createState() => _NoteDetailPageState();
}

class _NoteDetailPageState extends State<NoteDetailPage> {
  String _title;
  String _category;
  double _price;
  String _comment;
  DateTime _date;
  TimeOfDay _time;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note Detail'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              onChanged: (value) {
                _title = value;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Category',
              ),
              onChanged: (value) {
                _category = value;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Price',
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onChanged: (value) {
                _price = double.tryParse(value);
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Comment',
              ),
              onChanged: (value) {
                _comment = value;
              },
            ),
            SizedBox(height: 16.0),
            Text('Date:'),
            SizedBox(height: 8.0),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () {
                    // Implement date picker
                  },
                ),
                Text(_date?.toString() ?? 'No date selected'),
              ],
            ),
            SizedBox(height: 16.0),
            Text('Time:'),
            SizedBox(height: 8.0),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.access_time),
                  onPressed: () {
                    // Implement time picker
                  },
                ),
                Text(_time?.format(context) ?? 'No time selected'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
