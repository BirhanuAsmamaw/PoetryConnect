import 'package:flutter/material.dart';

class PoemListScreen extends StatefulWidget {
  final List<Poem> poems;
  final Function(int) onDelete;
  final Function(int) onFavorite;
  final List<Poem> favoritePoems;

  const PoemListScreen({
    super.key,
    required this.poems,
    required this.onDelete,
    required this.onFavorite,
    required this.favoritePoems,
  });
  @override
  State<StatefulWidget> createState() {
    return _PoemListScreenState();
  }
}

class _PoemListScreenState extends State<PoemListScreen> {
  bool isFavorite(Poem poem) {
    return widget.favoritePoems.contains(poem);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.poems.length,
      itemBuilder: (context, index) {
        final poem = widget.poems[index];
        return ListTile(
          leading: Text('${index + 1}'), // Leading number
          title: Text(poem.title), // Title of the poem
          subtitle: Text(poem.author), // Author of the poem
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  widget.onDelete(index);
                },
              ),
              IconButton(
                icon: Icon(
                  isFavorite(poem) ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite(poem) ? Colors.yellow : Colors.black,
                ),
                onPressed: () {
                  widget.onFavorite(index);
                },
              ),
            ],
          ),
          onTap: () {
            // Navigate to another screen to show full content body
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PoemDetailScreen(
                  poem: poem,
                  filteredPoems: [],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class Poem {
  final String title;
  final String author;
  final String genre;
  final String content;

  Poem(
      {required this.title,
      required this.author,
      required this.content,
      required this.genre});
}

class PoemDetailScreen extends StatelessWidget {
  final Poem poem;

  const PoemDetailScreen(
      {super.key, required this.poem, required List filteredPoems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(poem.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Author:   ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(poem.author),
                const SizedBox(
                  width: 30,
                ),
                const Text(
                  'Genre:   ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(poem.genre),
              ],
            ),
            const SizedBox(height: 18.0),
            Text(poem.content),
          ],
        ),
      ),
    );
  }
}
