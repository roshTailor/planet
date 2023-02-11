import 'package:flutter/material.dart';

Widget _buildHero(BuildContext context, String imageName, String description,AnimationController controller) {
  return SizedBox(
    width: 80,
    height: 80,
    child: Hero(
      createRectTween: (Rect? begin, Rect? end) {
        return MaterialRectCenterArcTween(begin: begin, end: end);
      },
      tag: imageName,
      child: ClipOval(
        child: Center(
          child: SizedBox(
            width: 60,
            height: 60,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder<void>(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return AnimatedBuilder(
                          animation: animation,
                          builder: (context, child) {
                            return Opacity(
                              opacity: const Interval(0.0, 0.75, curve: Curves.fastOutSlowIn).transform(animation.value),
                              child: Container(
                                color: Theme.of(context).canvasColor,
                                child: Center(
                                  child: Card(
                                    elevation: 8.0,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                          width: 250,
                                          height: 250,
                                          child: Hero(
                                            createRectTween: (Rect? begin, Rect? end) {
                                              return MaterialRectCenterArcTween(begin: begin, end: end);
                                            },
                                            tag: imageName,
                                            child: ClipOval(
                                              child: Center(
                                                child: SizedBox(
                                                  width: 60,
                                                  height: 60,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: ClipRect(
                                                      child: Image.network(imageName),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          description,
                                          style: const TextStyle(fontWeight: FontWeight.bold),
                                          textScaleFactor: 3.0,
                                        ),
                                        const SizedBox(height: 16.0),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                  ),
                );
              },
              child: Container(
                height: 200,
                width: 200,
                alignment: FractionalOffset.centerLeft,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child:  RotationTransition(
                  turns: Tween(begin: 0.0, end: 1.0).animate(controller),
                  child: Hero(
                    tag: "planet",
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(imageName),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}