import 'package:flutter/material.dart';
import 'package:crud_gpt/data/datasources/local_datasource.dart';
import 'package:crud_gpt/data/repositories/note_repository_impl.dart';
import 'package:crud_gpt/domain/entities/note.dart';
import 'package:crud_gpt/domain/repositories/note_repository.dart';
import 'package:crud_gpt/domain/usecases/add_note_usecase.dart';
import 'package:crud_gpt/domain/usecases/delete_note_usecase.dart';
import 'package:crud_gpt/domain/usecases/get_all_notes_usecase.dart';
import 'package:crud_gpt/domain/usecases/update_note_usecase.dart';

class App {
  static NoteRepository _noteRepository;

  static void init() {
    _noteRepository = NoteRepositoryImpl(LocalDatasource());
  }

  static GetAllNotesUsecase provideGetAllNotesUsecase() {
    return GetAllNotesUsecase(_noteRepository);
  }

  static AddNoteUsecase provideAddNoteUsecase() {
    return AddNoteUsecase(_noteRepository);
  }

  static UpdateNoteUsecase provideUpdateNoteUsecase() {
    return UpdateNoteUsecase(_noteRepository);
  }

  static DeleteNoteUsecase provideDeleteNoteUsecase() {
    return DeleteNoteUsecase(_noteRepository);
  }
}
