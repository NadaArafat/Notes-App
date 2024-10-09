import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/notes/notes_cubit.dart';
import 'package:notes/models/note_model.dart';

import 'note_card.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: BlocBuilder<NotesCubit, NotesState>(
        builder: (context, state) {
            List<NoteModel> notesList = BlocProvider.of<NotesCubit>(context).notesList?? [];
            return ListView.builder(
              itemCount: notesList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 8),
                  child: NoteCard( note: notesList[index],),
                );
              },
            );
          }
      ),
    );
  }
}
