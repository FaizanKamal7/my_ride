import '../backend/api_requests/api_calls.dart';
import '../components/drawer_widget.dart';
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

class OfferingFareWidget extends StatefulWidget {
  const OfferingFareWidget({Key? key}) : super(key: key);

  @override
  _OfferingFareWidgetState createState() => _OfferingFareWidgetState();
}

class _OfferingFareWidgetState extends State<OfferingFareWidget> {
  ApiCallResponse? rideStatus;
  InstantTimer? instantTimer;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('OFFERING_FARE_OfferingFare_ON_LOAD');
      logFirebaseEvent('OfferingFare_start_periodic_action');
      instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 1000),
        callback: (timer) async {
          logFirebaseEvent('OfferingFare_backend_call');
          rideStatus = await DjangoServerGroup.tripStatusCall.call(
            tripId: FFAppState().rideID,
          );
          if (DjangoServerGroup.tripStatusCall
                  .statusGet(
                    (rideStatus?.jsonBody ?? ''),
                  )
                  .toString() ==
              'BOOKED') {
            logFirebaseEvent('OfferingFare_navigate_to');
            if (Navigator.of(context).canPop()) {
              context.pop();
            }
            context.pushNamed('DriverOffers');

            logFirebaseEvent('OfferingFare_stop_periodic_action');
            instantTimer?.cancel();
          }
        },
        startImmediately: true,
      );
    });

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'OfferingFare'});
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
        final offeringFareRideDetailsResponse = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          drawer: Drawer(
            elevation: 16,
            child: DrawerWidget(),
          ),
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
              Align(
                alignment: AlignmentDirectional(0, -1),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                              child: InkWell(
                                onTap: () async {
                                  logFirebaseEvent(
                                      'OFFERING_FARE_Container_fh8ppdt3_ON_TAP');
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
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
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Offering fare to drivers',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Montserrat',
                                            fontSize: 20,
                                          ),
                                    ),
                                    Text(
                                      'Please wait...',
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
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1, 1),
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
                            height: 250,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primaryColor,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                                topLeft: Radius.circular(32),
                                topRight: Radius.circular(32),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 24, 0, 0),
                                    child: Text(
                                      'Ride Info',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryColor,
                                            fontSize: 18,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 10, 20, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ClipRRect(
                                        child: Container(
                                          width: 100,
                                          height: 150,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                          child: RideTypeWidget(
                                            ride: FFAppState().selectedRide,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 0, 20, 0),
                                          child: Container(
                                            width: 238,
                                            height: 124,
                                            decoration: BoxDecoration(
                                              color: Color(0x33FFFFFF),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryColor,
                                                width: 1,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 8, 0, 0),
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
                                                                    8, 0, 0, 0),
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
                                                            .fromSTEB(
                                                                36, 0, 0, 0),
                                                    child: AutoSizeText(
                                                      valueOrDefault<String>(
                                                        DjangoServerGroup
                                                            .rideDetailsCall
                                                            .address(
                                                              offeringFareRideDetailsResponse
                                                                  .jsonBody,
                                                            )
                                                            .toString(),
                                                        'ERROR!!',
                                                      ),
                                                      maxLines: 2,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryColor,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 8, 0, 0),
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
                                                                    8, 0, 0, 0),
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
                                                            .fromSTEB(
                                                                36, 0, 0, 0),
                                                    child: AutoSizeText(
                                                      valueOrDefault<String>(
                                                        DjangoServerGroup
                                                            .rideDetailsCall
                                                            .dropAddress(
                                                              offeringFareRideDetailsResponse
                                                                  .jsonBody,
                                                            )
                                                            .toString(),
                                                        'ERROR!!',
                                                      ),
                                                      maxLines: 2,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                            ),
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
