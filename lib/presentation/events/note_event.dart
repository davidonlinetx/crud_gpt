abstract class NoteEvent {}

class GetAllNotesEvent extends NoteEvent {}

class AddNoteEvent extends NoteEvent {
  final Note note;

  AddNoteEvent({required this.note});
}

class UpdateNoteEvent extends NoteEvent {
  final Note note;

  UpdateNoteEvent({required this.note});
}

class DeleteNoteEvent extends NoteEvent {
  final int noteId;

  DeleteNoteEvent({required this.noteId});
}
