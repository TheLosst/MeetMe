class Messages {
  String mid = " ";
  String fromUser = " ";
  String toUser = " ";
  String text = " ";
  String clock = " ";
  bool is_read = false;

  Messages(
      {required this.fromUser,
      required this.toUser,
      required this.text,
      required this.mid,
      required this.clock,
      required this.is_read});

  factory Messages.fromJson(json) => Messages(
      mid: json['mid'].toString(),
      fromUser: json['from_id'].toString(),
      toUser: json['to_id'].toString(),
      text: json['text'].toString(),
      clock: json['clock'].toString(),
      is_read: json['is_read']);
}
