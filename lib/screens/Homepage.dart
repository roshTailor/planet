import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../util/Variable.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    );
    super.initState();
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Planets"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                "https://cdnb.artstation.com/p/assets/images/images/006/272/147/large/jack-oldham-mountain-galaxy-background-1.jpg?1497300224",
              ),
              fit: BoxFit.fitHeight),
        ),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            StaggeredGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              children: Variable.planets
                  .map((e) => StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: e['height'],
                      child: Stack(
                        children: [
                          BounceInRight(
                            duration: const Duration(seconds: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF333366),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF8433BC),
                                    Color(0xFF010D41),
                                  ],
                                  begin: FractionalOffset(0, 0),
                                  end: FractionalOffset(1.8, 0),
                                  stops: [0, 0.5],
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex:3,
                                    child: BounceInLeft(
                                      duration: const Duration(seconds: 8),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(context, 'details',
                                              arguments: Variable.planets.indexOf(e));
                                        },
                                        child: RotationTransition(
                                          turns: Tween(begin: 0.0, end: 1.0)
                                              .animate(_controller),
                                          child: Hero(
                                              tag: "planet",
                                              child: Container(
                                                height: 170,
                                                //width: 200,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            e['imageFile']))),
                                              )),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex:1,
                                    child: Container(
                                      width: _width,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        e['planetName'],
                                        style: const TextStyle(
                                            color: Colors.deepPurple,fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
