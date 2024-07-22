import 'package:flutter/material.dart';
import 'package:notes/widgets/custom_icon.dart';
import 'package:notes/widgets/custom_text_field.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Edit Note",style: TextStyle(fontSize: 32),),
        actions: [
          CustomIcon(icon: Icons.check),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0,horizontal: 16),
        child: Column(
          children: [
            CustomTextField(hint: "Title"),
            SizedBox(height: 16),
            CustomTextField(hint: "Content",maxLines: 6,),
          ],
        ),
      ),
    );
  }
}
