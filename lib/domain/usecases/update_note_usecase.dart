import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../entities/note.dart';
import '../repositories/note_repository.dart';
import '../utils/failure.dart';
import 'usecase.dart';

class UpdateNoteUseCase implements UseCase<void, Note> {
  final NoteRepository repository;

  UpdateNoteUseCase({@required this.repository});

  @override
  Future<Either<Failure, void>> call(Note note) async {
    return await repository.updateNoteById(note.id, note);
  }
}
