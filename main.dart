import 'dart:convert';
import 'book.dart';

void main() {
  // JSON chuỗi đầu vào
  String jsonStr = '{"id":101,"title":"Dart Mastery","author":"Duc Than"}';

  // JSON → Object
  Book book = Book.fromJson(jsonDecode(jsonStr));
  print('Title: ${book.title}, Author: ${book.author}');

  // Object → JSON
  String outputJson = jsonEncode(book.toJson());
  print('JSON Output: $outputJson');
}
