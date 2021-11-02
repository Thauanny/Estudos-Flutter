import 'dart:convert';

import 'package:clean_architecture/app/modules/search/domain/entities/result_search.dart';

class ResultSearchModel extends ResultSearch {
  final String title;
  final String img;
  final String content;

  ResultSearchModel(
      {required this.title, required this.img, required this.content})
      : super(title: title, img: img, content: content);

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'img': img,
      'content': content,
    };
  }

  factory ResultSearchModel.fromMap(Map<String, dynamic> map) {
    return ResultSearchModel(
      title: map['title'],
      img: map['img'],
      content: map['content'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultSearchModel.fromJson(String source) =>
      ResultSearchModel.fromMap(json.decode(source));
}
