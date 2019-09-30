import 'package:json_annotation/json_annotation.dart';

class RecommendEntity extends Object {
  @JsonKey(name: 'bookId')
  int bookId;

  @JsonKey(name: 'bookName')
  String bookName;

  @JsonKey(name: 'bookCover')
  String bookCover;

  RecommendEntity(this.bookId, this.bookName, this.bookCover);



}
