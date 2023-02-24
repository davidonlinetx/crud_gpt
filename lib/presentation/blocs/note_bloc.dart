import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:crud_gpt/domain/entities/note.dart';
import 'package:crud_gpt/domain/usecases/add_note_usecase.dart';
import 'package:crud_gpt/domain/usecases/delete_note_usecase.dart';
import 'package:crud_gpt/domain/usecases/get_all_notes_usecase.dart';
import 'package:crud_gpt/domain/usecases/update_note_usecase.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final GetAllNotesUseCase getAllNotesUseCase;
  final AddNoteUseCase addNoteUseCase;
  final UpdateNoteUseCase updateNoteUseCase;
  final DeleteNoteUseCase deleteNoteUseCase;

  NoteBloc({
    required this.getAllNotesUseCase,
    required this.addNoteUseCase,
    required this.updateNoteUseCase,
    required this.deleteNoteUseCase,
  }) : super(NoteInitial());

  @override
  Stream<NoteState> mapEventToState(
    NoteEvent event,
  ) async* {
    if (event is GetAllNotesEvent) {
      yield* _mapGetAllNotesEventToState();
    } else if (event is AddNoteEvent) {
      yield* _mapAddNoteEventToState(event.note);
    } else if (event is UpdateNoteEvent) {
      yield* _mapUpdateNoteEventToState(event.note);
    } else if (event is DeleteNoteEvent) {
      yield* _mapDeleteNoteEventToState(event.note);
    }
  }

  Stream<NoteState> _mapGetAllNotesEventToState() async* {
    yield NoteLoading();
    try {
      final notes = await getAllNotesUseCase();
      yield NoteLoaded(notes);
    } catch (_) {
      yield NoteError('Failed to get notes');
    }
  }

  Stream<NoteState> _mapAddNoteEventToState(Note note) async* {
    yield NoteLoading();
    try {
      await addNoteUseCase(note);
      final notes = await getAllNotesUseCase();
      yield NoteLoaded(notes);
    } catch (_) {
      yield NoteError('Failed to add note');
    }
  }

  Stream<NoteState> _mapUpdateNoteEventToState(Note note) async* {
    yield NoteLoading();
    try {
      await updateNoteUseCase(note);
      final notes = await getAllNotesUseCase();
      yield NoteLoaded(notes);
    } catch (_) {
      yield NoteError('Failed to update note');
    }
  }

  Stream<NoteState> _mapDeleteNoteEventToState(Note note) async* {
    yield NoteLoading();
    try {
      await deleteNoteUseCase(note);
      final notes = await getAllNotesUseCase();
      yield NoteLoaded(notes);
    } catch (_) {
      yield NoteError('Failed to delete note');
    }
  }
}
