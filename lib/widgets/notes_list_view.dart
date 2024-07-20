import 'package:flutter/material.dart';

import 'note_card.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  final List<NoteCard> notesList = const [
    NoteCard(color: Colors.yellow,),
    NoteCard(color: Colors.orange,),
    NoteCard(color: Colors.blue,),
    NoteCard(color: Colors.lightBlue,),
    NoteCard(color: Colors.greenAccent,)
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ListView.builder(
        itemCount: notesList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: notesList[index],
          );
        },
      ),
    );
  }
}
