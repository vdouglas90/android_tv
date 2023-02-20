import 'dart:ui';

import 'package:android_tv/aux/video_player.dart';
import 'package:android_tv/model/movie.dart';
import 'package:flutter/material.dart';

class DetailsMovie extends StatelessWidget {
  const DetailsMovie(this.movie);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),

      body:  Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.dstATop),
            fit: BoxFit.fill,
            image: NetworkImage(movie.image),
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2,sigmaY: 2),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: Stack(
                children: [
                  Positioned.fill(
                    left: 200,
                    child: Hero(
                      tag: movie.image,
                      child: Image.network(movie.image),
                    ),
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width*.05,
                    bottom: 0,
                    child: TweenAnimationBuilder<double>(
                      tween: Tween(begin: 1,end: 0),
                      duration: Duration(seconds: 2),
                      child: Container(
                        width: 300,
                        child: Text("${movie.description}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              shadows: [
                                BoxShadow(
                                  color: Colors.black45,
                                  blurRadius: 10,
                                  spreadRadius: 20,
                                )
                              ]
                          ),
                        ),
                      ),
                      builder: (context,value,child){
                        return Transform.translate(
                          offset: Offset(-100*value,240 * value),
                          child: child,
                        );
                      },
                    ),
                  ),


                  Positioned(
                    top: 200,
                    left: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap:(){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VideoPlayer(
                                      url: movie.url,
                                    )));
                  },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 13, left: 8, top: 2, bottom: 2),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.play_arrow,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Play",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),

                        SizedBox(width: 20,),
                        Column(
                          children: [
                            Icon(
                              Icons.add,
                              size: 25,color: Colors.white,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "My List",
                              style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white,),
                            )
                          ],
                        ),

                        SizedBox(width: 20,),
                        Column(
                          children: [
                            Icon(
                              Icons.info_outline,
                              size: 25,color: Colors.white,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Info",
                              style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white,),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

          ],
    ),
        ),
      ),
    );

  }

}
