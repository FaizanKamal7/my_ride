import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/push_notifications/push_notifications_util.dart';
import '../components/ride_type_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/instant_timer.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactDriverWidget extends StatefulWidget {
  const ContactDriverWidget({Key? key}) : super(key: key);

  @override
  _ContactDriverWidgetState createState() => _ContactDriverWidgetState();
}

class _ContactDriverWidgetState extends State<ContactDriverWidget> {
  ApiCallResponse? apiResultkf5;
  ApiCallResponse? rideStatus;
  InstantTimer? instantTimer;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CONTACT_DRIVER_ContactDriver_ON_LOAD');
      logFirebaseEvent('ContactDriver_trigger_push_notification');
      triggerPushNotification(
        notificationTitle: 'Driver is arriving soon!',
        notificationText:
            'Please wait while the driver arrives to pick you up at your pickup location.',
        notificationSound: 'default',
        userRefs: [currentUserReference!],
        initialPageName: 'ContactDriver',
        parameterData: {},
      );
      logFirebaseEvent('ContactDriver_start_periodic_action');
      instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 1000),
        callback: (timer) async {
          logFirebaseEvent('ContactDriver_backend_call');
          rideStatus = await DjangoServerGroup.tripStatusCall.call(
            tripId: FFAppState().rideID,
          );
          if (DjangoServerGroup.tripStatusCall
                  .statusGet(
                    (rideStatus?.jsonBody ?? ''),
                  )
                  .toString() ==
              'ARRIVED') {
            logFirebaseEvent('ContactDriver_stop_periodic_action');
            instantTimer?.cancel();
            logFirebaseEvent('ContactDriver_navigate_to');

            context.pushNamed('Direction');
          }
        },
        startImmediately: true,
      );
    });

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ContactDriver'});
  }

  @override
  void dispose() {
    instantTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: DjangoServerGroup.rideDetailsCall.call(
        id: FFAppState().rideID,
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
        final contactDriverRideDetailsResponse = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFF002F09),
          body: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0, -1),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: custom_widgets.RouteViewStatic(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.8,
                    lineColor: Color(0xFFFF0000),
                    iOSGoogleMapsApiKey:
                        'AIzaSyCLcb0RVCdYgd1QWBZPspiVESTDpF1yLhM',
                    androidGoogleMapsApiKey:
                        'AIzaSyDzPNAE5mqLSyeCrnQM2KQS-6-BvyJtkrI',
                    webGoogleMapsApiKey:
                        'AIzaSyBAdeI1GITrMTHzndOwzKecdo9zbNFVNg4',
                    startAddress: FFAppState().pickupAddress,
                    destinationAddress: FFAppState().destinationAddress,
                    startCoordinate: FFAppState().startCoordinate!,
                    endCoordinate: FFAppState().endCoordinate!,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 48, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24, 0, 0, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'CONTACT_DRIVER_Container_7j339bk9_ON_TAP');
                                      logFirebaseEvent('Container_drawer');
                                      scaffoldKey.currentState!.openDrawer();
                                    },
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 5,
                                      shape: const CircleBorder(),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 8, 8, 8),
                                          child: Icon(
                                            Icons.menu,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryColor,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, -0.99),
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(31),
                                        bottomRight: Radius.circular(0),
                                        topLeft: Radius.circular(31),
                                        topRight: Radius.circular(0),
                                      ),
                                    ),
                                    child: Container(
                                      width: 143,
                                      height: 49,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(31),
                                          bottomRight: Radius.circular(0),
                                          topLeft: Radius.circular(31),
                                          topRight: Radius.circular(0),
                                        ),
                                      ),
                                      child: InkWell(
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'CONTACT_DRIVER_PAGE_Row_ti3xnbb6_ON_TAP');
                                          logFirebaseEvent('Row_alert_dialog');
                                          var confirmDialogResponse =
                                              await showDialog<bool>(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title:
                                                            Text('Cancel Ride'),
                                                        content: Text(
                                                            'Are you sure you want to cancel your arriving ride?'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child: Text('NO'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child: Text('YES'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ) ??
                                                  false;
                                          if (confirmDialogResponse) {
                                            logFirebaseEvent(
                                                'Row_backend_call');
                                            apiResultkf5 =
                                                await DjangoServerGroup
                                                    .tripStatusPatchCall
                                                    .call(
                                              status: 'CANCELLED',
                                            );
                                            if ((apiResultkf5?.succeeded ??
                                                true)) {
                                              logFirebaseEvent(
                                                  'Row_navigate_to');
                                              if (Navigator.of(context)
                                                  .canPop()) {
                                                context.pop();
                                              }
                                              context.pushNamed('Home');
                                            }
                                          }

                                          setState(() {});
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Cancel',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryColor,
                                                    fontSize: 20,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.01, -0.83),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(31),
                              ),
                              child: Container(
                                width: 315,
                                height: 81,
                                decoration: BoxDecoration(
                                  color: Color(0xFFD9D9D9),
                                  borderRadius: BorderRadius.circular(31),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 16, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Arriving',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Your driver is on it\'s way',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Montserrat',
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 0.8),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(32),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 240,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child: FutureBuilder<ApiCallResponse>(
                              future: DjangoServerGroup.driverDataCall.call(
                                uId: DjangoServerGroup.rideDetailsCall
                                    .driverUid(
                                      contactDriverRideDetailsResponse.jsonBody,
                                    )
                                    .toString(),
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
                                final columnDriverDataResponse = snapshot.data!;
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 0, 0, 0),
                                            child: Container(
                                              width: 60,
                                              height: 60,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.asset(
                                                'assets/images/Group.png',
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 0, 0, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  DjangoServerGroup
                                                      .driverDataCall
                                                      .name(
                                                        columnDriverDataResponse
                                                            .jsonBody,
                                                      )
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryColor,
                                                      ),
                                                ),
                                                Text(
                                                  DjangoServerGroup
                                                      .driverDataCall
                                                      .vechileName(
                                                        columnDriverDataResponse
                                                            .jsonBody,
                                                      )
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color:
                                                            Color(0x7BFFFFFF),
                                                      ),
                                                ),
                                                Text(
                                                  DjangoServerGroup
                                                      .driverDataCall
                                                      .vechicleNo(
                                                        columnDriverDataResponse
                                                            .jsonBody,
                                                      )
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color:
                                                            Color(0x7BFFFFFF),
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment:
                                                  AlignmentDirectional(1, 0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 12, 0),
                                                child: InkWell(
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'CONTACT_DRIVER_PAGE_Icon_d3oolefg_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Icon_call_number');
                                                    await launchUrl(Uri(
                                                      scheme: 'tel',
                                                      path: DjangoServerGroup
                                                          .driverDataCall
                                                          .phoneNumber(
                                                            columnDriverDataResponse
                                                                .jsonBody,
                                                          )
                                                          .toString(),
                                                    ));
                                                  },
                                                  child: Icon(
                                                    Icons.phone,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryColor,
                                                    size: 28,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 8, 20, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 100,
                                            height: 140,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                            ),
                                            child: RideTypeWidget(
                                              ride: FFAppState().selectedRide,
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(20, 0, 0, 0),
                                              child: Container(
                                                width: 238,
                                                height: 124,
                                                decoration: BoxDecoration(
                                                  color: Color(0x33FFFFFF),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryColor,
                                                    width: 1,
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8, 8, 0, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Image.asset(
                                                            'assets/images/pickuppng.png',
                                                            width: 20,
                                                            height: 20,
                                                            fit: BoxFit.contain,
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
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: Color(
                                                                        0x70FFFFFF),
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(36, 0,
                                                                    0, 0),
                                                        child: AutoSizeText(
                                                          DjangoServerGroup
                                                              .rideDetailsCall
                                                              .address(
                                                                contactDriverRideDetailsResponse
                                                                    .jsonBody,
                                                              )
                                                              .toString(),
                                                          maxLines: 2,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryColor,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Divider(
                                                      height: 1,
                                                      thickness: 1,
                                                      indent: 35,
                                                      endIndent: 20,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryColor,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8, 8, 0, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Image.asset(
                                                            'assets/images/marker.png',
                                                            width: 20,
                                                            height: 20,
                                                            fit: BoxFit.contain,
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
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: Color(
                                                                        0x70FFFFFF),
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(36, 0,
                                                                    0, 0),
                                                        child: AutoSizeText(
                                                          DjangoServerGroup
                                                              .rideDetailsCall
                                                              .dropAddress(
                                                                contactDriverRideDetailsResponse
                                                                    .jsonBody,
                                                              )
                                                              .toString(),
                                                          maxLines: 2,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryColor,
                                                              ),
                                                        ),
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
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.03, 1),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 20),
                        child: Text(
                          'Contact Driver for more details',
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Montserrat',
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                                fontSize: 16,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
