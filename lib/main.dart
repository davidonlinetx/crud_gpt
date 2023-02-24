
import 'package:flutter/material.dart';
import 'package:crud_gpt/data/repositories/note_repository_impl.dart';
import 'package:crud_gpt/domain/usecases/get_all_notes_usecase.dart';
import 'package:crud_gpt/presentation/pages/note_list_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final NoteRepositoryImpl _noteRepository = NoteRepositoryImpl();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<GetAllNotesUsecase>(
          create: (_) => GetAllNotesUsecase(_noteRepository),
        ),
      ],
      child: MaterialApp(
        title: 'My Notes',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: NoteListPage(),
      ),
    );
  }
}
