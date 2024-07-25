import 'package:animation_univers/util.dart';
import 'package:flutter/material.dart';

import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  late AnimationController controller;
  late Animation sizeAnim = Tween(begin: 0.0, end: 20.0).animate(CurvedAnimation(
    parent: controller,
    curve: Interval(0, 0.1),
  ));
  @override
  void initState() {
      controller=AnimationController(vsync: this,duration: Duration(seconds: 10));
      controller.repeat();

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset("assets/bg.jpg",fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    color: Color(0xff052031),
                    child: Icon(Icons.abc,size: 50,color: Color(0xff106791),),
                  ),
                  Spacer(),
                  Container(
                    height: 60,
                    width: 60,
                    color: Color(0xff052031),
                    child: Icon(Icons.search_off,size: 40,color: Color(0xff106791),),
                  ),
                ],
              ),
            ),
            Transform.translate(
              offset: Offset(20, 100),
              child: Row(
                children: [
                  Text("Welcome",style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),)
                ],
              ),
            ),
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
                          child: Transform.translate(
                            offset: Offset(60, -80),
                            child: Align(
                              child: Column(
                                children: [
                                  Container(
                                      height: 280,
                                      width: 280,
                                      color: Colors.transparent,
                                      child: AnimatedBuilder(
                                        animation: controller,
                                        builder: (BuildContext context, Widget? child) {
                                          return Transform.rotate(angle: sizeAnim.value,
                                        child: Image.asset(planets[index]["img"],fit: BoxFit.cover));
                                        },
                                      ),
                                  ),
                                  Container(
                                    width: 280,
                                    child: Transform.translate(
                                      offset: Offset(-40, 60),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(context, "detail_page",arguments: index);
                                        },
                                        child: Row(
                                          children: [
                                          InkWell(
                                              onTap: () {
                                                Navigator.pushNamed(context, "detail_page",arguments: index);
                                              },
                                              child: Text(planets[index]["name"],style: TextStyle(color: Colors.white,fontSize: 40),)),
                                          SizedBox(width: 100,),
                                          Icon(Icons.chevron_right,size: 40,color: Color(0xff106791),)
                                        ],),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ),
                      ),
                    );
                  },),
                )
              ],
            ),
          ],
        ),
      )
    );
  }
}
