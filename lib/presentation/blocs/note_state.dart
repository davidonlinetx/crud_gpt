part of 'note_bloc.dart';

abstract class NoteState extends Equatable {
  const NoteState();

  @override
  List<Object> get props => [];
}

class NoteLoading extends NoteState {}

class NoteLoadSuccess extends NoteState {
  final List<Note> notes;

  const NoteLoadSuccess([this.notes = const []]);

  @override
  List<Object> get props => [notes];

  @override
  String toString() => 'NoteLoadSuccess { notes: $notes }';
}

class NoteOperationSuccess extends NoteState {
  final String message;

  const NoteOperationSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class NoteOperationFailure extends NoteState {
  final String error;

  const NoteOperationFailure(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'NoteOperationFailure { error: $error }';
}
