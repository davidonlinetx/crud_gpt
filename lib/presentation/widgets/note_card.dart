import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:crud_gpt/domain/entities/note.dart';

class NoteCard extends StatelessWidget {
  final Note note;
  final VoidCallback onTap;
  final VoidCallback onDismissed;

  const NoteCard({
    Key? key,
    required this.note,
    required this.onTap,
    required this.onDismissed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateFormatter = DateFormat('dd/MM/yyyy');
    final timeFormatter = DateFormat('HH:mm');
    final date = dateFormatter.format(note.dateTime);
    final time = timeFormatter.format(note.dateTime);

    return Dismissible(
      key: Key(note.id),
      onDismissed: (_) => onDismissed(),
      child: Card(
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  note.title,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  note.category,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Precio: \$${note.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.green[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  note.comment,
                  style: TextStyle(fontSize: 14.0),
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Icon(Icons.calendar_today_outlined, size: 16.0),
                    SizedBox(width: 4.0),
                    Text(date, style: TextStyle(fontSize: 12.0)),
                    SizedBox(width: 16.0),
                    Icon(Icons.access_time_outlined, size: 16.0),
                    SizedBox(width: 4.0),
                    Text(time, style: TextStyle(fontSize: 12.0)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
