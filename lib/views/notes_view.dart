import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/notes/notes_cubit.dart';
import '../widgets/add_note_bottom_sheet.dart';
import '../widgets/custom_icon.dart';
import '../widgets/notes_list_view.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return const AddNoteBottomSheet();
            },
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        title: const Text(
          "Notes",
          style: TextStyle(fontSize: 32),
        ),
        actions: const [
          CustomIcon(icon: Icons.search),
        ],
      ),
      body: const NotesListView(),
    );
  }
}
