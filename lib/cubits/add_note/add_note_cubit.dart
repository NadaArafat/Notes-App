import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:notes/constants.dart';
import 'package:notes/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  addNote(NoteModel note){
    emit(AddNoteLoading());
      try {
        var noteBox = Hive.box<NoteModel>(kNotesBox);
        noteBox.add(note);
        emit(AddNoteSuccess());
      }  catch (e) {
        emit(AddNoteFailure(e.toString()));
      }
  }
}
