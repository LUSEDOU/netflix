// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:netflix/app/app.dart';
import 'package:user_repository/user_repository.dart';

class MockUser extends Mock implements User {}

class MockUserRepository extends Mock implements UserRepository {}

class MockAuthenticationRepository extends Mock 
    implements AuthenticationRepository {}

class MockAuthenticationBloc extends 
    MockBloc<AuthenticationEvent, AuthenticationState> 
      implements AuthenticationBloc {}

void main() {
  group('App', () {
    late AuthenticationRepository authenticationRepository;
    late UserRepository userRepository;
    late User user;

    setUp(() {
      authenticationRepository = MockAuthenticationRepository();
      userRepository = MockUserRepository();
      user = MockUser();
      
      when(() => authenticationRepository.status).thenAnswer(
        (_) => const Stream.empty(),
      );

      when(() => userRepository.currentUser).thenReturn(user);
      when(() => user.isNotEmpty).thenReturn(true);
      when(() => user.isEmpty).thenReturn(false);
      when(() => user.email).thenReturn('test@gmail.com');
    });

    testWidgets('renders AppView', (tester) async {
      await tester.pumpWidget(
        App(
          authenticationRepository: authenticationRepository, 
          userRepository: userRepository,
        ),
      );
      expect(find.byType(AppView), findsOneWidget);
    });
  });
}
