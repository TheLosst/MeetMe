import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meet_me/Utils/globals.dart';

import '../../Utils/horizontal_divider.dart';

class MyCard extends StatelessWidget {
  const MyCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.525,
        height: MediaQuery.of(context).size.height * 0.65,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 225, 238, 1),
          borderRadius: BorderRadius.all(Radius.circular(40)),
          border: Border.all(color: Colors.white, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 1,
              offset: Offset(1, 1), // Shadow position
            ),
          ],
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.525,
          height: MediaQuery.of(context).size.height * 0.65,
          child: Row(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(
                    left: 10 / MediaQuery.of(context).devicePixelRatio),
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width * 0.23,
                decoration: BoxDecoration(),
                child: Center(
                    child: Image.network(
                      "lib/Temp/CardSlidePhotoTemp.png",
                      width: MediaQuery.of(context).size.width * 0.23,
                      height: MediaQuery.of(context).size.height * 0.6,
                    )),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.29,
                child: Center(
                  child: Container(
                    //color: Colors.black,
                    width: MediaQuery.of(context).size.width * 0.24,
                    height: MediaQuery.of(context).size.width * 0.37,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              "Райан, 42",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 40),
                            )),
                        FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              "Из Москвы, 1 км от вас",
                              softWrap: true,
                              style: TextStyle(
                                  fontSize: 24, color: Colors.black45),
                            )),
                        HorizontalDivider(height: 60),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.37,
                            height:
                            MediaQuery.of(context).size.width * 0.075,
                            child: Text( //TODO сделать скалирование
                              "Цель знакомств: дружба, общение, переписка, отношения, флирт",
                              softWrap: true,
                              style: TextStyle(fontSize: 32),
                            ),
                          ),
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.37,
                            height:
                            MediaQuery.of(context).size.width * 0.075,
                            child: Text( //TODO сделать скалирование
                              "Теги: путешествовать, вкусная еда, активность",
                              style: TextStyle(fontSize: 32),
                            ),
                          ),
                        ),
                        HorizontalDivider(height: 16),
                        FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Container(
                              width:
                              MediaQuery.of(context).size.width * 0.37,
                              height:
                              MediaQuery.of(context).size.width * 0.075,
                              child: Text(//TODO сделать скалирование
                                "Образование: cornwall collegiate & vocational school",
                                style: TextStyle(fontSize: 32),
                              ),
                            )),
                        HorizontalDivider(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 70 /
                                  MediaQuery.of(context).devicePixelRatio,
                              height: 70 /
                                  MediaQuery.of(context).devicePixelRatio,
                              child: IconButton(
                                  onPressed: () {
                                    matchEngine.currentItem?.nope();
                                    print("</3");
                                  },
                                  icon: Image.asset(
                                    "lib/Icons/broken-heart 1.png",
                                  )),
                            ),
                            SizedBox(
                              width: 101 /
                                  MediaQuery.of(context).devicePixelRatio,
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: SizedBox(
                                width: 70 /
                                    MediaQuery.of(context).devicePixelRatio,
                                height: 70 /
                                    MediaQuery.of(context).devicePixelRatio,
                                child: IconButton(
                                    onPressed: () {
                                      matchEngine.currentItem?.like();
                                      print("<3");
                                    },
                                    icon: Image.asset(
                                        "lib/Icons/heart colored.png")),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}