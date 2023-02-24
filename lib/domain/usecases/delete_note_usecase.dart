import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../repositories/note_repository.dart';
import '../utils/failure.dart';
import 'usecase.dart';

class DeleteNoteUseCase implements UseCase<void, DeleteNoteParams> {
  final NoteRepository repository;

  DeleteNoteUseCase({@required this.repository});

  @override
  Future<Either<Failure, void>> call(DeleteNoteParams params) async {
    return await repository.deleteNoteById(params.noteId);
  }
}

class DeleteNoteParams {
  final String noteId;

  DeleteNoteParams({@required this.noteId});
}
