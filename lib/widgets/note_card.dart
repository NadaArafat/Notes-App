import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      width: double.infinity,
      //height: 200,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListTile(
            title: const Text(
              "Flutter tips",
              style: TextStyle(color: Colors.black, fontSize: 32),
            ),
            subtitle: const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                "lmkmkokon nkpokeoklm ;kdoedodcn;pkpkodo dlojfo",
                style: TextStyle(color: Colors.black, fontSize: 20),
                maxLines: 2,
              ),
            ),
            trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete,
                  size: 40,
                  color: Colors.black,
                )),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Text(
              "May 21, 2024",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}