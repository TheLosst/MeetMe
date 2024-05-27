class User {
  // User(
  //     {required this.sex,
  //     required this.withMeets,
  //     required this.targetMeet,
  //     required this.targetHeight,
  //     required this.targetFat,
  //     required this.username,
  //     required this.birthDay,
  //     required this.email,
  //     required this.password});

  User(
      {required this.sex,
      required this.withMeets,
      required this.targetMeet,
      required this.targetHeight,
      required this.targetFat,
      required this.username,
      required this.birthDay,
      required this.email,
      required this.liked,
      required this.aboutUser,
      required this.id,
      required this.linkToIMG});

  int id = 0;
  String sex = "1";
  String withMeets = "0";
  String targetMeet = "null";
  String targetHeight = "0";
  String targetFat = "0";
  String username = "test";
  String birthDay = "test";
  String email = "test";
  String password = "test";
  String liked = "0";
  String aboutUser = "Тут пусто...";
  String linkToIMG = "null";

  factory User.fromJson(json) => User(
      id: json['id'],
      sex: json['sex'].toString(),
      username: json['username'].toString(),
      email: json['email'].toString(),
      withMeets: json['withmeets'].toString(),
      targetMeet: json['targetmeet'].toString(),
      targetHeight: json['targetheight'].toString(),
      targetFat: json['targetfat'].toString(),
      birthDay: json['birthday'].toString(),
      aboutUser: json['aboutuser'].toString(),
      liked: json['liked'].toString(),
      linkToIMG: json['linktoimg'].toString());

  void getAll() {
    print(sex);
    print(withMeets);
    print(targetMeet);
    print(targetHeight);
    print(targetFat);
    print(username);
    print(birthDay);
    print(email);
  }
}
