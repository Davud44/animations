import 'package:flutter/material.dart';

class HeroDetailPage extends StatelessWidget {
  const HeroDetailPage({Key? key, this.name, this.image}) : super(key: key);
  final String? name;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          textDirection: TextDirection.ltr,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              transitionOnUserGestures: true,
              tag: name!,
              child: Image.network(
                image!,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              name!,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
