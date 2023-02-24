import 'package:crud_gpt/data/models/note_model.dart';

abstract class NoteLocalDataSource {
  Future<List<NoteModel>> getAllNotes();
  Future<void> addNote(NoteModel note);
  Future<void> updateNote(NoteModel note);
  Future<void> deleteNoteById(int id);
}
