class ListMessages {
  ListMessages({required this.id});

  late int id;

  factory ListMessages.fromJson(json) => ListMessages(
        id: json['id'],
      );
}
