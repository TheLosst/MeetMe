//import 'dart:ffi';

import 'package:swipe_cards/swipe_cards.dart';

import 'User.dart';

const List<String> defaultText = ["Укажите свой пол","С кем вы хотите познакомиться?","Какая у вас цель      знакомства?","какого роста Вы ищете","какого веса Вы ищете","Как Вас зовут?","Когда у Вас день рождения?","Найдено"];
const List<String> sex = ["Мужчина", "Женщина"];
const List<String> withSex = ["С мужчинами","С женщинами","Со всеми"];
const List<String> targetMeeting = ["Отношения","Флирт","Встреча, свидание"];
const List<String> peopleHeight = ["До 170 см", "От 170 до 190 см", "Выше 190", "Любого"];
const List<String> peopleFat = ["До 60 кг","От 60 до 80 кг","От 80 до 100 кг","Любого"];
const String next = "Далее";
const List<String> registerMail = ["Регистрация с почтой", "Электронная почта", "Введите электронную почту"];
const List<String> loginField = ["Ваше имя","Введите Ваше имя"];
const List<String> birthday = ["День","Месяц","Год"];
List<bool> kekv = [true,false,true,false,true,false,true,false,true,false,true,false,true,false,true,false,true,false,true,false,true,false,];
String chooseSex = "TestValue";
int matchNumber = 0;
User user = User();
MatchEngine matchEngine = MatchEngine();