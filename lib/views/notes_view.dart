import 'package:flutter/material.dart';
import '../widgets/add_note_bottom_sheet.dart';
import '../widgets/custom_search_icon.dart';
import '../widgets/notes_list_view.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(context: context, builder: (context){
            return AddNoteBottomSheet();
          });
        },
        child: Icon(
            Icons.add,
          ),
      ),
      appBar: AppBar(
        title: const Text(
          "Notes",
          style: TextStyle(fontSize: 32),
        ),
        actions: const [
          CustomSearchIcon(),
        ],
      ),
      body: const NotesListView(),
    );
  }
}
