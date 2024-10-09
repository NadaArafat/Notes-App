import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/models/note_model.dart';

import '../../constants.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel>? notesList;

  fetchAllNotes() {
    var noteBox = Hive.box<NoteModel>(kNotesBox);
    notesList = noteBox.values.toList();
    emit(NotesSuccess());
  }
}
