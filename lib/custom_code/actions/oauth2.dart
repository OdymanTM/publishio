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

import 'dart:math';
import 'package:google_sign_in_platform_interface/google_sign_in_platform_interface.dart'
    if (dart.library.io) '/custom_code/actions/download_file.dart' as web_auth;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in_web/google_sign_in_web.dart'
    if (dart.library.io) '/custom_code/actions/download_file.dart' as web_auth;
import 'index.dart'; // Imports other custom actions
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:googleapis/gmail/v1.dart' as gmail;
import 'package:firebase_auth/firebase_auth.dart';

// Simple HTML parser class
class Parse {
  dynamic input;
  var document;

  Parse(this.input) {
    document = parseHtml(input);
  }

  get body {
    return document.body;
  }
}

var parseHtml = (input) {
  return HtmlDocument(input);
};

class HtmlDocument {
  dynamic body;
  HtmlDocument(String input) {
    // A very basic and limited parsing to simulate the behavior.
    // Replace with your own logic or a more complex parsing as needed.
    if (input.contains('<body>') && input.contains('</body>')) {
      body = input.split('<body>')[1].split('</body>')[0];
    } else {
      body = input;
    }
  }
}

Future oauth2(
  String webClientId,
  String androidClientId,
  String iOSCLientId,
  DateTime start,
  DateTime end,
) async {
  late String clientId;
  const scopes = ['https://www.googleapis.com/auth/gmail.readonly'];
  String idToken = "";
  try {
    if (isWeb) {
      clientId = webClientId;
      web_auth.GoogleSignInPlugin webAuthentication =
          web_auth.GoogleSignInPlugin();

      await webAuthentication.initWithParams(
          web_auth.SignInInitParameters(clientId: webClientId, scopes: scopes));

      web_auth.GoogleSignInUserData? webUserData =
          await webAuthentication.signIn();

      idToken = webUserData!.idToken ?? "";
      web_auth.GoogleSignInTokenData tokenData =
          await webAuthentication.getTokens(email: webUserData.email);
      idToken = tokenData.accessToken ?? "";
    } else {
      if (defaultTargetPlatform == TargetPlatform.android) {
        clientId = androidClientId;
      } else {
        clientId = iOSCLientId;
      }
      GoogleSignIn googleSignIn = GoogleSignIn(
          serverClientId: clientId,
          scopes: ['https://www.googleapis.com/auth/gmail.readonly']);
      GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      idToken = googleAuth!.idToken ?? "";
    }

    User? firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser == null) {}

    final authClient = authenticatedClient(
      http.Client(),
      AccessCredentials(
          AccessToken('Bearer', idToken,
              DateTime.now().add(Duration(hours: 1)).toUtc()),
          null,
          ['https://www.googleapis.com/auth/gmail.readonly']),
    );

    final gmailApi = gmail.GmailApi(authClient);

    var messages = await gmailApi.users.messages.list('me');

    for (var message in messages.messages!) {
      var fullMessage = await gmailApi.users.messages.get('me', message.id!);

      if (fullMessage.payload != null) {
        Map<String, String> emailDetails =
            extractEmailDetails(fullMessage.payload!);

        String textContent = extractTextFromPayload(fullMessage.payload!);

        FFAppState().update(() {
          FFAppState().emailList.add(EmailStruct(
                body: textContent,
                deliveredTo: emailDetails["deliveredTo"],
                from: emailDetails["from"],
                subject: emailDetails["subject"],
              ));
        });
      }
    }

    authClient.close();
    return FFAppState().emailList;
  } catch (e) {
    FFAppState().error = 'Error during OAuth2: $e';
    print('Error during OAuth2: $e');
    return [];
  }
}

String extractTextFromPayload(gmail.MessagePart payload) {
  if (payload.body != null && payload.body!.data != null) {
    String htmlContent = utf8.decode(base64.decode(payload.body!.data!));

    var parser = Parse(htmlContent);
    return parser.body ?? '';
  } else if (payload.parts != null) {
    for (var part in payload.parts!) {
      String textContent = extractTextFromPayload(part);
      if (textContent.isNotEmpty) {
        return textContent;
      }
    }
  }

  return '';
}

Map<String, String> extractEmailDetails(gmail.MessagePart payload) {
  var details = <String, String>{};

  for (var header in payload.headers!) {
    var headerName = header.name!.toLowerCase();

    switch (headerName) {
      case 'from':
        details['from'] = header.value!;
        break;
      case 'subject':
        details['subject'] = header.value!;
        break;
      case 'date':
        details['date'] = header.value!;
        break;
      case 'message-id':
        details['messageID'] = header.value!;
        break;
      case 'in-reply-to':
        details['inReplyTo'] = header.value!;
        break;
      case 'references':
        details['references'] = header.value!;
        break;
      case 'received':
        details['received'] = header.value!;
        break;
      case 'return-path':
        details['returnPath'] = header.value!;
        break;
      case 'delivered-to':
        details['deliveredTo'] = header.value!;
        break;
      case 'content-type':
        details['contentType'] = header.value!;
        break;
      case 'mime-version':
        details['mimeVersion'] = header.value!;
        break;
      case 'reply-to':
        details['replyTo'] = header.value!;
        break;
      case 'user-agent':
        details['userAgent'] = header.value!;
        break;
      case 'x-priority':
        details['priority'] = header.value!;
        break;
      case 'x-mailer':
        details['mailer'] = header.value!;
        break;
      case 'x-originating-ip':
        details['originatingIP'] = header.value!;
        break;
      case 'x-spam-status':
        details['spamStatus'] = header.value!;
        break;
      case 'x-spam-score':
        details['spamScore'] = header.value!;
        break;
      case 'list-unsubscribe':
        details['listUnsubscribe'] = header.value!;
        break;
      case 'disposition-notification-to':
        details['notificationTo'] = header.value!;
        break;
      case 'dkim-signature':
        details['dkimSignature'] = header.value!;
        break;
    }
  }
  return details;
}

Future downloadFile2() async {
  // Add your function code here!
}
