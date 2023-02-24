import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/note.dart';
import '../bloc/note_bloc.dart';
import 'note_detail_page.dart';

class NoteListPage extends StatefulWidget {
  const NoteListPage({Key? key}) : super(key: key);

  @override
  _NoteListPageState createState() => _NoteListPageState();
}

class _NoteListPageState extends State<NoteListPage> {
  @override
  void initState() {
    super.initState();
    context.read<NoteBloc>().add(GetAllNotes());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notas'),
      ),
      body: BlocBuilder<NoteBloc, NoteState>(
        builder: (context, state) {
          if (state is NoteLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is NoteLoaded) {
            final notes = state.notes;
            return ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                final note = notes[index];
                return Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20.0),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  onDismissed: (direction) {
                    context.read<NoteBloc>().add(DeleteNoteById(note.id));
                  },
                  child: ListTile(
                    title: Text(note.title),
                    subtitle: Text(note.category),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => NoteDetailPage(note: note)));
                    },
                  ),
                );
              },
            );
          } else if (state is NoteError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return Container();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => NoteDetailPage()));
        },
      ),
    );
  }
}
