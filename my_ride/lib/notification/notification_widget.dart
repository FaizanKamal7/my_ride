import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NotificationWidget extends StatefulWidget {
  const NotificationWidget({Key? key}) : super(key: key);

  @override
  _NotificationWidgetState createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Notification'});
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        title: Text(
          'Notifications',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Montserrat',
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 24, 0),
            child: Badge(
              badgeContent: Text(
                '1',
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                    ),
              ),
              showBadge: true,
              shape: BadgeShape.circle,
              badgeColor: FlutterFlowTheme.of(context).primaryColor,
              elevation: 4,
              padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
              position: BadgePosition.topEnd(),
              animationType: BadgeAnimationType.scale,
              toAnimate: true,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                child: Icon(
                  Icons.chat_bubble_outline_outlined,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: ListView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 0,
                      color: FlutterFlowTheme.of(context).lineColor,
                      offset: Offset(0, 1),
                    )
                  ],
                  borderRadius: BorderRadius.circular(0),
                  shape: BoxShape.rectangle,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 4,
                        height: 50,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                          child: Text(
                            'New Event added to your calendar',
                            style: FlutterFlowTheme.of(context).subtitle1,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                        child: Text(
                          'Mar 8, 2022',
                          style: FlutterFlowTheme.of(context).bodyText2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 0,
                      color: FlutterFlowTheme.of(context).lineColor,
                      offset: Offset(0, 1),
                    )
                  ],
                  borderRadius: BorderRadius.circular(0),
                  shape: BoxShape.rectangle,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 4,
                        height: 50,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                          child: Text(
                            'Profile Modified',
                            style: FlutterFlowTheme.of(context).subtitle1,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                        child: Text(
                          'Mar 8, 2022',
                          style: FlutterFlowTheme.of(context).bodyText2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
