import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int animationDur = 1;
  List<int> durations = [3, 1, 5, 2, 8, 3, 6, 2];
  int addOne = 0;
  int addTwo = 0;

  bool state = true;
  Random rand = Random();
  @override
  void initState() {
    Timer.periodic(Duration(seconds: animationDur + 2), (timer) {
      setState(() {
        animationDur = durations[rand.nextInt(durations.length)];
        addOne = animationDur + durations[rand.nextInt(durations.length)];
        addTwo = animationDur + durations[rand.nextInt(durations.length)];
        state = !state;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    TextTheme style = Theme.of(context).textTheme;

    const Color iconColor = Colors.deepPurple;
    return Scaffold(
      body: Container(
        height: _size.height,
        width: _size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromRGBO(149, 0, 240, 1),
          Color.fromRGBO(76, 0, 123, 1)
        ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
        child: Stack(
          children: [
            AnimatedPositioned(
              curve: Curves.easeInOutSine,
              duration: Duration(seconds: animationDur + addTwo),
              top: _size.height * (state ? 0.1 : 0.2),
              left: _size.width * 0.12,
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(254, 254, 255, 0.62),
                    borderRadius: BorderRadius.circular(50)),
              ),
            ),
            AnimatedPositioned(
              curve: Curves.easeInOutSine,
              duration: Duration(seconds: animationDur),
              bottom: _size.height * (state ? 0 : 0.1),
              right: _size.width * 0.15,
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(254, 254, 255, 0.62),
                    borderRadius: BorderRadius.circular(50)),
              ),
            ),
            AnimatedPositioned(
              curve: Curves.easeInOutSine,
              duration: Duration(seconds: animationDur + addOne),
              top: _size.height * (state ? 0.1 : 0.2),
              right: _size.width * 0.10,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(254, 254, 255, 0.62),
                    borderRadius: BorderRadius.circular(100)),
              ),
            ),
            AnimatedPositioned(
              curve: Curves.easeInOutSine,
              bottom: _size.height * (state ? 0.15 : 0.16),
              left: _size.width * (state ? 0.15 : 0.151),
              duration: Duration(seconds: animationDur + addTwo),
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(254, 254, 255, 0.62),
                    borderRadius: BorderRadius.circular(50)),
              ),
            ),
            Center(
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    height: _size.height * 0.65,
                    width: _size.width * 0.65,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(255, 154, 154, 0.68),
                              Color.fromRGBO(255, 255, 255, 0.5)
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          margin: EdgeInsets.only(
                            top: 5,
                            left: 52,
                          ),
                          height: _size.height * 0.57,
                          width: _size.width * 0.18,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.white.withOpacity(0.09),
                                    Color.fromRGBO(255, 255, 255, 0.76)
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight)),
                          child: Container(
                            padding:
                                EdgeInsets.only(top: 20, left: 10, right: 10),
                            height: _size.height * 0.57,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Aloysious Benoy",
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "developer | gamer",
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 25),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.work_outline_rounded,
                                          color: iconColor,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          "Flutter",
                                          style: style.subtitle2,
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 15),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.work_outline_rounded,
                                          color: iconColor,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          "Node.js",
                                          style: style.subtitle2,
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 15),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.work_outline_rounded,
                                          color: iconColor,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          "Python",
                                          style: style.subtitle2,
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 15),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.work_outline_rounded,
                                          color: iconColor,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          "Bare metal",
                                          style: style.subtitle2,
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 15),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.work_outline_rounded,
                                          color: iconColor,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          "Arduino, RPi",
                                          style: style.subtitle2,
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(child: Center(child: BioContent()))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BioContent extends StatefulWidget {
  const BioContent({Key? key}) : super(key: key);

  @override
  _BioContentState createState() => _BioContentState();
}

class _BioContentState extends State<BioContent> {
  String _text = "H";
  final String finalText = "Hello World,\nI am Aloysious";
  int _count = 1;
  bool showContent = false;
  bool showIcons = false;
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      if (_count >= finalText.length) {
        setState(() {
          showContent = true;
        });
        Timer(Duration(milliseconds: 500), () {
          setState(() {
            showIcons = true;
          });
        });
        timer.cancel();
      } else {
        _text = "$_text${finalText[_count]}";
        _count += 1;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedSwitcher(
            duration: Duration(seconds: 1),
            child: Text(
              "$_text",
              key: showContent ? UniqueKey() : Key("text"),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          SizedBox(height: 25),
          AnimatedSwitcher(
            duration: Duration(milliseconds: 2000),
            child: !showContent
                ? Container()
                : Text(
                    "I make and debug apps at TATOS Technologies.\n I love to dip my fingers in all tech stuff. Talk to me about anything tech and I'm all ears.",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(color: Colors.white),
                  ),
          ),
          SizedBox(height: 30),
          AnimatedSwitcher(
            duration: Duration(seconds: 1),
            child: showIcons
                ? Container(
                    width: 400,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            iconSize: 32,
                            onPressed: () {
                              launch("https://github.com/aloysiousBenoy");
                            },
                            icon: Image.asset(
                              "assets/github.png",
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Image.asset("assets/insta.png")),
                        IconButton(
                            onPressed: () {
                              launch(
                                  "https://www.linkedin.com/in/aloysiousbenoy/");
                            },
                            icon: Image.asset("assets/linkedin.png"))
                      ],
                    ),
                  )
                : Container(),
          )
        ],
      ),
    );
  }
}
