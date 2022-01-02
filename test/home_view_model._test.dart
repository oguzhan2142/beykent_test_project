import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_project/model/todo.dart';
import 'package:flutter_test_project/view_model/home_view_model.dart';
import 'package:mockito/mockito.dart';

import 'sign_in_view_model_test.mocks.dart';

void main() {
  late HomeViewModel homeViewModel;
  late MockRepository mockRepository;

  setUp(() {
    mockRepository = MockRepository();
    homeViewModel = HomeViewModel(mockRepository);
  });

  test('should isLoading should be false when [getAllTodos] exuceting finished',
      () async {
    // arrange
    when(mockRepository.getAllTodos()).thenAnswer((_) => Future.value([]));

    // act
    await homeViewModel.getAllTodos();
    // assert
    expect(homeViewModel.isLoading, false);
  });

  test('should [getAllTodos] return right amount of todos', () async {
    // arrange
    final todos = [
      Todo(
        id: 1,
        title: 'title',
        createdAt: DateTime.now(),
        isDone: false,
      )
    ];

    when(mockRepository.getAllTodos()).thenAnswer((_) => Future.value(todos));

    final expectedTodoCount = todos.length;

    // act
    await homeViewModel.getAllTodos();

    // assert
    expect(homeViewModel.todos.length, expectedTodoCount);
  });

  test(
      'should [getAllTodos] return empty list when repository return null value',
      () async {
    // arrange
    when(mockRepository.getAllTodos()).thenAnswer((_) => Future.value(null));

    // act
    await homeViewModel.getAllTodos();

    // assert
    expect(homeViewModel.todos.length, []);
  });

  test('should [onTodoChecked] change todo isDone value with oppsosite', () {
    // arrange
    const isDoneValue = false;
    Todo model = Todo(
      id: 1,
      title: 'title',
      createdAt: DateTime.now(),
      isDone: isDoneValue,
    );

    // act
    homeViewModel.onTodoChecked(model, isDoneValue);

    // assert
    expect(model, !isDoneValue);
  });

  test('should execute getAllTodos inside [onTodoChecked]', () async {
    // arrange
    Todo todo = Todo(
      id: 1,
      title: 'title',
      createdAt: DateTime.now(),
      isDone: true,
    );

    // act
    homeViewModel.onTodoChecked(todo, false);

    // assert
    verify(homeViewModel.getAllTodos());
  });
}
