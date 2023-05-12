import 'dart:core';

class User
{
  late bool sex = false;
  late int withMeets = 0;
  late int targetMeet= 0;
  late int targetHeight= 0;
  late int targetFat= 0;
  late String name = "test";
  late String birthDay = "test";
  late String email = "test";
  late String password = "test";

  User();
  void getAll()
  {
    print(sex);
    print(withMeets);
    print(targetMeet);
    print(targetHeight);
    print(targetFat);
    print(name);
    print(birthDay);
    print(email);
    print(password);
  }


}
