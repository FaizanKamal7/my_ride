import '../backend/api_requests/api_calls.dart';
import '../components/ride_type_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CoPassengersWidget extends StatefulWidget {
  const CoPassengersWidget({Key? key}) : super(key: key);

  @override
  _CoPassengersWidgetState createState() => _CoPassengersWidgetState();
}

class _CoPassengersWidgetState extends State<CoPassengersWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Co-Passengers'});
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF002F09),
      body: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional(0, -1),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.35,
              child: custom_widgets.RouteViewStatic(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.35,
                lineColor: Color(0xFFFF0000),
                iOSGoogleMapsApiKey: 'AIzaSyCLcb0RVCdYgd1QWBZPspiVESTDpF1yLhM',
                androidGoogleMapsApiKey:
                    'AIzaSyDzPNAE5mqLSyeCrnQM2KQS-6-BvyJtkrI',
                webGoogleMapsApiKey: 'AIzaSyBAdeI1GITrMTHzndOwzKecdo9zbNFVNg4',
                startAddress: FFAppState().pickupAddress,
                destinationAddress: FFAppState().destinationAddress,
                startCoordinate: FFAppState().startCoordinate!,
                endCoordinate: FFAppState().endCoordinate!,
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 9,
                child: Align(
                  alignment: AlignmentDirectional(1, -1),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
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
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(31),
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(31),
                          topRight: Radius.circular(0),
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
                          child: Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Text(
                              'Cancel',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    fontSize: 20,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 0),
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
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: FutureBuilder<ApiCallResponse>(
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 50,
                                ),
                              ),
                            );
                          }
                          final columnRideDetailsResponse = snapshot.data!;
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.77, 0.22),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 24, 0, 7),
                                  child: Container(
                                    width: 153,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFD9DBDA),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      'Upcoming',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.black,
                                            fontSize: 13,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              FutureBuilder<ApiCallResponse>(
                                future: DjangoServerGroup.driverDataCall.call(
                                  uId: DjangoServerGroup.rideDetailsCall
                                      .driverUid(
                                        columnRideDetailsResponse.jsonBody,
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
                                  final rowDriverDataResponse = snapshot.data!;
                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 0, 0),
                                        child: Container(
                                          width: 80,
                                          height: 80,
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 0, 0, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              DjangoServerGroup.driverDataCall
                                                  .name(
                                                    rowDriverDataResponse
                                                        .jsonBody,
                                                  )
                                                  .toString(),
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
                                            Text(
                                              DjangoServerGroup.driverDataCall
                                                  .vechileName(
                                                    rowDriverDataResponse
                                                        .jsonBody,
                                                  )
                                                  .toString(),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryColor,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                            ),
                                            Text(
                                              DjangoServerGroup.driverDataCall
                                                  .vechicleNo(
                                                    rowDriverDataResponse
                                                        .jsonBody,
                                                  )
                                                  .toString(),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryColor,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                            ),
                                            Text(
                                              DjangoServerGroup.driverDataCall
                                                  .rating(
                                                    rowDriverDataResponse
                                                        .jsonBody,
                                                  )
                                                  .toString(),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryColor,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: AlignmentDirectional(1, 0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 12, 0),
                                            child: InkWell(
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'CO_PASSENGERS_PAGE_Icon_tq6dhplm_ON_TAP');
                                                logFirebaseEvent(
                                                    'Icon_call_number');
                                                await launchUrl(Uri(
                                                  scheme: 'tel',
                                                  path: DjangoServerGroup
                                                      .driverDataCall
                                                      .phoneNumber(
                                                        rowDriverDataResponse
                                                            .jsonBody,
                                                      )
                                                      .toString(),
                                                ));
                                              },
                                              child: Icon(
                                                Icons.phone,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryColor,
                                                size: 28,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(1, 0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 20, 0),
                                          child: Icon(
                                            Icons.chat_bubble,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryColor,
                                            size: 28,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
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
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                          child: RideTypeWidget(
                                            ride: FFAppState().selectedRide,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 2, 0),
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
                                                        style:
                                                            FlutterFlowTheme.of(
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(36, 0, 0, 0),
                                                  child: AutoSizeText(
                                                    FFAppState().pickupAddress,
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
                                                ),
                                              ),
                                              Divider(
                                                height: 1,
                                                thickness: 1,
                                                indent: 35,
                                                endIndent: 20,
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                                        style:
                                                            FlutterFlowTheme.of(
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(36, 0, 0, 0),
                                                  child: AutoSizeText(
                                                    FFAppState()
                                                        .destinationAddress,
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
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 16, 0, 1),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 143,
                                  decoration: BoxDecoration(
                                    color: Color(0xBACDD9D9D9),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            14, 0, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 7),
                                              child: Text(
                                                'Co-Passengers',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      fontSize: 18,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15, 0, 15, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 12, 0),
                                              child: FutureBuilder<
                                                  ApiCallResponse>(
                                                future: DjangoServerGroup
                                                    .userDataCall
                                                    .call(
                                                  uId: DjangoServerGroup
                                                      .rideDetailsCall
                                                      .carpoolingUser1Uid(
                                                        columnRideDetailsResponse
                                                            .jsonBody,
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
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width: 50,
                                                        height: 50,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.asset(
                                                          'assets/images/Group.png',
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 2, 0, 0),
                                                        child: Text(
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 12,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 12, 0),
                                              child: FutureBuilder<
                                                  ApiCallResponse>(
                                                future: DjangoServerGroup
                                                    .userDataCall
                                                    .call(
                                                  uId: DjangoServerGroup
                                                      .rideDetailsCall
                                                      .carpoolingUser2Uid(
                                                        columnRideDetailsResponse
                                                            .jsonBody,
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
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width: 50,
                                                        height: 50,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.asset(
                                                          'assets/images/Group.png',
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 2, 0, 0),
                                                        child: Text(
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 12,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4, 0, 0, 0),
                                              child: FutureBuilder<
                                                  ApiCallResponse>(
                                                future: DjangoServerGroup
                                                    .userDataCall
                                                    .call(
                                                  uId: DjangoServerGroup
                                                      .rideDetailsCall
                                                      .carpoolingUser3Uid(
                                                        columnRideDetailsResponse
                                                            .jsonBody,
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
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width: 50,
                                                        height: 50,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.asset(
                                                          'assets/images/Group.png',
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 2, 0, 0),
                                                        child: Text(
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
                                                                color: Color(
                                                                    0xDA57636C),
                                                                fontSize: 12,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
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
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                      child: Text(
                        'Facalities',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Montserrat',
                              color: Color(0x7BFFFFFF),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      child: Text(
                        'AC, Luggage space, Music system',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Montserrat',
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                      child: Text(
                        'Instructions',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Montserrat',
                              color: Color(0x7BFFFFFF),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      child: Text(
                        'Smoking not allowed, Pets not allowed',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Montserrat',
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
