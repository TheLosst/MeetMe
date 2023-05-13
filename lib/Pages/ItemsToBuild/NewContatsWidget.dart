import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Utils/User.dart';

Widget NewContactWidget(User? user, context, var color, String text, String name) {
  return Card(
    color: color,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        side: BorderSide(color: Colors.white, width: 1)),
    child: Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 0, top: 0),
          child: Image.network("lib/Temp/Cursed.png"),
        ),
        Padding(
          padding: EdgeInsets.only(left: 110, top: 11),
          child: Text(
            name,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(left: 110, top: 49),
            child: Text(text,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400)))
      ],
    ),
  );
}
