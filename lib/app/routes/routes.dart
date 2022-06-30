import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:netflix/screens/screens.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AuthenticationStatus state, List<Page<dynamic>> pages,
) {
  switch (state) {
    case AuthenticationStatus.authenticated:
      return [HomePage.page()];
    case AuthenticationStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
