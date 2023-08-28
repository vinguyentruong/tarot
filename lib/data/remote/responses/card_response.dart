import 'package:tarot/entities/card.dart';

class CardResponse extends Card {
  CardResponse({
    String? id,
    String? name,
    String? image,
    String? content,
  }) : super(
          id: id,
          name: name,
          image: image,
          content: content,
        );

  factory CardResponse.fromJson(Map<String, dynamic> json) {
    return CardResponse(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      content: json['content'],
    );
  }
}
