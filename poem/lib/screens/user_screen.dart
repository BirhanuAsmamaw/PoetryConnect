import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:poem/screens/about.dart';
import 'package:poem/screens/contacts.dart';
import 'package:poem/screens/welcome_page.dart';

import 'favorites.dart';
import 'poem_page.dart';

class UserApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
        ),
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      home: const UserScreen(),
      routes: {
        '/contact': (context) => const Contact(),
        '/about': (context) => const About(),
        '/welcome': (context) => const Welcome(),
      },
    );
  }
}

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  File? _image;
  File? pickedImage;
  String email = 'adeyeshi@gmail.com';
  late final Function(int) onDelete;
  late final Function(int) onFavorite;
  final ImagePicker imagePicker = ImagePicker();

  List<Poem> poems = [
    Poem(
        title: 'Poem 1',
        author: 'Author 1',
        genre: 'narrative',
        content: 'Content 1'),
    Poem(
        title: 'Poem 2',
        author: 'Author 2',
        genre: 'lyric',
        content: 'Content 2'),
    Poem(
        title: 'Poem 3',
        author: 'Author 3',
        genre: 'dramatic',
        content: 'Content 3'),
  ];
  List<Poem> favoritePoems = [];

  Future _getImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  void deletePoem(int index) {
    setState(() {
      poems.removeAt(index);
    });
  }

  List<Poem> _filteredPoems = [];
  void searchByTitle(String query) {
    setState(() {
      _filteredPoems = poems
          .where(
              (poem) => poem.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void addToFavorites(int index) {
    setState(() {
      final poem = poems[index];
      if (favoritePoems.contains(poem)) {
        favoritePoems.remove(poem);
      } else {
        favoritePoems.add(poem);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu),
          );
        }),
        title: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[300],
            hintText: 'Search by title...',
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              // Border
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          ),
          onChanged: searchByTitle,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/welcome');
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 111, 191, 215),
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            UserAccountsDrawerHeader(
              decoration:
                  const BoxDecoration(color: Color.fromARGB(255, 127, 16, 196)),
              accountName: const Text('Aderajew Yeshi'),
              accountEmail: Text(email),
              currentAccountPicture: GestureDetector(
                onTap: _getImage,
                child: CircleAvatar(
                  backgroundImage:
                      _image != null ? Image.file(_image!).image : null,
                  child: _image == null ? const Icon(Icons.add_a_photo) : null,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.info,
              ),
              title: const Text('About us'),
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.contact_mail,
              ),
              title: const Text('Contact us'),
              onTap: () {
                Navigator.pushNamed(context, '/contact');
              },
            ),
          ],
        ),
      ),
      body: PoemListScreen(
        poems: _filteredPoems.isNotEmpty ? _filteredPoems : poems,
        onDelete: deletePoem,
        onFavorite: addToFavorites,
        favoritePoems: favoritePoems,
      ),
      bottomNavigationBar: buildBottomNavigationBar(context),
    );
  }

  BottomNavigationBar buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Poems',
            backgroundColor: Colors.blueGrey),
        BottomNavigationBarItem(
            backgroundColor: Colors.red,
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            label: 'My Favorites')
      ],
      onTap: (index) {
        if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    MyFavoritesScreen(favoritePoems: favoritePoems)),
          );
        }
      },
    );
  }
}
