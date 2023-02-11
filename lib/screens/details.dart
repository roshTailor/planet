import 'package:flutter/material.dart';
import 'package:planet/util/Variable.dart';

import 'package:flutter/scheduler.dart' show timeDilation;

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
    timeDilation = 5;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Planet Details"),
      ),
      body: Stack(
        children: [
          Image.network(
            "https://wallpaperaccess.com/full/1683478.jpg",
            fit: BoxFit.cover,
            height: height,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 300,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[Color(0x00736AB7), Color(0xFF736AB7)],
                  stops: [0.0, 0.9],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(0.0, 1.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Overview",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Distance : \n${Variable.planets[index]['distance']}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "Gravity : \n${Variable.planets[index]['gravity']}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height / 25,
                    ),
                    Text(
                      "Description : \n${Variable.planets[index]['description']}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          RotationTransition(
            turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
            child: Hero(
                tag: "planet",
                child: Container(
                  height: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Variable.planets[index]['imageFile']),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
