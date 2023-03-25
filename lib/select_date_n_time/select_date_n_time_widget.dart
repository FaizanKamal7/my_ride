import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../components/drawer_widget.dart';
import '../components/ride_type_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/instant_timer.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import '../flutter_flow/custom_functions.dart' as functions;
import '../flutter_flow/permissions_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SelectDateNTimeWidget extends StatefulWidget {
  const SelectDateNTimeWidget({Key? key}) : super(key: key);

  @override
  _SelectDateNTimeWidgetState createState() => _SelectDateNTimeWidgetState();
}

class _SelectDateNTimeWidgetState extends State<SelectDateNTimeWidget> {
  ApiCallResponse? newRide;
  DateTime? datePicked1;
  DateTime? datePicked2;
  String? dropDownValue;
  ApiCallResponse? userData;
  InstantTimer? instantTimer;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SELECT_DATE_N_TIME_SelectDateNTime_ON_LO');
      logFirebaseEvent('SelectDateNTime_backend_call');
      userData = await DjangoServerGroup.userDataCall.call(
        uId: currentUserUid,
      );
      if (DjangoServerGroup.userDataCall
                  .dateOfBIrth(
                    (userData?.jsonBody ?? ''),
                  )
                  .toString() !=
              null &&
          DjangoServerGroup.userDataCall
                  .dateOfBIrth(
                    (userData?.jsonBody ?? ''),
                  )
                  .toString() !=
              '') {
        logFirebaseEvent('SelectDateNTime_update_local_state');
        FFAppState().update(() {
          FFAppState().userdata = (userData?.jsonBody ?? '');
        });
        logFirebaseEvent('SelectDateNTime_start_periodic_action');
        instantTimer = InstantTimer.periodic(
          duration: Duration(milliseconds: 1000),
          callback: (timer) async {
            logFirebaseEvent('SelectDateNTime_request_permissions');
            await requestPermission(locationPermission);
            if (await getPermissionStatus(locationPermission)) {
              logFirebaseEvent('SelectDateNTime_stop_periodic_action');
              null?.cancel();
            }
          },
          startImmediately: true,
        );
      } else {
        logFirebaseEvent('SelectDateNTime_navigate_to');

        context.pushNamed('Register');
      }
    });

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SelectDateNTime'});
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
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Visibility(
          visible: (userData?.succeeded ?? true),
          child: Stack(
            alignment: AlignmentDirectional(0, 1),
            children: [
              Align(
                alignment: AlignmentDirectional(0, -1),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: custom_widgets.RouteViewStatic(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.45,
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
              Material(
                color: Colors.transparent,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 500,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(12, 22, 12, 0),
                          child: Text(
                            'Select the date and time',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Montserrat',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      fontSize: 18,
                                    ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                          child: Container(
                            width: double.infinity,
                            height: 140,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RideTypeWidget(
                                  ride: FFAppState().selectedRide,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 20, 0),
                                  child: Container(
                                    width: 238,
                                    height: 124,
                                    decoration: BoxDecoration(
                                      color: Color(0x33FFFFFF),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        width: 1,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 8, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Image.asset(
                                                'assets/images/pickuppng.png',
                                                width: 20,
                                                height: 20,
                                                fit: BoxFit.contain,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 0, 0, 0),
                                                child: Text(
                                                  'Pickup',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color:
                                                            Color(0x70FFFFFF),
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    36, 0, 0, 0),
                                            child: AutoSizeText(
                                              FFAppState().pickupAddress,
                                              maxLines: 2,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          height: 1,
                                          thickness: 1,
                                          indent: 35,
                                          endIndent: 20,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 8, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Image.asset(
                                                'assets/images/marker.png',
                                                width: 20,
                                                height: 20,
                                                fit: BoxFit.contain,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 0, 0, 0),
                                                child: Text(
                                                  'Drop off',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color:
                                                            Color(0x70FFFFFF),
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    36, 0, 0, 0),
                                            child: AutoSizeText(
                                              FFAppState().destinationAddress,
                                              maxLines: 2,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    14, 16, 0, 16),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'No of Co-Passengers',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 6, 20, 0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Container(
                                              width: 72,
                                              height: 27,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFD9D9D9),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(
                                                  color: Color(0xFF002F09),
                                                  width: 1,
                                                ),
                                              ),
                                              child:
                                                  FlutterFlowDropDown<String>(
                                                initialOption: dropDownValue ??=
                                                    '0',
                                                options: ['0', '1', '2', '3'],
                                                onChanged: (val) => setState(
                                                    () => dropDownValue = val),
                                                width: 180,
                                                height: 50,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.black,
                                                        ),
                                                elevation: 2,
                                                borderColor: Colors.transparent,
                                                borderWidth: 0,
                                                borderRadius: 0,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(12, 4, 12, 4),
                                                hidesUnderline: true,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: double.infinity,
                          height: 305,
                          decoration: BoxDecoration(
                            color: Color(0xFFD9D9D9),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                                child: Container(
                                  width: 336,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF5F5F5),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: Color(0xFF37447F),
                                      width: 1,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            23, 0, 0, 0),
                                        child: Image.asset(
                                          'assets/images/dist.png',
                                          width: 20,
                                          height: 17.4,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 0, 0, 0),
                                          child: AutoSizeText(
                                            '${FFAppState().routeDistance} km',
                                            maxLines: 1,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: Color(0xFF002F09),
                                                  fontSize: 12,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            17, 0, 0, 0),
                                        child: Container(
                                          height: 20,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF37447F),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            23, 0, 0, 0),
                                        child: Image.asset(
                                          'assets/images/clock.png',
                                          width: 20,
                                          height: 17.4,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 0, 0, 0),
                                          child: AutoSizeText(
                                            FFAppState().routeDuration,
                                            maxLines: 1,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: Color(0xFF002F09),
                                                  fontSize: 12,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            17, 0, 0, 0),
                                        child: Container(
                                          height: 20,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF37447F),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            23, 0, 0, 0),
                                        child: Image.asset(
                                          'assets/images/fare.png',
                                          width: 20,
                                          height: 17.4,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 0, 0, 0),
                                          child: AutoSizeText(
                                            'Rs. ${FFAppState().routeFare}',
                                            maxLines: 1,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: Color(0xFF002F09),
                                                  fontSize: 12,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 19, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(-1, 0),
                                      child: InkWell(
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'SELECT_DATE_N_TIME_Container_0izw5rgd_ON');
                                          logFirebaseEvent(
                                              'Container_date_time_picker');
                                          final _datePicked1Date =
                                              await showDatePicker(
                                            context: context,
                                            initialDate: getCurrentTimestamp,
                                            firstDate: getCurrentTimestamp,
                                            lastDate: DateTime(2050),
                                          );

                                          if (_datePicked1Date != null) {
                                            setState(
                                              () => datePicked1 = DateTime(
                                                _datePicked1Date.year,
                                                _datePicked1Date.month,
                                                _datePicked1Date.day,
                                              ),
                                            );
                                          }
                                        },
                                        child: Container(
                                          width: 161,
                                          height: 45,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF5F5F5),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                              color: Color(0xFF37447F),
                                              width: 1,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16, 0, 0, 0),
                                                  child: AutoSizeText(
                                                    valueOrDefault<String>(
                                                      datePicked1 == null
                                                          ? 'Pickup Date'
                                                          : dateTimeFormat(
                                                              'd/M/y',
                                                              datePicked1,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                      'Pickup Date',
                                                    ),
                                                    maxLines: 1,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 13, 0),
                                                child: Image.asset(
                                                  'assets/images/date.png',
                                                  width: 20,
                                                  height: 20,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(1, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            14, 0, 0, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'SELECT_DATE_N_TIME_Container_s6izpr5i_ON');
                                            logFirebaseEvent(
                                                'Container_date_time_picker');

                                            final _datePicked2Time =
                                                await showTimePicker(
                                              context: context,
                                              initialTime:
                                                  TimeOfDay.fromDateTime(
                                                      getCurrentTimestamp),
                                            );
                                            if (_datePicked2Time != null) {
                                              setState(
                                                () => datePicked2 = DateTime(
                                                  getCurrentTimestamp.year,
                                                  getCurrentTimestamp.month,
                                                  getCurrentTimestamp.day,
                                                  _datePicked2Time.hour,
                                                  _datePicked2Time.minute,
                                                ),
                                              );
                                            }
                                          },
                                          child: Container(
                                            width: 161,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF5F5F5),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                color: Color(0xFF37447F),
                                                width: 1,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16, 0, 0, 0),
                                                    child: AutoSizeText(
                                                      valueOrDefault<String>(
                                                        datePicked2 == null
                                                            ? 'Pickup Time'
                                                            : dateTimeFormat(
                                                                'jm',
                                                                datePicked2,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ),
                                                        'Pickup Time',
                                                      ),
                                                      maxLines: 1,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 13, 0),
                                                  child: Image.asset(
                                                    'assets/images/date.png',
                                                    width: 20,
                                                    height: 20,
                                                    fit: BoxFit.contain,
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
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    18, 30, 18, 0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'SELECT_DATE_N_TIME_BOOK_NOW_BTN_ON_TAP');
                                    logFirebaseEvent(
                                        'Button_update_local_state');
                                    FFAppState().update(() {
                                      FFAppState().date =
                                          functions.dateTimeFormatter(
                                              datePicked1, 'yyyy-MM-dd');
                                      FFAppState().time =
                                          functions.dateTimeFormatter(
                                              datePicked2, 'hh:mm:ss');
                                    });
                                    logFirebaseEvent('Button_backend_call');
                                    newRide = await DjangoServerGroup
                                        .newRideCall
                                        .call(
                                      userUid: currentUserUid,
                                      ride: getJsonField(
                                        FFAppState().selectedRide,
                                        r'''$.name''',
                                      ).toString(),
                                      date: FFAppState().date,
                                      rideTime: FFAppState().time,
                                      fare: functions
                                          .stringToInt(FFAppState().routeFare),
                                      pickupLocationLat:
                                          functions.getLatORLngInt(true, false,
                                              FFAppState().startCoordinate!),
                                      pickupLocationLong:
                                          functions.getLatORLngInt(false, true,
                                              FFAppState().startCoordinate!),
                                      dropLocationLat: functions.getLatORLngInt(
                                          true,
                                          false,
                                          FFAppState().endCoordinate!),
                                      dropLocationLong:
                                          functions.getLatORLngInt(false, true,
                                              FFAppState().endCoordinate!),
                                      address: FFAppState().pickupAddress,
                                      dropAddress:
                                          FFAppState().destinationAddress,
                                    );
                                    if ((newRide?.succeeded ?? true)) {
                                      logFirebaseEvent(
                                          'Button_update_local_state');
                                      FFAppState().update(() {
                                        FFAppState().rideID =
                                            DjangoServerGroup.newRideCall
                                                .ride(
                                                  (newRide?.jsonBody ?? ''),
                                                )
                                                .toString();
                                      });
                                      logFirebaseEvent('Button_navigate_to');

                                      context.pushNamed('OfferingFare');
                                    } else {
                                      logFirebaseEvent('Button_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Error'),
                                            content:
                                                Text('Failed to book a ride'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }

                                    setState(() {});
                                  },
                                  text: 'Book Now',
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 40,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Colors.white,
                                        ),
                                    elevation: 5,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
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
              Align(
                alignment: AlignmentDirectional(-1, -1),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 24, 0, 0),
                  child: InkWell(
                    onTap: () async {
                      logFirebaseEvent(
                          'SELECT_DATE_N_TIME_Container_xgz8dewv_ON');
                      logFirebaseEvent('Container_drawer');
                      scaffoldKey.currentState!.openDrawer();
                    },
                    child: Material(
                      color: Colors.transparent,
                      elevation: 5,
                      shape: const CircleBorder(),
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                          child: Icon(
                            Icons.menu,
                            color: FlutterFlowTheme.of(context).secondaryColor,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
