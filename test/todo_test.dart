import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_project/model/todo.dart';

void main() {


  test('should toMap [createdAt] field should be [Integer]', () {
    // arrange
    Todo todo = Todo(
      id: 1,
      title: 'title',
      createdAt: DateTime.now(),
      isDone: false,
    );

    // act
    Map<String, dynamic> actual = todo.toMap();

    // assert
    expect(actual['createdAt'], isA<int>());
  });

  test('should toMap return valid values', () {
    // arrange

    DateTime expectedDateTime = DateTime.now();
    int expectedId = 1;
    String expectedTitle = 'title';
    bool expectedIsDone = false;

    Todo todo = Todo(
      id: expectedId,
      title: expectedTitle,
      createdAt: expectedDateTime,
      isDone: expectedIsDone,
    );

    // act
    Map<String, dynamic> actual = todo.toMap();

    // assert
    expect(actual['id'], expectedId);
    expect(actual['title'], expectedTitle);
    expect(actual['createdAt'], expectedDateTime.millisecondsSinceEpoch);
    expect(actual['isDone'], expectedIsDone);
  });
}
