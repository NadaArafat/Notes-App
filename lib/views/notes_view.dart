import 'package:flutter/material.dart';

import '../widgets/custom_search_icon.dart';
import '../widgets/note_card.dart';

class Notesview extends StatelessWidget {
  const Notesview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notes",
          style: TextStyle(fontSize: 32),
        ),
        actions: const [
          CustomSearchIcon(),
        ],
      ),
      body: ListView(
        children: [
          NoteCard(),
          NoteCard(),
        ],
      ),
    );
  }
}
