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
        color: Colors.transparent,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset("assets/splash.jpg",fit: BoxFit.fill,),
                  Transform.translate(offset: Offset(20, 650),
                  child: Text("Discover",style: TextStyle(color: Colors.white,fontSize: 40),)),
                  Transform.translate(offset: Offset(20, 700),
                      child: Text("The",style: TextStyle(color: Colors.white,fontSize: 40),)),
                  Transform.translate(offset: Offset(100, 710),
                      child: Text("Universe",style: TextStyle(color: Color(0xff1686b4),fontSize: 30,fontWeight: FontWeight.bold,fontFamily: "f1"),)),
                ],
              ),
            ],
          ),
        ),
      )

    );
  }
}
