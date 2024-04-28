import 'package:flutter/material.dart';
import 'poem_page.dart';

class MyFavoritesScreen extends StatelessWidget {
  final List<Poem> favoritePoems;
  const MyFavoritesScreen({super.key, required this.favoritePoems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorite Poems'),
      ),
      body: ListView.builder(
        itemCount: favoritePoems.length,
        itemBuilder: (context, index) {
          final poem = favoritePoems[index];
          return ListTile(
            leading: Text('${index + 1}'),
            title: Text(poem.title),
            subtitle: Text(poem.author),
            onTap: () {
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
      ),
      bottomNavigationBar: buildBottomNavigationBar(context),
    );
  }

  BottomNavigationBar buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Poems'),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite), label: 'My Favorite')
      ],
      onTap: (index) {
        if (index == 0) {
          Navigator.pop(context); // Return to the previous screen
        }
      },
    );
  }
}
