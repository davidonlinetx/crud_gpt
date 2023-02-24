import 'package:equatable/equatable.dart';

class Note extends Equatable {
  final int id;
  final String title;
  final String category;
  final double price;
  final String comment;
  final DateTime date;

  Note({
    this.id,
    this.title,
    this.category,
    this.price,
    this.comment,
    this.date,
  });

  @override
  List<Object> get props => [id, title, category, price, comment, date];
}
