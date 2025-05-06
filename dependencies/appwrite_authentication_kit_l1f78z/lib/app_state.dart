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

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _appwriteConfig = prefs.getString('ff_appwriteConfig') ?? _appwriteConfig;
    });
    _safeInit(() {
      _appwriteUser = prefs.getString('ff_appwriteUser') ?? _appwriteUser;
    });
    _safeInit(() {
      _appwriteEndpoint =
          prefs.getString('ff_appwriteEndpoint') ?? _appwriteEndpoint;
    });
    _safeInit(() {
      _appwriteProjectId =
          prefs.getString('ff_appwriteProjectId') ?? _appwriteProjectId;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  /// Appwrite configuration state
  String _appwriteConfig = '';
  String get appwriteConfig => _appwriteConfig;
  set appwriteConfig(String value) {
    _appwriteConfig = value;
    prefs.setString('ff_appwriteConfig', value);
  }

  /// Current Appwrite user data
  String _appwriteUser = '';
  String get appwriteUser => _appwriteUser;
  set appwriteUser(String value) {
    _appwriteUser = value;
    prefs.setString('ff_appwriteUser', value);
  }

  /// Appwrite endpoint URL
  String _appwriteEndpoint = '';
  String get appwriteEndpoint => _appwriteEndpoint;
  set appwriteEndpoint(String value) {
    _appwriteEndpoint = value;
    prefs.setString('ff_appwriteEndpoint', value);
  }

  /// Appwrite project ID
  String _appwriteProjectId = '';
  String get appwriteProjectId => _appwriteProjectId;
  set appwriteProjectId(String value) {
    _appwriteProjectId = value;
    prefs.setString('ff_appwriteProjectId', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
