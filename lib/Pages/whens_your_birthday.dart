import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meet_me/Utils/pink_button.dart';
import 'package:meet_me/Utils/globals.dart';
import '../Utils/horizontal_divider.dart';

class WhensYourBirthday extends StatelessWidget {
  const WhensYourBirthday({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MeetMe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WhensYourBirthdayPage(title: 'MeetMe'),
    );
  }
}

class WhensYourBirthdayPage extends StatefulWidget {
  const WhensYourBirthdayPage({Key? key, required this.title})
      : super(key: key);

  final String title;

  @override
  State<WhensYourBirthdayPage> createState() => _WhensYourBirthdayPageState();
}

class _WhensYourBirthdayPageState extends State<WhensYourBirthdayPage> {
  get cursorColor => cursorColor(const Color(0x00000000));

  final TextEditingController dayInputController = TextEditingController();
  final TextEditingController monthInputController = TextEditingController();
  final TextEditingController yearInputController = TextEditingController();

  @override
  Widget build(BuildContext context1) {
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
            height: 358 / MediaQuery.of(context).devicePixelRatio,
            child: Column(
              children: [
                const HorizontalDivider(height: 50),
                Center(
                  child: Text(
                    defaultText[6],
                    style: const TextStyle(fontSize: 40),
                  ),
                ),
                const HorizontalDivider(height: 60),
                Center(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 80 / MediaQuery.of(context).devicePixelRatio,
                        height: 0 / MediaQuery.of(context).devicePixelRatio,
                      ),
                      Center(
                        child: SizedBox(
                          width: 107 / MediaQuery.of(context).devicePixelRatio,
                          height: 59 / MediaQuery.of(context).devicePixelRatio,
                          child: TextFormField(
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            keyboardType: TextInputType.number,
                            controller: dayInputController,
                            maxLength: 2,
                            decoration: InputDecoration(
                                //prefixIcon: Icon(Icons.account_box),
                                //border: OutlineInputBorder(),
                                hintText: birthday[0]),
                            validator: (String? input) {
                              return (input != null) ? 'Login incorrect' : null;
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 53 / MediaQuery.of(context).devicePixelRatio,
                        height: 0 / MediaQuery.of(context).devicePixelRatio,
                      ),
                      Center(
                        child: SizedBox(
                          width: 107 / MediaQuery.of(context).devicePixelRatio,
                          height: 59 / MediaQuery.of(context).devicePixelRatio,
                          child: TextFormField(
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            keyboardType: TextInputType.number,
                            controller: monthInputController,
                            maxLength: 2,
                            decoration: InputDecoration(
                                //prefixIcon: Icon(Icons.account_box),
                                //border: OutlineInputBorder(),
                                hintText: birthday[1]),
                            validator: (String? input) {
                              return (input != null) ? 'Login incorrect' : null;
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 53 / MediaQuery.of(context).devicePixelRatio,
                        height: 0 / MediaQuery.of(context).devicePixelRatio,
                      ),
                      Center(
                        child: SizedBox(
                          width: 107 / MediaQuery.of(context).devicePixelRatio,
                          height: 59 / MediaQuery.of(context).devicePixelRatio,
                          child: TextFormField(
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            keyboardType: TextInputType.number,
                            controller: yearInputController,
                            maxLength: 4,
                            decoration: InputDecoration(
                                //prefixIcon: Icon(Icons.account_box),
                                //border: OutlineInputBorder(),
                                hintText: birthday[2],

                            ),
                            validator: (String? input) {
                              return (input != null) ? 'Login incorrect' : null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const HorizontalDivider(height: 50),
                const ButtonPink(
                  text: next,
                  width: 183,
                  height: 59,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
