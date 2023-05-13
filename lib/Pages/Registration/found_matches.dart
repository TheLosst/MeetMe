import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meet_me/Utils/pink_button.dart';
import 'package:meet_me/Utils/globals.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import '../../Utils/Push.dart';
import '../../Utils/horizontal_divider.dart';
import '../MeetMeSlidePeople.dart';

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
              width: 595 / MediaQuery.of(context).devicePixelRatio,
              height: 358 / MediaQuery.of(context).devicePixelRatio,
              child: Column(
                children: [
                  const HorizontalDivider(height: 50),
                  Center(
                    child: Text(
                      "${defaultText[7]} $matchNumber $chooseSex",
                      style: const TextStyle(fontSize: 40),
                    ),
                  ),
                  const HorizontalDivider(height: 40),
                  Center(
                    child: SizedBox(
                      width: 356 / MediaQuery.of(context).devicePixelRatio,
                      height: 75 / MediaQuery.of(context).devicePixelRatio,
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
                  const HorizontalDivider(height: 50),
                  ButtonPink(
                    text: registerMail[0],
                    width: 350,
                    height: 59,
                    getSexed: () {
                      user.email = emailInputController.text;
                      user.getAll();
                      Push().PushTo(SlideMe(), context);
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
