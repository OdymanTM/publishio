// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';

Future downloadFile() async {}

class GoogleSignInUserData {
  final String email;
  final String? idToken;

  GoogleSignInUserData({required this.email, this.idToken});
}

class GoogleSignInTokenData {
  final String? accessToken;

  GoogleSignInTokenData({this.accessToken});
}

class SignInInitParameters {
  final String clientId;
  final List<String> scopes;

  SignInInitParameters({required this.clientId, required this.scopes});
}

class GoogleSignInPlugin {
  GoogleSignInPlugin();

  Future<void> initWithParams(SignInInitParameters params) async {
    throw UnsupportedError('Cannot perform web sign in on non-web platform');
  }

  Future<GoogleSignInUserData?> signIn() async {
    throw UnsupportedError('Cannot perform web sign in on non-web platform');
  }

  Future<GoogleSignInTokenData> getTokens({required String email}) async {
    throw UnsupportedError('Cannot perform web sign in on non-web platform');
  }
}
