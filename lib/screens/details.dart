import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin {
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: Center(
        child: SizedBox(
          height: 200,
          width: 250,
          child: RotationTransition(
            turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
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
      ),
    );
  }
}
