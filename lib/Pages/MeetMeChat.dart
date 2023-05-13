import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:chat_bubbles/bubbles/bubble_special_two.dart';
import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meet_me/Pages/ItemsToBuild/NewContatsWidget.dart';
import 'package:meet_me/Utils/MeetMeMessageBar.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

import '../AppBars/meetme_appbar.dart';
import '../Utils/MyChatBubles.dart';
import '../Utils/Push.dart';
import '../Utils/User.dart';
import '../Utils/globals.dart';
import 'Profile.dart';
import 'Slide_me_page.dart';

class MeetMeChat extends StatelessWidget {
  const MeetMeChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MeetMe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MeetMeChatPage(),
    );
  }
}

class MeetMeChatPage extends StatefulWidget {
  const MeetMeChatPage({Key? key}) : super(key: key);

  @override
  State<MeetMeChatPage> createState() => _MeetMeChatPageState();
}

class _MeetMeChatPageState extends State<MeetMeChatPage> {
  ScrollController _chatScroll = ScrollController();

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
                onPressed: () {},
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
                onPressed: () {},
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
                                    (states) => Color.fromRGBO(225, 182, 200, 1)),
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
                                    (states) => Color.fromRGBO(225, 182, 200, 1)),
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
                                    (states) => Color.fromRGBO(225, 182, 200, 1)),
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
                            NewContactWidget(user, context,
                                Color.fromRGBO(255, 239, 246, 1), "Fuck Me", "Курсед")),
                  )),
              Padding(
                padding: EdgeInsets.only(left: 619, top: 98),
                child: Container(
                  height: 824,
                  width: 1100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    border: Border.all(color: Colors.white, width: 1),
                    color: Color.fromRGBO(255, 239, 246, 1),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top: 22, left: 36),
                          child: SizedBox(
                            width: 1028,
                            child: NewContactWidget(
                                user,
                                context,
                                Color.fromRGBO(232, 189, 208, 1),
                                "100 см от сладкой жопы", "Курсед"),
                          )),
                      Padding(
                        padding: EdgeInsets.only(top: 170, left: 64),
                        child: Container(
                          width: 970,
                          height: 575,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 239, 246, 1),
                            //border: Border(bottom: BorderSide(width: 1, color: Colors.white)),
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                          child: ListView.builder(
                            controller: _chatScroll,
                            itemCount: kekv.length,
                            itemBuilder: (BuildContext context, int index) =>
                                MeetMeBubble(
                              text: 'Привет крошка;))) Сколько птс?',
                              color: Color.fromRGBO(237, 212, 223, 1),
                              seen: true,
                              tail: false,
                              isSender: kekv[index],
                              nameSender: 'Курсед',
                            ),
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: MeetMeMessageBar(
                              sendButtonColor: Color.fromRGBO(232, 189, 208, 1),
                              messageBarColor: Colors.transparent,
                              onSend: (_) => print(_),
                              actions: [
                                Padding(
                                  padding: EdgeInsets.only(left: 27),
                                  child: InkWell(
                                    child: Image.network("lib/Temp/ImageSendButtonImg.png"),
                                    onTap: () {},
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 27, right: 27),
                                  child: InkWell(
                                    child: Image.network("lib/Temp/Smile.png"),
                                    onTap: () {},
                                  ),
                                ),
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
