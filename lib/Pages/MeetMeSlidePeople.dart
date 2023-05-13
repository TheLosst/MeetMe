import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meet_me/Pages/MeetMeChat.dart';
import 'package:meet_me/Pages/MeetMeProfile.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:swipe_cards/swipe_cards.dart';

import '../AppBars/meetme_appbar.dart';
import '../Utils/Push.dart';
import '../Utils/globals.dart';
import '../Utils/horizontal_divider.dart';
import 'MeetMeEvents.dart';
import 'ItemsToBuild/MyCard.dart';
import 'MeetMeSearch.dart';
import 'Registration/who_do_you_want_to_meet.dart';
class Content {
  final String text;
  final Color color;

  Content({required this.text, required this.color});
}
class SlideMe extends StatelessWidget {
  const SlideMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MeetMe',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SlideMePage());
  }
}

class SlideMePage extends StatefulWidget {
  const SlideMePage({Key? key}) : super(key: key);

  @override
  State<SlideMePage> createState() => _SlideMePageState();
}



class _SlideMePageState extends State<SlideMePage> {
  List<SwipeItem> _swipeItems = <SwipeItem>[];

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  int amountOfCards = 500;


  @override
  void initState() {
    for (int i = 0; i < amountOfCards; i++) {
      _swipeItems.add(SwipeItem(
        content: MyCard(),
        likeAction: () {print("LIKE");},
        nopeAction: () {print("FUCK");},
      ));
    }
    matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    matchEngine = MatchEngine(swipeItems: _swipeItems);
    return Scaffold(
      appBar: NewGradientAppBar(
        title: SizedBox(
            width: 267 / MediaQuery
                .of(context)
                .devicePixelRatio,
            height: 105 / MediaQuery
                .of(context)
                .devicePixelRatio,
            child: IconButton(
              icon: SvgPicture.asset("lib/Svg/MeetMe.svg"),
              onPressed: () {},
            )),
        gradient: LinearGradient(colors: [Colors.white, Colors.white]),
        actions: [
          SizedBox(
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {
                  Push().PushTo(SlideMe(), context);
                },
                icon: Image.asset("lib/Icons/heart 1.png",
                    color: Colors.black,
                    width: 30 / MediaQuery
                        .of(context)
                        .devicePixelRatio,
                    height: 32 / MediaQuery
                        .of(context)
                        .devicePixelRatio),
                label: Text(
                  "Знакомства",
                  style: TextStyle(color: Colors.black),
                )),
          ),
          SizedBox(width: MediaQuery
              .of(context)
              .size
              .height * 0.02),
          SizedBox(

            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {Push().PushTo(MeetMeSearchPage(), context);},
                icon: Image.asset("lib/Icons/search 1.png",
                    color: Colors.black,
                    width: 30 / MediaQuery
                        .of(context)
                        .devicePixelRatio,
                    height: 32 / MediaQuery
                        .of(context)
                        .devicePixelRatio),
                label: Text(
                  "Поиск",
                  style: TextStyle(color: Colors.black),
                )),
          ),
          SizedBox(width: MediaQuery
              .of(context)
              .size
              .height * 0.17),
          SizedBox(
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {Push().PushTo(MeetMeEvents(), context);},
                icon: Image.asset("lib/Icons/bell 1.png",
                    color: Colors.black,
                    width: 30 / MediaQuery
                        .of(context)
                        .devicePixelRatio,
                    height: 32 / MediaQuery
                        .of(context)
                        .devicePixelRatio),
                label: Text(
                  "События",
                  style: TextStyle(color: Colors.black),
                )),
          ),
          SizedBox(width: MediaQuery
              .of(context)
              .size
              .height * 0.02),
          SizedBox(
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {Push().PushTo(MeetMeChat(), context);},
                icon: Image.asset("lib/Icons/conversation 1.png",
                    color: Colors.black,
                    width: 30 / MediaQuery
                        .of(context)
                        .devicePixelRatio,
                    height: 32 / MediaQuery
                        .of(context)
                        .devicePixelRatio),
                label: Text(
                  "Сообщения",
                  style: TextStyle(color: Colors.black),
                )),
          ),
          SizedBox(width: MediaQuery
              .of(context)
              .size
              .height * 0.02),
          SizedBox(
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {Push().PushTo(Profile(), context);},
                icon: Image.asset("lib/Icons/user 1.png",
                    color: Colors.black,
                    width: 30 / MediaQuery
                        .of(context)
                        .devicePixelRatio,
                    height: 32 / MediaQuery
                        .of(context)
                        .devicePixelRatio),
                label: Text(
                  "Профиль",
                  style: TextStyle(color: Colors.black),
                )),
          ),
        ],
      ),
      body: Center(
          child: Container(

            child: SwipeCards(
              matchEngine: matchEngine,
              itemBuilder: (BuildContext context, int index) {
                return _swipeItems[index].content; // TODO MyCard(name: _swipeItems[index].content.name)
              },
              onStackFinished: () {},
              fillSpace: false,
            ),
          ),
        ),
    );
  }
}
