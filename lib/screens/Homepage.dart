import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.network(
              "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/b1997507-606b-44bc-a6c8-dd0740cb1f88/d41a0ml-4cc369c9-a067-4f5a-8176-06364ee21c94.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2IxOTk3NTA3LTYwNmItNDRiYy1hNmM4LWRkMDc0MGNiMWY4OFwvZDQxYTBtbC00Y2MzNjljOS1hMDY3LTRmNWEtODE3Ni0wNjM2NGVlMjFjOTQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.VrUSbI6icdGBJggdVLB7Ch7Wta8Zw_FUYxE6U0V6QqU",
              fit: BoxFit.fitHeight,
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context,'details');
              },
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  height: 100,
                  width: 200,
                  color: Colors.white,
                  child: const Hero(
                    tag: "Hero effect",
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
