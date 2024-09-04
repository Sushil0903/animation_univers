import 'dart:math';

import 'package:animation_univers/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation sizeAnim =
      Tween(begin: 0.0, end: 2 * pi).animate(CurvedAnimation(
    parent: controller,
    curve: Curves.linear,
  ));

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 10));
    controller.repeat();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int id = ModalRoute.of(context)?.settings.arguments as int;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "home_page");
                },
                child: Container(decoration: BoxDecoration(color: Color(0xff052031),borderRadius: BorderRadius.circular(13)),height: 60,width: 60,child: Icon(Icons.keyboard_arrow_left,color: Color(0xff106791),size: 35,),)),
          ),
          title: Text("Overview",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: "f1"),),
          centerTitle: true,
          flexibleSpace: Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/bg.jpg"),fit: BoxFit.cover)),),
          bottom: TabBar(
            unselectedLabelColor: Colors.white70,
                    dividerColor: Colors.transparent,
              labelColor: Color(0xff1686b4),
              indicatorColor: Color(0xff1686b4),
              tabs: [
                Tab(
                  text: "360",
                ),
                Tab(
                  text: "Description",
                )
              ]),
        ),
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset("assets/bg.jpg",fit: BoxFit.cover,),),
            TabBarView(
              children: [
                // 360
                Container(
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        SizedBox(height: 30,),
                        TweenAnimationBuilder(
                          tween: Tween<double>(begin: 0,end: 400),
                          duration: Duration(seconds: 1),
                          builder: (context,val,_) {
                            return SizedBox(
                              height: val,
                              child: AnimatedBuilder(
                                  animation: controller,
                              builder: (context,val,) {
                                return Transform.rotate(
                                    angle: sizeAnim.value,
                                child: Image.network(planets[id]["img"]));
                              }));
                          },
                        ),
                        SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text(planets[id]["name"],style: TextStyle(color: Colors.white,fontFamily: "f1",fontSize: 33),)],),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(left: 55,right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("size*",style: TextStyle(color: Color(0xff1686b4),fontSize: 18),),
                              Text("distance from sun",style: TextStyle(color: Color(0xff1686b4),fontSize: 18),)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40,right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("D=${planets[id]['d']} Km",style: TextStyle(color: Colors.white,fontSize: 18),),
                              Text("${planets[id]['ds']} Km",style: TextStyle(color: Colors.white,fontSize: 18),)
                            ],
                          ),
                        ),

                        SizedBox(height: 40,),
                      ],
                    ),),

                // Description
                Container(
                  color: Colors.transparent,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      TweenAnimationBuilder(
                            tween: Tween<double>(begin: 400,end: 300),
                            duration: Duration(seconds: 1),
                            builder: (context,val,_) {
                              return SizedBox(
                                  height: val,
                                  child: AnimatedBuilder(
                                      animation: controller,
                                      builder: (context,val,) {
                                        return Transform.rotate(
                                            angle: sizeAnim.value,
                                            child: Image.network(planets[id]["img"]));
                                      }));
                            },
                          ),
                      SizedBox(height: 20,),
                      Container(
                        width: 350,
                        decoration: BoxDecoration(color: Color(0xff052031),borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TweenAnimationBuilder(
                            tween: Tween<double>(begin: 150,end: 0),
                            duration: Duration(seconds: 1),
                            builder: (context,val,_) => Transform.translate(
                                offset: Offset(0, val),
                            child: Text("${planets[id]['des']}",style: TextStyle(color: Colors.white,fontSize: 17),textAlign: TextAlign.justify,)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}
