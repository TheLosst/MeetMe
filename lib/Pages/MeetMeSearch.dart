import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../Utils/ListMessages.dart';
import '../Utils/MessagesClass.dart';
import '../Utils/MyChatBubles.dart';
import '../Utils/Push.dart';
import '../Utils/User.dart';
import '../Utils/globals.dart';
import 'ItemsToBuild/NewContatsWidget.dart';
import 'ItemsToBuild/SearchCardMeetMe.dart';
import 'MeetMeChat.dart';
import 'MeetMeEvents.dart';
import 'MeetMeProfile.dart';
import 'MeetMeSlidePeople.dart';
import 'package:http/http.dart' as http;

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

Future<void> createUsers() async {
  //List<DiskProp> test = await fetchDiskDescr();
  usersSwipeListData = await fetchAllUsers();
}


Future<List<User>> fetchAllUsers() async {
  final response =
  await http.get(Uri.parse('$connIp/GetListUsersMeetMe.php'));
  if (response.statusCode == 200) {
    var buff = json.decode(response.body);
    print(buff);
    return buff.map<User>(User.fromJson).toList();
  } else {
    throw Exception('Все сломалось!');
  }
}
Future<List<ListMessages>> getListSendedUsers() async{
  final response = await http.post(Uri.parse('$connIp/getUserIDToSended.php'),
      body: {"id": userLoggined.id.toString(),
      });
  print(json.decode(response.body));
  return json.decode(response.body).map<ListMessages>(ListMessages.fromJson).toList();
}

Future<List<ListMessages>> buildListMess() async{
  toUsers = await getListSendedUsers();
  print("toUsers");
  print(toUsers.length);
  print("toUsers");
  return toUsers;
}

class MeetMeSearchPage extends StatefulWidget {
  const MeetMeSearchPage({Key? key}) : super(key: key);

  @override
  State<MeetMeSearchPage> createState() => _MeetMeSearchPageState();
}

class _MeetMeSearchPageState extends State<MeetMeSearchPage> {

  @override
  Widget build(BuildContext context) {
    ScrollController _chatScroll = ScrollController();
    createUsers();
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
                  "Избранное",
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
                    child: FutureBuilder<List<ListMessages>>(
                      future: buildListMess(),
                      builder: (BuildContext context, AsyncSnapshot<List<ListMessages>?> snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return ListView.builder(
                              itemCount: toUsers.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  NewContactWidget(
                                      user,
                                      context,
                                      Color.fromRGBO(255, 239, 246, 1),
                                      usersSwipeListData.elementAt(searchUsers(int.parse(toUsers.elementAt(index).id))).targetMeet,
                                      usersSwipeListData.elementAt(searchUsers(int.parse(toUsers.elementAt(index).id))).username,
                                      usersSwipeListData.elementAt(searchUsers(int.parse(toUsers.elementAt(index).id))).linkToIMG,
                                      true, searchUsers(int.parse(toUsers.elementAt(index).id)))
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
                      },
                    ),
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


