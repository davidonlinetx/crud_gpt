import 'package:crud_gpt/data/datasources/local_datasource.dart';
import 'package:crud_gpt/domain/entities/note.dart';
import 'package:crud_gpt/domain/repositories/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  final LocalDatasource _localDatasource;

  NoteRepositoryImpl(this._localDatasource);

  @override
  Future<List<Note>> getAllNotes() async {
    return await _localDatasource.getAllNotes();
  }

  @override
  Future<void> addNote(Note note) async {
    await _localDatasource.addNote(note);
  }

  @override
  Future<void> updateNote(Note note) async {
    await _localDatasource.updateNote(note);
  }

  @override
  Future<void> deleteNoteById(int id) async {
    await _localDatasource.deleteNoteById(id);
  }
}
