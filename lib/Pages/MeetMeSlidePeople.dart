import 'dart:convert';
import 'dart:math';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meet_me/Pages/MeetMeChat.dart';
import 'package:meet_me/Pages/MeetMeProfile.dart';
import 'package:meet_me/Utils/User.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:http/http.dart' as http;

import '../AppBars/meetme_appbar.dart';
import '../Utils/Push.dart';
import '../Utils/globals.dart';
import '../Utils/horizontal_divider.dart';
import 'MeetMeEvents.dart';
import 'ItemsToBuild/MyCard.dart';
import 'MeetMeSearch.dart';
import 'Registration/who_do_you_want_to_meet.dart';

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
  int amountOfCards = usersSwipeListData.length;

  void shuffle<T>(List<T> list) {
    for (var i = list.length - 1; i > 0; i--) {
      var j = Random().nextInt(i + 1);
      var temp = list[i];
      list[i] = list[j];
      list[j] = temp;
    }
  }


  Future<List<User>> createUsers() async {
    //List<DiskProp> test = await fetchDiskDescr();
    usersSwipeListData = await fetchAllUsers();
    for (int i = 0; i < amountOfCards; i++) {
      _swipeItems.add(SwipeItem(
        content: MyCard(user: usersSwipeListData.elementAt(i)),
        superlikeAction: () {
          messageTo = usersSwipeListData.elementAt(i);
          Push().PushTo(MeetMeChat(), context);
        },
        likeAction: () {
          print("LIKE");
          //if(userLoggined.liked)
          userLoggined.liked +=
              ",${usersSwipeListData.elementAt(i).id.toString()}";
          print(userLoggined.liked);
        },
        nopeAction: () {
          print("FUCK");
        },
      ));
    }
    amountOfCards = usersSwipeListData.length;
    return usersSwipeListData;
  }

  Future<List<User>> fetchAllUsers() async {
    final response = await http
        .get(Uri.parse('$connIp/api/users/getall/${userLoggined.id}'));
    if (response.statusCode == 200) {
      var userList = json.decode(response.body).map<User>(User.fromJson).toList();
      // Shuffle the user list using the Fisher-Yates shuffle algorithm
      shuffle(userList);
      return userList;
    } else {
      throw Exception('Все сломалось!');
    }
  }

  @override
  void initState() {
    //print(cock[0].aboutUser);

    matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    matchEngine = MatchEngine(swipeItems: _swipeItems);

    return Scaffold(
      appBar: NewGradientAppBar(
        title: SizedBox(
            width: 267 / MediaQuery.of(context).devicePixelRatio,
            height: 105 / MediaQuery.of(context).devicePixelRatio,
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
                    width: 30 / MediaQuery.of(context).devicePixelRatio,
                    height: 32 / MediaQuery.of(context).devicePixelRatio),
                label: Text(
                  "Знакомства",
                  style: TextStyle(color: Colors.black),
                )),
          ),
          SizedBox(width: MediaQuery.of(context).size.height * 0.02),
          // SizedBox(
          //   child: ElevatedButton.icon(
          //       style: ElevatedButton.styleFrom(
          //         primary: Colors.transparent,
          //         shadowColor: Colors.transparent,
          //       ),
          //       onPressed: () {
          //         Push().PushTo(MeetMeSearchPage(), context);
          //       },
          //       icon: Image.asset("lib/Icons/search 1.png",
          //           color: Colors.black,
          //           width: 30 / MediaQuery.of(context).devicePixelRatio,
          //           height: 32 / MediaQuery.of(context).devicePixelRatio),
          //       label: Text(
          //         "Избранное",
          //         style: TextStyle(color: Colors.black),
          //       )),
          // ),
          SizedBox(width: MediaQuery.of(context).size.height * 0.17),
          // SizedBox(
          //   child: ElevatedButton.icon(
          //       style: ElevatedButton.styleFrom(
          //         primary: Colors.transparent,
          //         shadowColor: Colors.transparent,
          //       ),
          //       onPressed: () {
          //         Push().PushTo(MeetMeEvents(), context);
          //       },
          //       icon: Image.asset("lib/Icons/bell 1.png",
          //           color: Colors.black,
          //           width: 30 / MediaQuery.of(context).devicePixelRatio,
          //           height: 32 / MediaQuery.of(context).devicePixelRatio),
          //       label: Text(
          //         "События",
          //         style: TextStyle(color: Colors.black),
          //       )),
          // ),
          SizedBox(width: MediaQuery.of(context).size.height * 0.02),
          SizedBox(
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {
                  Push().PushTo(MeetMeChat(), context);
                },
                icon: Image.asset("lib/Icons/conversation 1.png",
                    color: Colors.black,
                    width: 30 / MediaQuery.of(context).devicePixelRatio,
                    height: 32 / MediaQuery.of(context).devicePixelRatio),
                label: Text(
                  "Сообщения",
                  style: TextStyle(color: Colors.black),
                )),
          ),
          SizedBox(width: MediaQuery.of(context).size.height * 0.02),
          SizedBox(
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {
                  Push().PushTo(Profile(), context);
                },
                icon: Image.asset("lib/Icons/user 1.png",
                    color: Colors.black,
                    width: 30 / MediaQuery.of(context).devicePixelRatio,
                    height: 32 / MediaQuery.of(context).devicePixelRatio),
                label: Text(
                  "Профиль",
                  style: TextStyle(color: Colors.black),
                )),
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder<List<User>>(
            future: createUsers(),
            builder:
                (BuildContext context, AsyncSnapshot<List<User>?> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return SwipeCards(
                  matchEngine: matchEngine,
                  itemBuilder: (BuildContext context, int index) {
                    return _swipeItems[index]
                        .content; // TODO MyCard(name: _swipeItems[index].content.name)
                  },
                  onStackFinished: () {},
                  fillSpace: false,
                );
              } else {
                return Center(
                  child: CollectionSlideTransition(
                    children: const <Widget>[
                      Icon(Icons.accessible),
                      Icon(Icons.arrow_right_alt),
                      Icon(Icons.accessible_forward_sharp),
                    ],
                  ),
                );
              }
            }),
      ),
    );
  }
}
