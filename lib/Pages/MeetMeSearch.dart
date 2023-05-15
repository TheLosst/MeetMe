import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

import '../Utils/MyChatBubles.dart';
import '../Utils/Push.dart';
import '../Utils/globals.dart';
import 'ItemsToBuild/NewContatsWidget.dart';
import 'ItemsToBuild/SearchCardMeetMe.dart';
import 'MeetMeChat.dart';
import 'MeetMeEvents.dart';
import 'MeetMeProfile.dart';
import 'MeetMeSlidePeople.dart';

class MeetMeSearch extends StatelessWidget {
  const MeetMeSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MeetMe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MeetMeSearchPage(),
    );
  }
}

class MeetMeSearchPage extends StatefulWidget {
  const MeetMeSearchPage({Key? key}) : super(key: key);

  @override
  State<MeetMeSearchPage> createState() => _MeetMeSearchPageState();
}

class _MeetMeSearchPageState extends State<MeetMeSearchPage> {
  @override
  Widget build(BuildContext context) {
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
          SizedBox(
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {
                  Push().PushTo(MeetMeSearchPage(), context);
                },
                icon: Image.asset("lib/Icons/search 1.png",
                    color: Colors.black,
                    width: 30 / MediaQuery.of(context).devicePixelRatio,
                    height: 32 / MediaQuery.of(context).devicePixelRatio),
                label: Text(
                  "Поиск",
                  style: TextStyle(color: Colors.black),
                )),
          ),
          SizedBox(width: MediaQuery.of(context).size.height * 0.17),
          SizedBox(
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {
                  Push().PushTo(MeetMeEvents(), context);
                },
                icon: Image.asset("lib/Icons/bell 1.png",
                    color: Colors.black,
                    width: 30 / MediaQuery.of(context).devicePixelRatio,
                    height: 32 / MediaQuery.of(context).devicePixelRatio),
                label: Text(
                  "События",
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
        child: FittedBox(
          fit: BoxFit.contain,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 51, top: 57),
                child: Container(
                  width: 504,
                  height: 59,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 225, 238, 1),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      border: Border.all(color: Colors.white, width: 1),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, 1))
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 83,
                          height: 39,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "Все",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w300),
                            ),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateColor.resolveWith(
                                    (states) =>
                                        Color.fromRGBO(225, 182, 200, 1)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ))),
                          )),
                      SizedBox(width: 37, height: 1),
                      Container(
                          width: 135,
                          height: 39,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "Онлайн",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w300),
                            ),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateColor.resolveWith(
                                    (states) =>
                                        Color.fromRGBO(225, 182, 200, 1)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ))),
                          )),
                      SizedBox(width: 37, height: 1),
                      Container(
                          width: 195,
                          height: 39,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "Избранные",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w300),
                            ),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateColor.resolveWith(
                                    (states) =>
                                        Color.fromRGBO(225, 182, 200, 1)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ))),
                          )),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 51, top: 146),
                child: Text(
                  "Новые контакты: ",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 51, top: 203),
                  child: Container(
                    width: 515,
                    height: 800,
                    child: ListView.builder(
                        itemCount: 2,
                        itemBuilder: (BuildContext context, int index) =>
                            NewContactWidget(
                                user,
                                context,
                                Color.fromRGBO(255, 239, 246, 1),
                                "Fuck Me",
                                "Курсед")),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 1078, top: 143),
                child: Column(
                  children: [
                    Container(
                      width: 1000,
                      height: 1200,
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 400,
                                  childAspectRatio: 2 / 3,
                                  crossAxisSpacing: 80,
                                  mainAxisSpacing: 119),
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) =>
                              SearchCardMeetMe(context, "Курсед","Ебать в очко")),
                    ),
                    SizedBox(
                      width: 1100,
                      height: 1,
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


