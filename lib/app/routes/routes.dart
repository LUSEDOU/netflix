import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:netflix/home/home.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AuthenticationStatus state, List<Page<dynamic>> pages,
) {
  switch (state) {
    case AuthenticationStatus.authenticated:
      return [HomePage.page()];
    case AuthenticationStatus.unauthenticated:
      return [HomePage.page()];
      // TODO: add LoginPage route
  }
}
