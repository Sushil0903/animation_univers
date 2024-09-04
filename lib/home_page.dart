import 'dart:math';

import 'package:animation_univers/util.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation degree = Tween(
    begin: 0.0,
    end: 2 * pi,
  ).animate(
    CurvedAnimation(
      parent: animationController,
      curve: Curves.linear,
    ),
  );

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );
    animationController.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black54,
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset("assets/bg.jpg",fit: BoxFit.cover,),),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(color: Color(0xff052031),borderRadius: BorderRadius.circular(13)),
                        height: 60,
                        width: 60,
                        child: Icon(
                          Icons.abc,
                          size: 50,
                          color: Color(0xff106791),
                        ),
                      ),
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(color: Color(0xff052031),borderRadius: BorderRadius.circular(13)),
                        height: 60,
                        width: 60,
                        child: Icon(
                          Icons.search_off,
                          size: 40,
                          color: Color(0xff106791),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "welcome!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w100,
                        fontFamily: "f1",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Flexible(
                  child: CardSwiper(
                    cardBuilder: (context, index, horizontalOffsetPercentage,
                        verticalOffsetPercentage) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "detail_page",arguments: index);
                        },
                        child: Container(
                          height: 380,
                          width: 347,
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff106791), width: 1),
                              color: Color(0xff052031),
                              borderRadius: BorderRadius.circular(40)),
                          child: Column(
                            children: [
                              Transform.translate(
                                offset: Offset(70, -50),
                                child: Align(
                                  child: Container(
                                      height: 320,
                                      width: 320,
                                      child: AnimatedBuilder(
                                        animation: animationController,
                                        builder:
                                            (BuildContext context, Widget? child) {
                                          return Transform.rotate(
                                            angle: degree.value,
                                            child: Image.network(
                                              planets[index]["img"],
                                              fit: BoxFit.cover,
                                            ),
                                          );
                                        },
                                      )),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    planets[index]["name"],
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.white,
                                        fontFamily: "f1"),
                                  ),
                                  Icon(
                                    Icons.chevron_right,
                                    color: Colors.white,
                                    size: 35,
                                  )
                                ],
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      );
                    },
                    cardsCount: planets.length,
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 20,),
                    Text("astronomical news",style: TextStyle(color: Colors.white,fontFamily: "f1"),),
                  ],
                ),
                SizedBox(height: 8,),
                Container(
                  decoration: BoxDecoration(color: Color(0xff052031),borderRadius: BorderRadius.circular(22)),
                  height: 150,width: 380,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 5,top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("How human picks \nout constellations",style: TextStyle(color: Colors.white,fontSize: 18),),
                      SizedBox(height: 7,),
                      Text("Global warming is the long-term warming of the planet's overall temperature. Though this warming trend has been going on for a long time, its pace has significantly increased in the last hundred years due to the burning",style: TextStyle(color: Colors.grey),)
                    ],
                  ),
                ),
                ),
                SizedBox(height: 10,)

              ],
            ),
          ],
        ),
      ),
    );
  }
}

/*

   children: [


            Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: planets.length,
                    itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Align(
                        child: Container(
                          height: 350,
                          width: 300,
                          decoration: BoxDecoration(color: Color(0xff052031),borderRadius: BorderRadius.circular(40)),
                      ),
                      ),
                    );
                  },),
                )
              ],
            ),
            Transform.translate(
              offset: Offset(20, 610),
              child: Row(
                children: [
                  Text("astronomical news",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),)
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15,left: 15,bottom: 20),
                  child: Container(
                    height: 135,
                    width: 380,
                    decoration: BoxDecoration(color: Color(0xff052031),borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("How humans pick",style: TextStyle(color: Colors.white,fontSize: 20),),
                          Text("Out constellation",style: TextStyle(color: Colors.white,fontSize: 20),),
                          Text("${"heloo"*30}",style: TextStyle(color: Colors.white,),),

                      ],),
                    ),
                  ),
                ),
              ],),
            )

          ],
    */
