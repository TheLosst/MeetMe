import 'package:flutter/material.dart';
import 'package:meet_me/Utils/pink_button.dart';
import 'package:meet_me/Utils/globals.dart';
import '../Utils/horizontal_divider.dart';

class WhatSizeAreYouLookingFor extends StatelessWidget {
  const WhatSizeAreYouLookingFor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MeetMe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WhatSizeAreYouLookingForPage(),
    );
  }
}

class WhatSizeAreYouLookingForPage extends StatefulWidget {
  const WhatSizeAreYouLookingForPage({Key? key}) : super(key: key);

  @override
  State<WhatSizeAreYouLookingForPage> createState() => _WhatIsYourPurposeOfDatingState();
}

class _WhatIsYourPurposeOfDatingState extends State<WhatSizeAreYouLookingForPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromRGBO(255, 64, 144, 1), Colors.black])),
        child: Center(
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
            height: 544 / MediaQuery.of(context).devicePixelRatio,
            child: Column(
              children: [
                const HorizontalDivider(height: 40),
                Center(
                  child: Text(
                    chooseSex + defaultText[3],
                    style: const TextStyle(fontSize: 40,),
                    textAlign: TextAlign.center,
                  ),
                ),
                const HorizontalDivider(height: 55),
                ButtonPink(text: peopleHeight[0],width: 373,height: 59),
                const HorizontalDivider(height: 30),
                ButtonPink(text: peopleHeight[1],width: 373,height: 59),
                const HorizontalDivider(height: 30),
                ButtonPink(text: peopleHeight[2],width: 373,height: 59),
                const HorizontalDivider(height: 30),
                ButtonPink(text: peopleHeight[3],width: 373,height: 59),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


