import 'package:dartz/dartz.dart';

import '../entities/note.dart';
import '../repositories/note_repository.dart';
import '../utils/failure.dart';
import 'usecase.dart';

class GetAllNotesUseCase implements UseCase<List<Note>, NoParams> {
  final NoteRepository repository;

  GetAllNotesUseCase({required this.repository});

  @override
  Future<Either<Failure, List<Note>>> call(NoParams params) async {
    return await repository.getAllNotes();
  }
}
