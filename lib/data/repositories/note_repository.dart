
import 'package:crud_gpt/data/models/note.dart';

abstract class NoteRepository {
  Future<List<Note>> getAllNotes();
  Future<void> addNote(Note note);
  Future<void> updateNote(Note note);
  Future<void> deleteNoteById(int id);
}
