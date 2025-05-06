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
import 'package:appwrite/models.dart' as models;
import 'dart:convert';

// Initialize client - will be configured during initialize()
final Client client = Client();

// Initialize account ONCE using the single client instance
final Account account = Account(client);

/// Returns an AppwriteUserResponse with initialization status and user data
/// if available
Future<AppwriteUserResponseStruct?> initialize() async {
  try {
    // Get values from FFAppState
    var endpoint = FFAppState().appwriteEndpoint;
    var projectId = FFAppState().appwriteProjectId;

    // If empty, use the values from Library Values
    if (endpoint.isEmpty) {
      endpoint =
          FFLibraryValues().appwriteEndpoint ?? ''; // Handle nullable value
      // Update FFAppState with the library value
      FFAppState().update(() {
        FFAppState().appwriteEndpoint = endpoint;
      });
    }

    if (projectId.isEmpty) {
      projectId =
          FFLibraryValues().appwriteProjectId ?? ''; // Handle nullable value
      // Update FFAppState with the library value
      FFAppState().update(() {
        FFAppState().appwriteProjectId = projectId;
      });
    }

    // Validate values again after trying library values
    if (endpoint.isEmpty) {
      return AppwriteUserResponseStruct(
        success: false,
        error: 'Configuration error: Missing Appwrite endpoint',
        errorCode: 400,
        errorType: 'CONFIG_ERROR',
        formattedError: 'Missing Appwrite endpoint in configuration',
        user: null,
      );
    }

    if (projectId.isEmpty) {
      return AppwriteUserResponseStruct(
        success: false,
        error: 'Configuration error: Missing Appwrite project ID',
        errorCode: 400,
        errorType: 'CONFIG_ERROR',
        formattedError: 'Missing Appwrite project ID in configuration',
        user: null,
      );
    }

    // Configure client with provided parameters
    client
      ..setEndpoint(endpoint)
      ..setProject(projectId)
      ..setSelfSigned(status: true);

    // Store config in app state
    FFAppState().update(() {
      FFAppState().appwriteConfig = jsonEncode({
        'endpoint': endpoint,
        'projectId': projectId,
        'initialized': true,
      });
    });

    // Get and store user data
    try {
      final user = await account.get();

      // Create AppwriteUser object with exact schema match
      final userData = AppwriteUserStruct(
        id: user.$id ?? '',
        email: user.email ?? '',
        name: user.name ?? '',
        emailVerified: user.emailVerification ?? false,
        status: user.status.toString(),
      );

      // Update app state with user data (as JSON string)
      FFAppState().update(() {
        FFAppState().appwriteUser = jsonEncode({
          'id': user.$id,
          'email': user.email,
          'name': user.name,
          'emailVerified': user.emailVerification,
          'status': user.status.toString(),
        });
      });

      // Return success response with user data
      return AppwriteUserResponseStruct(
        success: true,
        user: userData,
        error: null,
        errorCode: null,
        errorType: null,
        formattedError: null,
      );
    } catch (e) {
      // If getting user fails (no active session), return false for initialization
      return AppwriteUserResponseStruct(
        success: false,
        user: null,
        error: 'No active session',
        errorCode: 401,
        errorType: 'UNAUTHORIZED',
        formattedError: 'Please sign in to continue',
      );
    }
  } on AppwriteException catch (e) {
    return AppwriteUserResponseStruct(
      success: false,
      user: null,
      error: e.message,
      errorCode: e.code,
      errorType: e.type,
      formattedError: handleError(e.message, e.code, 'initialize'),
    );
  } catch (e) {
    return AppwriteUserResponseStruct(
      success: false,
      user: null,
      error: e.toString(),
      errorCode: 500,
      errorType: 'UNKNOWN_ERROR',
      formattedError: 'An unexpected error occurred',
    );
  }
}
