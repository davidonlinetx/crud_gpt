import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:crud_gpt/data/models/note.dart';

abstract class NoteEvent extends Equatable {
  const NoteEvent();

  @override
  List<Object> get props => [];
}

class GetAllNotes extends NoteEvent {}

class AddNote extends NoteEvent {
  final Note note;

  const AddNote({@required this.note});

  @override
  List<Object> get props => [note];

  @override
  String toString() => 'AddNote { note: $note }';
}

class UpdateNote extends NoteEvent {
  final Note note;

  const UpdateNote({@required this.note});

  @override
  List<Object> get props => [note];

  @override
  String toString() => 'UpdateNote { note: $note }';
}

class DeleteNote extends NoteEvent {
  final int id;

  const DeleteNote({@required this.id});

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'DeleteNote { id: $id }';
}
