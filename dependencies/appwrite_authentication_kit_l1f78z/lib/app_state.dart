import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  /// Appwrite configuration state
  String _appwriteConfig = '';
  String get appwriteConfig => _appwriteConfig;
  set appwriteConfig(String value) {
    _appwriteConfig = value;
  }

  /// Current Appwrite user data
  String _appwriteUser = '';
  String get appwriteUser => _appwriteUser;
  set appwriteUser(String value) {
    _appwriteUser = value;
  }

  /// Appwrite endpoint URL
  String _appwriteEndpoint = '';
  String get appwriteEndpoint => _appwriteEndpoint;
  set appwriteEndpoint(String value) {
    _appwriteEndpoint = value;
  }

  /// Appwrite project ID
  String _appwriteProjectId = '';
  String get appwriteProjectId => _appwriteProjectId;
  set appwriteProjectId(String value) {
    _appwriteProjectId = value;
  }
}
