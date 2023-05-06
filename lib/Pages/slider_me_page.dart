import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

import '../AppBars/meetme_appbar.dart';
import '../Utils/horizontal_divider.dart';

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
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
        title: SizedBox(width: 267 / MediaQuery.of(context).devicePixelRatio, height: 105 / MediaQuery.of(context).devicePixelRatio, child: IconButton(icon: SvgPicture.asset("lib/Svg/MeetMe.svg"), onPressed: (){},)),
        gradient:
            LinearGradient(colors: [Colors.white, Colors.white]),
        actions: [
          SizedBox(
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {},
                icon: Image.asset("lib/Icons/heart 1.png", color: Colors.black, width: 30 / MediaQuery.of(context).devicePixelRatio, height: 32 / MediaQuery.of(context).devicePixelRatio),
                label: Text("Знакомства", style: TextStyle(color: Colors.black),)),
          ),

          SizedBox(width: MediaQuery.of(context).size.height * 0.02),

          SizedBox(
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {},
                icon: Image.asset("lib/Icons/search 1.png", color: Colors.black, width: 30 / MediaQuery.of(context).devicePixelRatio, height: 32 / MediaQuery.of(context).devicePixelRatio),
                label: Text("Поиск", style: TextStyle(color: Colors.black),)),
          ),

          SizedBox(width: MediaQuery.of(context).size.height * 0.17),

          SizedBox(
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {},
                icon: Image.asset("lib/Icons/bell 1.png", color: Colors.black, width: 30 / MediaQuery.of(context).devicePixelRatio, height: 32 / MediaQuery.of(context).devicePixelRatio),
                label: Text("События", style: TextStyle(color: Colors.black),)),
          ),

          SizedBox(width: MediaQuery.of(context).size.height * 0.02),

          SizedBox(
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {},
                icon: Image.asset("lib/Icons/conversation 1.png", color: Colors.black, width: 30 / MediaQuery.of(context).devicePixelRatio, height: 32 / MediaQuery.of(context).devicePixelRatio),
                label: Text("Сообщения", style: TextStyle(color: Colors.black),)),
          ),

          SizedBox(width: MediaQuery.of(context).size.height * 0.02),

          SizedBox(
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {},
                icon: Image.asset("lib/Icons/user 1.png", color: Colors.black, width: 30 / MediaQuery.of(context).devicePixelRatio, height: 32 / MediaQuery.of(context).devicePixelRatio),
                label: Text("Профиль", style: TextStyle(color: Colors.black),)),
          ),



        ],
      ),
      body: Container(),
    );
  }
}
