import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

import '../util/Variable.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                "https://cdnb.artstation.com/p/assets/images/images/006/272/147/large/jack-oldham-mountain-galaxy-background-1.jpg?1497300224",
              ),
              fit: BoxFit.fitHeight),
        ),
        child: ListView.builder(
            itemCount: Variable.planets.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: _height / 10,
                  width: _width,
                  child: Stack(
                    children: [
                      Container(
                        height: 160,
                        margin: const EdgeInsets.only(left: 46),
                        decoration: BoxDecoration(
                          color: const Color(0xFF333366),
                          shape: BoxShape.rectangle,
                          gradient: const LinearGradient(
                              colors: [
                                Color(0xFF8433BC),
                                Color(0xFF010D41),
                              ],
                              begin: FractionalOffset(0, 0),
                              end: FractionalOffset(1.8, 0),
                              stops: [0, 0.5],
                              tileMode: TileMode.clamp),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: const Alignment(-0.5, -0.5),
                        child: Text(
                          "${Variable.planets[index]['planetName']}",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, 'details', arguments: index);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 16),
                          alignment: FractionalOffset.centerLeft,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: const Hero(
                            tag: "planet",
                            child: Image(
                              image: AssetImage("asset/image/planetBg.jpg"),
                            ),
                          ),
                        ),
                      ),
                      // Container(
                      //   height: 200,
                      //   width: 400,
                      //   alignment: FractionalOffset.center,
                      //   padding: const EdgeInsets.all(15),
                      //   decoration: BoxDecoration(
                      //     //color: Colors.indigoAccent,
                      //     borderRadius: BorderRadius.circular(15),
                      //   ),
                      //   child: Text(
                      //     "${Variable.planets[index]['planetName']}",
                      //     style: const TextStyle(color: Colors.white),
                      //   ),
                      // ),
                      // ModelViewer(
                      //   src: '${Variable.planets[index]['objectFile']}',
                      //   ar: true,
                      //   autoRotate: true,
                      //   cameraControls: true,
                      //   disablePan: false,
                      // ),
                    ],
                  ),
                ),
              );
            }),
        // child: Stack(
        //   children: [
        //     Image.network(
        //       "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/b1997507-606b-44bc-a6c8-dd0740cb1f88/d41a0ml-4cc369c9-a067-4f5a-8176-06364ee21c94.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2IxOTk3NTA3LTYwNmItNDRiYy1hNmM4LWRkMDc0MGNiMWY4OFwvZDQxYTBtbC00Y2MzNjljOS1hMDY3LTRmNWEtODE3Ni0wNjM2NGVlMjFjOTQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.VrUSbI6icdGBJggdVLB7Ch7Wta8Zw_FUYxE6U0V6QqU",
        //       fit: BoxFit.fitHeight,
        //     ),
        //     GestureDetector(
        //       onTap: (){
        //         Navigator.pushNamed(context,'details');
        //       },
        //       child: Align(
        //         alignment: Alignment.bottomLeft,
        //         child: Container(
        //           height: 100,
        //           width: 200,
        //           color: Colors.white,
        //           child: const Hero(
        //             tag: "Hero effect",
        //             child: CircleAvatar(
        //               backgroundImage: NetworkImage(
        //                 "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        //     )
        //   ],
        // ),
      ),
    );
  }
}
