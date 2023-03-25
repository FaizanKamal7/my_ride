import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../components/drawer_widget.dart';
import '../components/empty_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/instant_timer.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OnlineOfflineWidget extends StatefulWidget {
  const OnlineOfflineWidget({Key? key}) : super(key: key);

  @override
  _OnlineOfflineWidgetState createState() => _OnlineOfflineWidgetState();
}

class _OnlineOfflineWidgetState extends State<OnlineOfflineWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 800),
          end: Offset(0, 0),
        ),
      ],
    ),
    'containerOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 0),
          end: Offset(600, 0),
        ),
      ],
    ),
  };
  ApiCallResponse? apiResult0cs;
  ApiCallResponse? customerList;
  InstantTimer? instantTimer;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String? choiceChipsValue;

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ONLINE_OFFLINE_OnlineOffline_ON_LOAD');
      logFirebaseEvent('OnlineOffline_start_periodic_action');
      instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 1000),
        callback: (timer) async {
          logFirebaseEvent('OnlineOffline_backend_call');
          customerList = await DjangoServerGroup.customerListsCall.call();
          logFirebaseEvent('OnlineOffline_update_local_state');
          FFAppState().update(() {
            FFAppState().driverAvailableRideIds = [];
          });
        },
        startImmediately: true,
      );
    });

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'OnlineOffline'});
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    instantTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      drawer: Drawer(
        elevation: 16,
        child: DrawerWidget(),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: Align(
          alignment: AlignmentDirectional(0, 0),
          child: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 40,
            fillColor: FlutterFlowTheme.of(context).primaryColor,
            icon: Icon(
              Icons.menu,
              color: FlutterFlowTheme.of(context).primaryBackground,
              size: 20,
            ),
            onPressed: () async {
              logFirebaseEvent('ONLINE_OFFLINE_PAGE_menu_ICN_ON_TAP');
              logFirebaseEvent('IconButton_drawer');
              scaffoldKey.currentState!.openDrawer();
            },
          ),
        ),
        actions: [],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                child: FlutterFlowChoiceChips(
                  initiallySelected: ['Online'],
                  options: [ChipData('Offline'), ChipData('Online')],
                  onChanged: (val) =>
                      setState(() => choiceChipsValue = val?.first),
                  selectedChipStyle: ChipStyle(
                    backgroundColor: Color(0xFF323B45),
                    textStyle: FlutterFlowTheme.of(context).subtitle1.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                    iconColor: Colors.white,
                    iconSize: 18,
                    elevation: 0,
                  ),
                  unselectedChipStyle: ChipStyle(
                    backgroundColor: Colors.white,
                    textStyle: FlutterFlowTheme.of(context).subtitle1,
                    iconColor: Color(0xFF323B45),
                    iconSize: 18,
                    elevation: 0,
                  ),
                  chipSpacing: 20,
                  multiselect: false,
                  initialized: choiceChipsValue != null,
                  alignment: WrapAlignment.spaceEvenly,
                ),
              ),
            ),
          ),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Visibility(
          visible: (customerList?.succeeded ?? true),
          child: Align(
            alignment: AlignmentDirectional(0, 1),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Visibility(
                  visible: choiceChipsValue == 'Online',
                  child: Builder(
                    builder: (context) {
                      final rideID = DjangoServerGroup.customerListsCall
                              .id(
                                (customerList?.jsonBody ?? ''),
                              )
                              ?.toList() ??
                          [];
                      if (rideID.isEmpty) {
                        return Center(
                          child: EmptyWidget(),
                        );
                      }
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(rideID.length, (rideIDIndex) {
                            final rideIDItem = rideID[rideIDIndex];
                            return Visibility(
                              visible: !FFAppState()
                                  .declinedRidesId
                                  .contains('${rideIDItem.toString()}'),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 20, 20, 0),
                                child: FutureBuilder<ApiCallResponse>(
                                  future:
                                      DjangoServerGroup.rideDetailsCall.call(
                                    id: rideIDItem.toString(),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: SpinKitDoubleBounce(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            size: 50,
                                          ),
                                        ),
                                      );
                                    }
                                    final containerRideDetailsResponse =
                                        snapshot.data!;
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Color(0x32FFFFFF),
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryColor,
                                            width: 1,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(12, 0, 0, 0),
                                                  child: FutureBuilder<
                                                      ApiCallResponse>(
                                                    future: DjangoServerGroup
                                                        .userDataCall
                                                        .call(
                                                      uId: DjangoServerGroup
                                                          .rideDetailsCall
                                                          .userUid(
                                                            containerRideDetailsResponse
                                                                .jsonBody,
                                                          )
                                                          .toString(),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50,
                                                            height: 50,
                                                            child:
                                                                SpinKitDoubleBounce(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              size: 50,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      final columnUserDataResponse =
                                                          snapshot.data!;
                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1, 0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8,
                                                                          8,
                                                                          8,
                                                                          8),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/Group.png',
                                                                width: 50,
                                                                height: 50,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            DjangoServerGroup
                                                                .userDataCall
                                                                .name(
                                                                  columnUserDataResponse
                                                                      .jsonBody,
                                                                )
                                                                .toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800,
                                                                ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1, 0),
                                                            child: Text(
                                                              'PKR ${DjangoServerGroup.rideDetailsCall.fare(
                                                                    containerRideDetailsResponse
                                                                        .jsonBody,
                                                                  ).toString()}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w800,
                                                                  ),
                                                            ),
                                                          ),
                                                          Text(
                                                            DjangoServerGroup
                                                                .rideDetailsCall
                                                                .userRating(
                                                                  containerRideDetailsResponse
                                                                      .jsonBody,
                                                                )
                                                                .toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  fontSize: 12,
                                                                ),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                12, 8, 12, 0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      8, 0, 0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Image.asset(
                                                                'assets/images/pickuppng.png',
                                                                width: 20,
                                                                height: 20,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child: Text(
                                                                  'Pickup',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Color(
                                                                            0x80FFFFFF),
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            24,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child:
                                                                    AutoSizeText(
                                                                  DjangoServerGroup
                                                                      .rideDetailsCall
                                                                      .address(
                                                                        containerRideDetailsResponse
                                                                            .jsonBody,
                                                                      )
                                                                      .toString(),
                                                                  maxLines: 2,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Divider(
                                                          height: 15,
                                                          thickness: 1,
                                                          indent: 12,
                                                          endIndent: 12,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryColor,
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Image.asset(
                                                              'assets/images/marker.png',
                                                              width: 20,
                                                              height: 20,
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                'Drop off',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: Color(
                                                                          0x80FFFFFF),
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(26,
                                                                      0, 0, 0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    AutoSizeText(
                                                                  DjangoServerGroup
                                                                      .rideDetailsCall
                                                                      .dropAddress(
                                                                        containerRideDetailsResponse
                                                                            .jsonBody,
                                                                      )
                                                                      .toString(),
                                                                  maxLines: 2,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryColor,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 8, 0, 12),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                20, 0, 0, 0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'ONLINE_OFFLINE_PAGE_DECLINE_BTN_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Button_widget_animation');
                                                        if (animationsMap[
                                                                'containerOnActionTriggerAnimation'] !=
                                                            null) {
                                                          animationsMap[
                                                                  'containerOnActionTriggerAnimation']!
                                                              .controller
                                                              .forward(
                                                                  from: 0.0);
                                                        }
                                                        logFirebaseEvent(
                                                            'Button_update_local_state');
                                                        FFAppState().update(() {
                                                          FFAppState()
                                                              .addToDeclinedRidesId(
                                                                  rideIDItem
                                                                      .toString());
                                                        });
                                                      },
                                                      text: 'Decline',
                                                      options: FFButtonOptions(
                                                        width: 140,
                                                        height: 30,
                                                        color:
                                                            Color(0x33FFFFFF),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle2
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryColor,
                                                                ),
                                                        elevation: 0,
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryColor,
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 20, 0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'ONLINE_OFFLINE_PAGE_ACCEPT_BTN_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Button_backend_call');
                                                        apiResult0cs =
                                                            await DjangoServerGroup
                                                                .acceptDriverCall
                                                                .call(
                                                          id: rideIDItem,
                                                          driverUid:
                                                              currentUserUid,
                                                        );
                                                        if ((apiResult0cs
                                                                ?.succeeded ??
                                                            true)) {
                                                          logFirebaseEvent(
                                                              'Button_navigate_to');

                                                          context.goNamed(
                                                            'Direction',
                                                            queryParams: {
                                                              'rideID':
                                                                  serializeParam(
                                                                rideIDItem
                                                                    .toString(),
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        } else {
                                                          logFirebaseEvent(
                                                              'Button_alert_dialog');
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    'Error'),
                                                                content: Text(
                                                                    'Cannot Accept Ride'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext),
                                                                    child: Text(
                                                                        'Ok'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                        }

                                                        setState(() {});
                                                      },
                                                      text: 'Accept',
                                                      options: FFButtonOptions(
                                                        width: 140,
                                                        height: 30,
                                                        color:
                                                            Color(0x80101213),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle2
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                        elevation: 0,
                                                        borderSide: BorderSide(
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ).animateOnActionTrigger(
                                      animationsMap[
                                          'containerOnActionTriggerAnimation']!,
                                    );
                                  },
                                ),
                              ),
                            );
                          }),
                        ),
                      );
                    },
                  ),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation']!),
            ),
          ),
        ),
      ),
    );
  }
}
