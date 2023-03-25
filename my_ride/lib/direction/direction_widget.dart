import '../backend/api_requests/api_calls.dart';
import '../components/ride_type_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:map_launcher/map_launcher.dart' as $ml;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DirectionWidget extends StatefulWidget {
  const DirectionWidget({
    Key? key,
    this.rideID,
  }) : super(key: key);

  final String? rideID;

  @override
  _DirectionWidgetState createState() => _DirectionWidgetState();
}

class _DirectionWidgetState extends State<DirectionWidget> {
  ApiCallResponse? cancelPatch;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Direction'});
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: DjangoServerGroup.rideDetailsCall.call(
        id: widget.rideID,
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
        final directionRideDetailsResponse = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryColor,
          body: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0, -1),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: custom_widgets.RouteViewStatic(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.65,
                    lineColor: Color(0xFFFF0000),
                    iOSGoogleMapsApiKey:
                        'AIzaSyCLcb0RVCdYgd1QWBZPspiVESTDpF1yLhM',
                    androidGoogleMapsApiKey:
                        'AIzaSyDzPNAE5mqLSyeCrnQM2KQS-6-BvyJtkrI',
                    webGoogleMapsApiKey:
                        'AIzaSyBAdeI1GITrMTHzndOwzKecdo9zbNFVNg4',
                    startAddress: DjangoServerGroup.rideDetailsCall
                        .address(
                          directionRideDetailsResponse.jsonBody,
                        )
                        .toString(),
                    destinationAddress: DjangoServerGroup.rideDetailsCall
                        .dropAddress(
                          directionRideDetailsResponse.jsonBody,
                        )
                        .toString(),
                    startCoordinate: functions.stringDoublesToLatLng(
                        DjangoServerGroup.rideDetailsCall
                            .pickerLocationLat(
                              directionRideDetailsResponse.jsonBody,
                            )
                            .toString(),
                        DjangoServerGroup.rideDetailsCall
                            .pickUpLaong(
                              directionRideDetailsResponse.jsonBody,
                            )
                            .toString()),
                    endCoordinate: functions.stringDoublesToLatLng(
                        DjangoServerGroup.rideDetailsCall
                            .dropLat(
                              directionRideDetailsResponse.jsonBody,
                            )
                            .toString(),
                        DjangoServerGroup.rideDetailsCall
                            .dropLong(
                              directionRideDetailsResponse.jsonBody,
                            )
                            .toString()),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 1),
                child: Container(
                  height: 350,
                  child: Stack(
                    alignment: AlignmentDirectional(0.7, -1),
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(32),
                              topRight: Radius.circular(32),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(32),
                              topRight: Radius.circular(32),
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                  topLeft: Radius.circular(32),
                                  topRight: Radius.circular(32),
                                ),
                              ),
                              child: FutureBuilder<ApiCallResponse>(
                                future: DjangoServerGroup.driverDataCall.call(
                                  uId: DjangoServerGroup.rideDetailsCall
                                      .driverUid(
                                        directionRideDetailsResponse.jsonBody,
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
                                  final columnDriverDataResponse =
                                      snapshot.data!;
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 20, 20, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
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
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8, 0, 0, 0),
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                                child: Icon(
                                                  Icons.phone,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryColor,
                                                  size: 28,
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
                                            Material(
                                              color: Colors.transparent,
                                              elevation: 0,
                                              child: ClipRRect(
                                                child: Container(
                                                  width: 100,
                                                  height: 140,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                  ),
                                                  child: RideTypeWidget(
                                                    ride: FFAppState()
                                                        .selectedRide,
                                                  ),
                                                ),
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
                                                        BorderRadius.circular(
                                                            12),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryColor,
                                                      width: 1,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
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
                                                                  .fromSTEB(36,
                                                                      0, 0, 0),
                                                          child: AutoSizeText(
                                                            DjangoServerGroup
                                                                .rideDetailsCall
                                                                .address(
                                                                  directionRideDetailsResponse
                                                                      .jsonBody,
                                                                )
                                                                .toString(),
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
                                                                  .fromSTEB(36,
                                                                      0, 0, 0),
                                                          child: Text(
                                                            DjangoServerGroup
                                                                .rideDetailsCall
                                                                .dropAddress(
                                                                  directionRideDetailsResponse
                                                                      .jsonBody,
                                                                )
                                                                .toString(),
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
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 16, 0, 8),
                                        child: Text(
                                          'Want to end the ride?',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryColor,
                                                fontSize: 16,
                                              ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(0, 1),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 0, 20, 40),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'DIRECTION_PAGE_END_RIDE_BTN_ON_TAP');
                                              logFirebaseEvent(
                                                  'Button_alert_dialog');
                                              var confirmDialogResponse =
                                                  await showDialog<bool>(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                'Cancel Ride'),
                                                            content: Text(
                                                                'Are you sure you want to cancel your ride?'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext,
                                                                        false),
                                                                child:
                                                                    Text('No'),
                                                              ),
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext,
                                                                        true),
                                                                child:
                                                                    Text('Yes'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ) ??
                                                      false;
                                              if (confirmDialogResponse) {
                                                logFirebaseEvent(
                                                    'Button_backend_call');
                                                cancelPatch =
                                                    await DjangoServerGroup
                                                        .tripStatusPatchCall
                                                        .call(
                                                  status: 'CANCELLED',
                                                  id: DjangoServerGroup
                                                      .rideDetailsCall
                                                      .id(
                                                    directionRideDetailsResponse
                                                        .jsonBody,
                                                  ),
                                                );
                                                if ((cancelPatch?.succeeded ??
                                                    true)) {
                                                  logFirebaseEvent(
                                                      'Button_navigate_to');
                                                  if (Navigator.of(context)
                                                      .canPop()) {
                                                    context.pop();
                                                  }
                                                  context.pushNamed('Pay');
                                                } else {
                                                  logFirebaseEvent(
                                                      'Button_alert_dialog');
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text('ERROR'),
                                                        content: Text(
                                                            'Cannot cancel your ride'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text('Ok'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                }
                                              }

                                              setState(() {});
                                            },
                                            text: 'End Ride',
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 35,
                                              color: Color(0xFFD9D9D9),
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .subtitle2
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
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
                      Material(
                        color: Colors.transparent,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Container(
                          width: 174,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Color(0xFFD9DBDA),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'DIRECTION_PAGE_Row_wiy4geus_ON_TAP');
                              logFirebaseEvent('Row_launch_map');
                              await launchMap(
                                location: FFAppState().endCoordinate,
                                title: FFAppState().destinationAddress,
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.locationArrow,
                                  color: Color(0xFF002F09),
                                  size: 24,
                                ),
                                Text(
                                  'D I R E C T I O N',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
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
              ),
              Align(
                alignment: AlignmentDirectional(0, -1),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(31),
                    ),
                    child: Container(
                      width: 315,
                      decoration: BoxDecoration(
                        color: Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(31),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                        child: Text(
                          'Have a nice trip',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Montserrat',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
