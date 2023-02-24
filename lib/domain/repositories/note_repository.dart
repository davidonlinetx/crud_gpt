import 'package:crud_gpt/data/models/note.dart';
import 'package:crud_gpt/data/sources/note_local_data_source.dart';
import 'package:crud_gpt/domain/entities/note.dart';
import 'package:crud_gpt/domain/repositories/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteLocalDataSource localDataSource;

  NoteRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<List<Note>> getNotes() async {
    final notes = await localDataSource.getNotes();
    return notes.map((note) => note.toEntity()).toList();
  }

  @override
  Future<void> addNote(Note note) async {
    final noteModel = NoteModel.fromEntity(note);
    await localDataSource.addOrUpdateNote(noteModel);
  }

  @override
  Future<void> updateNote(Note note) async {
    final noteModel = NoteModel.fromEntity(note);
    await localDataSource.addOrUpdateNote(noteModel);
  }

  @override
  Future<void> deleteNoteById(int id) async {
    await localDataSource.deleteNoteById(id);
  }
}
