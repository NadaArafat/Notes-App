import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/notes/notes_cubit.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/widgets/custom_icon.dart';
import 'package:notes/widgets/custom_text_field.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Edit Note",
          style: TextStyle(fontSize: 32),
        ),
        actions: [
          CustomIcon(
              icon: Icons.check,
              onPressed: () {
                note.save();
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                Navigator.pop(context);
              }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16),
        child: Column(
          children: [
            CustomTextField(
              hint: "Title",
              initialValue: note.title,
              onChanged: (value) {
                note.title = value ?? note.title;
              },
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hint: "Content",
              maxLines: 6,
              initialValue: note.content,
              onChanged: (value) {
                note.content = value ?? note.content;
              },
            ),
          ],
        ),
      ),
    );
  }
}
