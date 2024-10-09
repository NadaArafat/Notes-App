import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants.dart';
import '../cubits/add_note/add_note_cubit.dart';
import '../cubits/notes/notes_cubit.dart';
import '../models/note_model.dart';
import 'add_note_form.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({super.key, this.isLoading = false});

  final bool isLoading;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
        } else {
          autoValidateMode = AutovalidateMode.always;
          setState(() {});
        }
        var note = NoteModel(
          title: title!,
          content: content!,
          date: DateTime.now().toString().split(" ").first,
          color: Colors.blue.value,
        );
        BlocProvider.of<AddNoteCubit>(context).addNote(note);
        BlocProvider.of<NotesCubit>(context).fetchAllNotes();
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(kPrimaryColor),
      ),
      child: widget.isLoading
          ? const CircularProgressIndicator(
              color: Colors.black,
            )
          : const Text(
              "Add",
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
    );
  }
}
