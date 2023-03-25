import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 40),
      child: FutureBuilder<ApiCallResponse>(
        future: DjangoServerGroup.userDataCall.call(
          uId: currentUserUid,
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: SpinKitDoubleBounce(
                  color: FlutterFlowTheme.of(context).primaryColor,
                  size: 50,
                ),
              ),
            );
          }
          final columnUserDataResponse = snapshot.data!;
          return Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                      child: InkWell(
                        onTap: () async {
                          logFirebaseEvent(
                              'DRAWER_COMP_CircleImage_2z95tpap_ON_TAP');
                          logFirebaseEvent('CircleImage_navigate_to');
                          if (Navigator.of(context).canPop()) {
                            context.pop();
                          }
                          context.pushNamed('Profile');
                        },
                        child: Container(
                          width: 80,
                          height: 80,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/images/Grousdp.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          logFirebaseEvent('DRAWER_COMP_Text_5sguf8n8_ON_TAP');
                          logFirebaseEvent('Text_navigate_to');
                          if (Navigator.of(context).canPop()) {
                            context.pop();
                          }
                          context.pushNamed('Profile');
                        },
                        child: AutoSizeText(
                          DjangoServerGroup.userDataCall
                              .name(
                                columnUserDataResponse.jsonBody,
                              )
                              .toString(),
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).title3,
                        ),
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      borderWidth: 1,
                      buttonSize: 60,
                      icon: Icon(
                        Icons.arrow_forward,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'DRAWER_COMP_arrow_forward_ICN_ON_TAP');
                        logFirebaseEvent(
                            'IconButton_close_dialog,_drawer,_etc');
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 6,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (valueOrDefault(currentUserDocument?.userType, '') !=
                        'Driver')
                      AuthUserStreamWidget(
                        builder: (context) => InkWell(
                          onTap: () async {
                            logFirebaseEvent(
                                'DRAWER_COMP_ListTile_fmjqhnax_ON_TAP');
                            logFirebaseEvent('ListTile_navigate_to');
                            if (Navigator.of(context).canPop()) {
                              context.pop();
                            }
                            context.pushNamed('Home');
                          },
                          child: ListTile(
                            leading: FaIcon(
                              FontAwesomeIcons.route,
                            ),
                            title: Text(
                              'Book A Ride',
                              style: FlutterFlowTheme.of(context).title3,
                            ),
                            dense: false,
                          ),
                        ),
                      ),
                    if (valueOrDefault(currentUserDocument?.userType, '') !=
                        'Driver')
                      AuthUserStreamWidget(
                        builder: (context) => InkWell(
                          onTap: () async {
                            logFirebaseEvent(
                                'DRAWER_COMP_ListTile_y44272vr_ON_TAP');
                            logFirebaseEvent('ListTile_navigate_to');
                            if (Navigator.of(context).canPop()) {
                              context.pop();
                            }
                            context.pushNamed('Delivery');
                          },
                          child: ListTile(
                            leading: Icon(
                              Icons.delivery_dining,
                              size: 30,
                            ),
                            title: Text(
                              'Delivery',
                              style: FlutterFlowTheme.of(context).title3,
                            ),
                            dense: false,
                          ),
                        ),
                      ),
                    InkWell(
                      onTap: () async {
                        logFirebaseEvent(
                            'DRAWER_COMP_ListTile_aeji822r_ON_TAP');
                        logFirebaseEvent('ListTile_navigate_to');
                        if (Navigator.of(context).canPop()) {
                          context.pop();
                        }
                        context.pushNamed('AllRides');
                      },
                      child: ListTile(
                        leading: Icon(
                          Icons.history,
                        ),
                        title: Text(
                          'Trips History',
                          style: FlutterFlowTheme.of(context).title3,
                        ),
                        dense: false,
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.settings,
                      ),
                      title: Text(
                        'Settings',
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                      dense: false,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.notifications,
                      ),
                      title: Text(
                        'Notifications',
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                      dense: false,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('DRAWER_COMP_SIGN_OUT_BTN_ON_TAP');
                      logFirebaseEvent('Button_auth');
                      GoRouter.of(context).prepareAuthEvent();
                      await signOut();

                      context.goNamedAuth('Login', mounted);
                    },
                    text: 'Sign Out',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 40,
                      color: Colors.transparent,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                      elevation: 0,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primaryText,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
