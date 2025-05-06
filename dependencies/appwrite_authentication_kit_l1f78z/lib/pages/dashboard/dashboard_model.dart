import '/backend/schema/structs/index.dart';
import '/components/btn_sign_out_desktop/btn_sign_out_desktop_widget.dart';
import '/components/btn_sign_out_mobile/btn_sign_out_mobile_widget.dart';
import '/components/btn_sign_out_tablet/btn_sign_out_tablet_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'dashboard_widget.dart' show DashboardWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DashboardModel extends FlutterFlowModel<DashboardWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getCurrentUser] action in Dashboard widget.
  AppwriteUserResponseStruct? userResult;
  // Model for btnSignOutMobile component.
  late BtnSignOutMobileModel btnSignOutMobileModel;
  // Model for btnSignOutTablet component.
  late BtnSignOutTabletModel btnSignOutTabletModel;
  // Model for btnSignOutDesktop component.
  late BtnSignOutDesktopModel btnSignOutDesktopModel;

  @override
  void initState(BuildContext context) {
    btnSignOutMobileModel = createModel(context, () => BtnSignOutMobileModel());
    btnSignOutTabletModel = createModel(context, () => BtnSignOutTabletModel());
    btnSignOutDesktopModel =
        createModel(context, () => BtnSignOutDesktopModel());
  }

  @override
  void dispose() {
    btnSignOutMobileModel.dispose();
    btnSignOutTabletModel.dispose();
    btnSignOutDesktopModel.dispose();
  }
}
