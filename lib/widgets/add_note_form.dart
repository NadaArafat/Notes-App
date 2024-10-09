import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/add_note/add_note_cubit.dart';
import 'package:notes/models/note_model.dart';

import '../constants.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key, this.isLoading = false});

  final bool isLoading;

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

final GlobalKey<FormState> formKey = GlobalKey<FormState>();
AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

String? title, content;

class _AddNoteFormState extends State<AddNoteForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children: [
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            hint: "Title",
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onSaved: (value) {
              content = value;
            },
            hint: "Content",
            maxLines: 6,
          ),
          const SizedBox(
            height: 16,
          ),
          const ColorListView(),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            width: double.infinity,
            child: BlocBuilder<AddNoteCubit, AddNoteState>(
                builder: (context, state) {
              return CustomButton(
                  isLoading: state is AddNoteLoading ? true : false);
            }),
          ),
        ],
      ),
    );
  }
}

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});

  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: isActive
          ? CircleAvatar(
              radius: 34,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                backgroundColor: color,
                radius: 28,
              ),
            )
          : CircleAvatar(
              backgroundColor: color,
              radius: 34,
            ),
    );
  }
}

class ColorListView extends StatefulWidget {
  const ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int currentIndex = 0;
  List<Color> colors = const [
    Color(0xffbdede0),
    Color(0xffbad3db),
    Color(0xffb6b8d6),
    Color(0xff7e78d2),
    Color(0xff6f58c9),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              currentIndex = index;
              BlocProvider.of<AddNoteCubit>(context).color = colors[index];
              setState(() {

              });
            },
            child: ColorItem(
              isActive: currentIndex == index, color: colors[index],
            ),
          );
        },
        itemCount: colors.length,
      ),
    );
  }
}
