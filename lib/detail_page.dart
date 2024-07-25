import 'package:animation_univers/util.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin{
  late AnimationController controller;
  late Animation sizeAnim = Tween(begin: 0.0, end: 5.0).animate(CurvedAnimation(
    parent: controller,
    curve: Interval(0, 0.1),
  ));
  @override
  void initState() {
    controller=AnimationController(vsync: this,duration: Duration(seconds: 1));
    controller.repeat();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int id = ModalRoute.of(context)?.settings.arguments as int;
    return SafeArea(
      child: Scaffold(
        body: Container(
            height: double.infinity,
            width: double.infinity,
            child: Stack(
              children: [
                Image.asset("assets/bg.jpg",fit: BoxFit.cover),
                Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.transparent,
                  child: Center(child: Text("Overview",style: TextStyle(color: Colors.white,fontSize: 20),)),
                ),
                Center(
                  child: Container(
                    height: 350,
                    width: 350,
                    color: Colors.transparent,
                    child: AnimatedBuilder(
                      animation: controller,
                      builder: (BuildContext context, Widget? child) {
                        return Transform.rotate(angle: sizeAnim.value,
                      child: Image.asset(planets[id]["img"],fit: BoxFit.cover,));
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 200,
                    width: 450,
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(planets[id]["des"],style: TextStyle(color: Colors.white,fontSize: 18),),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
