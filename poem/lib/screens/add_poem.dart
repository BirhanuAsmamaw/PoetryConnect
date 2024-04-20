import 'package:flutter/material.dart';

import '../widgets/mixin/validator.dart';

class AddPoemDialog extends StatefulWidget {
  final Function(String, String, String, String) onSave;

  const AddPoemDialog({Key? key, required this.onSave}) : super(key: key);

  @override
  AddPoemDialogState createState() => AddPoemDialogState();
}

class AddPoemDialogState extends State<AddPoemDialog> with ValidationMixin {
  String title = '';
  String author = '';
  String content = '';
  String genre = '';
  String? titleError;
  String? contentError;
  String? genreError;
  String? authorError;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Add New Poem',
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Title',
                hintText: 'Title here ...',
                hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
                labelStyle:
                    TextStyle(color: titleError != null ? Colors.red : null),
                errorText: titleError,
              ),
              onChanged: (value) {
                setState(() {
                  title = value;
                  titleError = titleValidation(value);
                });
              },
            ),
            const SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Author',
                hintText: 'Author name ...',
                hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
                labelStyle:
                    TextStyle(color: authorError != null ? Colors.red : null),
                errorText: authorError,
              ),
              onChanged: (value) {
                setState(() {
                  author = value;
                  authorError = authorValidation(value);
                });
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Genre',
                labelStyle:
                    TextStyle(color: genreError != null ? Colors.red : null),
                hintText: 'narrative, dramatic, lyric',
                hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
                errorText: genreError,
              ),
              onChanged: (value) {
                setState(() {
                  genre = value;
                  genreError = genreValidation(value);
                });
              },
              validator: genreValidation,
            ),
            const SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Content',
                hintText: 'Your poem please ...',
                hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
                labelStyle: TextStyle(
                    color: contentError != null
                        ? Colors.red
                        : null), // Change label color to red if there's an error
                errorText: contentError,
              ),
              onChanged: (value) {
                setState(() {
                  content = value;
                  contentError = peomValidation(value);
                });
              },
              maxLines: null,
              validator: peomValidation, // Apply poem content validation
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 1,
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          onPressed: () {
            if (title.isNotEmpty &&
                author.isNotEmpty &&
                genre.isNotEmpty &&
                content.isNotEmpty) {
              widget.onSave(title, author, genre, content);
              Navigator.of(context).pop();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('Please fix the validation errors')),
              );
            }
          },
          child: const Text(
            'Save',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ),
      ],
    );
  }
}
