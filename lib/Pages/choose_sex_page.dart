

import 'package:flutter/material.dart';
import 'package:meet_me/Utils/pink_button.dart';
import 'package:meet_me/Utils/globals.dart';
import '../Utils/horizontal_divider.dart';


class ChooseSex extends StatelessWidget {
  const ChooseSex({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MeetMe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ChooseSexPage(title: 'MeetMe'),
    );
  }
}

class ChooseSexPage extends StatefulWidget {
  const ChooseSexPage({Key? key, required this.title}) : super(key: key);

  final String title;


  @override
  State<ChooseSexPage> createState() => _ChooseSexPageState();
}

class _ChooseSexPageState extends State<ChooseSexPage> {
  get cursorColor => cursorColor(const Color(0x00000000));

  @override
  Widget build(BuildContext context1) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
              width: 595 / MediaQuery.of(context).devicePixelRatio,
              height: 358 / MediaQuery.of(context).devicePixelRatio,
              child: Column(
                children: [
                  HorizontalDivider(height: 40 / MediaQuery.of(context).devicePixelRatio),
                  Center(
                    child: Text(
                      defaultText[0],
                      style: const TextStyle(fontSize: 40),
                    ),
                  ),
                  HorizontalDivider(height: 80 / MediaQuery.of(context).devicePixelRatio),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ButtonPink(text: sex[0], width: 183, height: 59,),
                        SizedBox(
                          width: 75 / MediaQuery.of(context).devicePixelRatio,
                          height: 0,
                        ),
                        ButtonPink(text: sex[1], width: 183, height: 59,)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


