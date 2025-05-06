// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:appwrite/appwrite.dart';
import 'dart:convert';
import '/custom_code/actions/initialize.dart';

Future<AppwriteUserResponseStruct?> signOut() async {
  try {
    // Delete the current session
    await account.deleteSession(sessionId: 'current');

    // Clear the app state
    FFAppState().update(() {
      FFAppState().appwriteUser = '';
      FFAppState().appwriteConfig = '';
    });

    // Return success response
    return AppwriteUserResponseStruct(
      success: true,
      user: null,
      error: null,
      errorCode: null,
      errorType: null,
      formattedError: null,
    );
  } on AppwriteException catch (e) {
    // Handle Appwrite-specific errors
    return AppwriteUserResponseStruct(
      success: false,
      user: null,
      error: e.message,
      errorCode: e.code,
      errorType: e.type,
      formattedError: handleError(e.message, e.code, 'sign out'),
    );
  } catch (e) {
    // Handle unexpected errors
    return AppwriteUserResponseStruct(
      success: false,
      user: null,
      error: e.toString(),
      errorCode: 500,
      errorType: 'UNKNOWN_ERROR',
      formattedError: 'An unexpected error occurred during sign out',
    );
  }
}
