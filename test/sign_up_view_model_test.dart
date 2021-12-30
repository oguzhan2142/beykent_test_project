import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_project/view_model/sign_up_view_model.dart';

import 'sign_in_view_model_test.mocks.dart';

void main() {
  late SignUpViewModel signUpViewModel;
  late MockRepository mockRepository;

  setUp(() {
    mockRepository = MockRepository();
    signUpViewModel = SignUpViewModel(mockRepository);
  });


  group('', () {
    
  });
}
