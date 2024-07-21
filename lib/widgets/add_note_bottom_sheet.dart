import 'package:flutter/material.dart';
import 'package:notes/constants.dart';

import 'custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 32.0, horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CustomTextField(
              hint: "Title",
            ),
            const SizedBox(
              height: 16,
            ),
            const CustomTextField(
              hint: "Content",
              maxLines: 6,
            ),
            SizedBox(height: 32,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(kPrimaryColor),
                ),
                child: const Text(
                  "Add",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
