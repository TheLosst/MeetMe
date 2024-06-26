import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meet_me/Pages/MeetMeProfile.dart';
import 'package:meet_me/Utils/pink_button.dart';
import 'package:meet_me/Utils/globals.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import '../../Utils/Push.dart';
import '../../Utils/User.dart';
import '../../Utils/horizontal_divider.dart';
import '../MeetMeSlidePeople.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:crypto/crypto.dart';

import 'login_page.dart';



class FoundMatches extends StatelessWidget {
  const FoundMatches({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MeetMe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FoundMatchesPage(title: 'MeetMe'),
    );
  }
}

class FoundMatchesPage extends StatefulWidget {
  const FoundMatchesPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<FoundMatchesPage> createState() => _FoundMatchesPageState();
}

class _FoundMatchesPageState extends State<FoundMatchesPage> {
  get cursorColor => cursorColor(const Color(0x00000000));

  final TextEditingController emailInputController = TextEditingController();
  final TextEditingController passwordInputController = TextEditingController();

  register(User user1) async {
    var apiUrl = "$connIp/api/users/register";
    String securePassword = md5.convert(utf8.encode(user1.password)).toString();
    final body = {
      "sex": user1.sex,
      "username": user1.username,
      "password": securePassword,
      "email": user1.email,
      "withMeets": user1.withMeets.toString(),
      "targetMeet": user1.targetMeet.toString(),
      "targetHeight": user1.targetHeight.toString(),
      "targetFat": user1.targetFat.toString(),
      "birthDay": user1.birthDay,
      "liked": user1.liked,
      "aboutUser": user1.aboutUser
    };
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
    print("aaaaaaaaaaaaaa \n\n${response.body}\n\n aaaaaaaaaaaa");
    var data = json.decode(response.body);
    if(response.statusCode == 201){
      showDialog(
          context: context,
          builder: (BuildContext) {
            return AlertDialog(
              content: Text(json.decode(response.body).toString()),
              title: Text("Успешная регистрация"),
            );
          });
      Push().PushTo(Login(), context);
    } else {
      showDialog(
          context: context,
          builder: (BuildContext) {
            return AlertDialog(
              content: Text(json.decode(response.body).toString()),
              title: Text("Ошибка"),
            );
          });
    }
  }
  @override
  Widget build(BuildContext context1) {
    return Scaffold(
      appBar: NewGradientAppBar(
        title: SizedBox(
            width: 267 / MediaQuery.of(context).devicePixelRatio,
            height: 105 / MediaQuery.of(context).devicePixelRatio,
            child: IconButton(
              icon: SvgPicture.asset("lib/Svg/MeetMe white.svg"),
              onPressed: () {},
            )),
        gradient: LinearGradient(colors: [
          Color.fromRGBO(255, 64, 144, 1),
          Color.fromRGBO(255, 64, 144, 1)
        ]),
        elevation: 0,
      ),
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromRGBO(255, 64, 144, 1), Colors.black])),
        child: Center(
          child: FittedBox(
            fit: BoxFit.contain,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3))
                  ]),
              width: 595,
              height: 358,
              child: Column(
                children: [
                  const HorizontalDivider(height: 50),
                  Center(
                    child: Text(
                     matchNumber%2 != 0 ? "${defaultText[7]} $matchNumber $chooseSex" : "${defaultText[7]} $matchNumber $chooseSex",
                      style: const TextStyle(fontSize: 40),
                    ),
                  ),
                  const HorizontalDivider(height: 40),
                  Center(
                    child: SizedBox(
                      width: 356,
                      height: 75,
                      child: TextFormField(
                        controller: emailInputController,
                        maxLength: 32,
                        decoration: InputDecoration(
                          //prefixIcon: Icon(Icons.account_box),
                          //border: OutlineInputBorder(),
                          hintText: registerMail[2],
                        ),
                        validator: (String? input) {
                          return (input != null) ? 'Login incorrect' : null;
                        },
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: 356,
                      height: 75,
                      child: TextFormField(
                        controller: passwordInputController,
                        maxLength: 32,
                        decoration: InputDecoration(
                          //prefixIcon: Icon(Icons.account_box),
                          //border: OutlineInputBorder(),
                          hintText: "Ведите пароль",
                        ),
                        validator: (String? input) {
                          return (input != null) ? 'password incorrect' : null;
                        },
                      ),
                    ),
                  ),
                  ButtonPink(
                    text: registerMail[0],
                    width: 350,
                    height: 59,
                    getSexed: () {
                      user.email = emailInputController.text;
                      user.password = passwordInputController.text;
                      //User test = User();
                      register(user);
                      //user.getAll();
                      //Push().PushTo(SlideMe(), context);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
