import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.delayed(
      Duration(seconds: 4),
          () {
        Navigator.pushReplacementNamed(context, "home_page");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          child:Stack(
            children: [
              Image.asset("assets/splash.jpg",fit: BoxFit.cover,),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 200,
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      Text("Discover",style: TextStyle(color: Colors.white,fontSize: 30,letterSpacing: 5),),
                      Text("The Universe",style: TextStyle(color: Colors.white,fontSize: 30,letterSpacing: 5),),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
