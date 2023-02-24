abstract class NoteState {}

class LoadingState extends NoteState {}

class LoadedState extends NoteState {
  final List<Note> notes;

  LoadedState({required this.notes});
}

class ErrorState extends NoteState {
  final String message;

  ErrorState({required this.message});
}
