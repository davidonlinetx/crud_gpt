import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../entities/note.dart';
import '../repositories/note_repository.dart';
import '../utils/failure.dart';
import 'usecase.dart';

class AddNoteUseCase implements UseCase<Note, AddNoteParams> {
  final NoteRepository repository;

  AddNoteUseCase({@required this.repository});

  @override
  Future<Either<Failure, Note>> call(AddNoteParams params) async {
    return await repository.addNote(params.note);
  }
}

class AddNoteParams {
  final Note note;

  AddNoteParams({@required this.note});
}
