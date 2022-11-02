import 'package:animations/hero/detail_page.dart';
import 'package:flutter/material.dart';

import 'model.dart';

class HeroScreen extends StatefulWidget {
  const HeroScreen({Key? key}) : super(key: key);

  @override
  State<HeroScreen> createState() => _HeroScreenState();
}

class _HeroScreenState extends State<HeroScreen> {
  List<Character> characters = [];

  @override
  void initState() {
    super.initState();
    characters.add(Character(
        image: 'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
        name: 'Rick Sanchez'));
    characters.add(Character(
        image: 'https://rickandmortyapi.com/api/character/avatar/2.jpeg',
        name: 'Morty Smith'));
    characters.add(Character(
        image: 'https://rickandmortyapi.com/api/character/avatar/3.jpeg',
        name: 'Summer Smith'));
    characters.add(Character(
        image: 'https://rickandmortyapi.com/api/character/avatar/4.jpeg',
        name: 'Beth Smith'));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: GridView.builder(
              itemCount: characters.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
              itemBuilder: (context, index) {
                Character character = characters[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HeroDetailPage(
                                  image: character.image!,
                                  name: character.name,
                                )));
                  },
                  child: Hero(
                    transitionOnUserGestures: true,
                    tag: character.name!,
                    child: Image.network(character.image!),
                  ),
                );
              })),
    );
  }
}
