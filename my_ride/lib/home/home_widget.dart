import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../components/drawer_widget.dart';
import '../components/ride_type_widget.dart';
import '../flutter_flow/flutter_flow_google_map.dart';
import '../flutter_flow/flutter_flow_place_picker.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/instant_timer.dart';
import '../flutter_flow/place.dart';
import 'dart:io';
import '../custom_code/widgets/index.dart' as custom_widgets;
import '../flutter_flow/custom_functions.dart' as functions;
import '../flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  ApiCallResponse? driverData;
  ApiCallResponse? userData;
  InstantTimer? instantTimer;
  LatLng? currentUserLocationValue;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  ApiCallResponse? newRide;
  TextEditingController? textController;
  var placePickerValue1 = FFPlace();
  var placePickerValue2 = FFPlace();
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HOME_PAGE_Home_ON_PAGE_LOAD');
      if (FFAppState().locationPermission) {
        logFirebaseEvent('Home_update_local_state');
        FFAppState().update(() {
          FFAppState().locationPermission = true;
        });
      } else {
        logFirebaseEvent('Home_update_local_state');
        FFAppState().update(() {
          FFAppState().locationPermission = false;
        });
        logFirebaseEvent('Home_start_periodic_action');
        instantTimer = InstantTimer.periodic(
          duration: Duration(milliseconds: 5000),
          callback: (timer) async {
            logFirebaseEvent('Home_request_permissions');
            await requestPermission(locationPermission);
            if (await getPermissionStatus(locationPermission)) {
              logFirebaseEvent('Home_update_local_state');
              FFAppState().update(() {
                FFAppState().locationPermission = true;
              });
              logFirebaseEvent('Home_stop_periodic_action');
              null?.cancel();
            }
          },
          startImmediately: true,
        );
      }

      if (valueOrDefault(currentUserDocument?.userType, '') != null &&
          valueOrDefault(currentUserDocument?.userType, '') != '') {
        if (valueOrDefault(currentUserDocument?.userType, '') == 'User') {
          logFirebaseEvent('Home_backend_call');
          userData = await DjangoServerGroup.userDataCall.call(
            uId: currentUserUid,
          );
          if ((DjangoServerGroup.userDataCall
                      .dateOfBIrth(
                        (userData?.jsonBody ?? ''),
                      )
                      .toString() !=
                  'null') &&
              (DjangoServerGroup.userDataCall
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
                      '') &&
              (userData?.succeeded ?? true)) {
            logFirebaseEvent('Home_update_local_state');
            FFAppState().update(() {
              FFAppState().userdata = (userData?.jsonBody ?? '');
            });
          } else {
            logFirebaseEvent('Home_navigate_to');

            context.goNamed(
              'Register',
              extra: <String, dynamic>{
                kTransitionInfoKey: TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.fade,
                  duration: Duration(milliseconds: 0),
                ),
              },
            );
          }
        } else {
          logFirebaseEvent('Home_backend_call');
          driverData = await DjangoServerGroup.driverDataCall.call(
            uId: currentUserUid,
          );
          if ((DjangoServerGroup.driverDataCall
                      .dateOfBirth(
                        (driverData?.jsonBody ?? ''),
                      )
                      .toString() !=
                  'null') &&
              (DjangoServerGroup.driverDataCall
                          .dateOfBirth(
                            (driverData?.jsonBody ?? ''),
                          )
                          .toString() !=
                      null &&
                  DjangoServerGroup.driverDataCall
                          .dateOfBirth(
                            (driverData?.jsonBody ?? ''),
                          )
                          .toString() !=
                      '') &&
              (driverData?.succeeded ?? true)) {
            logFirebaseEvent('Home_update_local_state');
            FFAppState().update(() {
              FFAppState().userdata = (driverData?.jsonBody ?? '');
            });
            logFirebaseEvent('Home_navigate_to');

            context.goNamed(
              'OnlineOffline',
              extra: <String, dynamic>{
                kTransitionInfoKey: TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.fade,
                  duration: Duration(milliseconds: 0),
                ),
              },
            );
          } else {
            logFirebaseEvent('Home_navigate_to');

            context.goNamed(
              'Register',
              extra: <String, dynamic>{
                kTransitionInfoKey: TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.fade,
                  duration: Duration(milliseconds: 0),
                ),
              },
            );
          }
        }
      } else {
        logFirebaseEvent('Home_navigate_to');

        context.goNamed(
          'Register',
          extra: <String, dynamic>{
            kTransitionInfoKey: TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
            ),
          },
        );
      }
    });

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Home'});
    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    textController = TextEditingController();
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    instantTimer?.cancel();
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50,
            height: 50,
            child: SpinKitDoubleBounce(
              color: FlutterFlowTheme.of(context).primaryColor,
              size: 50,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      drawer: Drawer(
        elevation: 16,
        child: DrawerWidget(),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (FFAppState().locationPermission)
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 1,
                    child: Stack(
                      alignment: AlignmentDirectional(0, 1),
                      children: [
                        if ((placePickerValue1.address != null &&
                                placePickerValue1.address != '') &&
                            (placePickerValue2.address != null &&
                                placePickerValue2.address != ''))
                          Align(
                            alignment: AlignmentDirectional(0, -1),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.4,
                              child: custom_widgets.RouteViewStatic(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                lineColor: Color(0xFFFF0000),
                                iOSGoogleMapsApiKey:
                                    'AIzaSyCLcb0RVCdYgd1QWBZPspiVESTDpF1yLhM',
                                androidGoogleMapsApiKey:
                                    'AIzaSyDzPNAE5mqLSyeCrnQM2KQS-6-BvyJtkrI',
                                webGoogleMapsApiKey:
                                    'AIzaSyBAdeI1GITrMTHzndOwzKecdo9zbNFVNg4',
                                startAddress: placePickerValue1.address,
                                destinationAddress: placePickerValue2.address,
                                startCoordinate:
                                    placePickerValue1.address != null &&
                                            placePickerValue1.address != ''
                                        ? placePickerValue1.latLng
                                        : currentUserLocationValue!,
                                endCoordinate:
                                    placePickerValue2.address != null &&
                                            placePickerValue2.address != ''
                                        ? placePickerValue2.latLng
                                        : currentUserLocationValue!,
                              ),
                            ),
                          ),
                        if (!((placePickerValue1.address != null &&
                                placePickerValue1.address != '') &&
                            (placePickerValue2.address != null &&
                                placePickerValue2.address != '')))
                          Align(
                            alignment: AlignmentDirectional(0, -1),
                            child: Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.4,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: FlutterFlowGoogleMap(
                                controller: googleMapsController,
                                onCameraIdle: (latLng) =>
                                    googleMapsCenter = latLng,
                                initialLocation: googleMapsCenter ??=
                                    currentUserLocationValue!,
                                markerColor: GoogleMarkerColor.violet,
                                mapType: MapType.normal,
                                style: GoogleMapStyle.standard,
                                initialZoom: 14,
                                allowInteraction: true,
                                allowZoom: true,
                                showZoomControls: true,
                                showLocation: true,
                                showCompass: false,
                                showMapToolbar: false,
                                showTraffic: false,
                                centerMapOnMarkerTap: true,
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
                              height: 560,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 12, 12, 0),
                                    child: Text(
                                      'Choose Your Ride',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Builder(
                                        builder: (context) {
                                          final rideType = FFAppState()
                                              .allRideTypes
                                              .toList();
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: rideType.length,
                                            itemBuilder:
                                                (context, rideTypeIndex) {
                                              final rideTypeItem =
                                                  rideType[rideTypeIndex];
                                              return Stack(
                                                children: [
                                                  if (false)
                                                    Image.asset(
                                                      'assets/images/ridemini.png',
                                                      width: 100,
                                                      height: 100,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  if (false)
                                                    Image.asset(
                                                      'assets/images/rideac.png',
                                                      width: 100,
                                                      height: 100,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  if (false)
                                                    Image.asset(
                                                      'assets/images/luxury.png',
                                                      width: 100,
                                                      height: 100,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  if (false)
                                                    Image.asset(
                                                      'assets/images/bike.png',
                                                      width: 100,
                                                      height: 100,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  InkWell(
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'HOME_PAGE_Container_bt5i2c5h_ON_TAP');
                                                      logFirebaseEvent(
                                                          'RideType_update_local_state');
                                                      FFAppState().update(() {
                                                        FFAppState()
                                                                .selectedRide =
                                                            rideTypeItem;
                                                      });
                                                    },
                                                    child: RideTypeWidget(
                                                      key: UniqueKey(),
                                                      ride: rideTypeItem,
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                      width: double.infinity,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(0),
                                          bottomRight: Radius.circular(0),
                                          topLeft: Radius.circular(24),
                                          topRight: Radius.circular(24),
                                        ),
                                      ),
                                      child: Container(
                                        width: double.infinity,
                                        child: Form(
                                          key: formKey,
                                          autovalidateMode:
                                              AutovalidateMode.disabled,
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 0, 12, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 12, 0, 0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 4,
                                                                    12, 4),
                                                        child: Icon(
                                                          Icons
                                                              .location_history,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                          size: 16,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          child: Container(
                                                            width: 100,
                                                            height: 50,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                            ),
                                                            child:
                                                                FlutterFlowPlacePicker(
                                                              iOSGoogleMapsApiKey:
                                                                  'AIzaSyCLcb0RVCdYgd1QWBZPspiVESTDpF1yLhM',
                                                              androidGoogleMapsApiKey:
                                                                  'AIzaSyDzPNAE5mqLSyeCrnQM2KQS-6-BvyJtkrI',
                                                              webGoogleMapsApiKey:
                                                                  'AIzaSyBAdeI1GITrMTHzndOwzKecdo9zbNFVNg4',
                                                              onSelect:
                                                                  (place) async {
                                                                setState(() =>
                                                                    placePickerValue1 =
                                                                        place);
                                                              },
                                                              defaultText:
                                                                  'Select Pickup Location',
                                                              buttonOptions:
                                                                  FFButtonOptions(
                                                                width: double
                                                                    .infinity,
                                                                height: 40,
                                                                color: Colors
                                                                    .transparent,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: Color(
                                                                          0x8057636C),
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                                elevation: 0,
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Colors
                                                                      .transparent,
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 12, 0, 0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 4,
                                                                    12, 4),
                                                        child: Icon(
                                                          Icons.pin_drop,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                          size: 16,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          child: Container(
                                                            width: 100,
                                                            height: 50,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                            ),
                                                            child:
                                                                FlutterFlowPlacePicker(
                                                              iOSGoogleMapsApiKey:
                                                                  'AIzaSyCLcb0RVCdYgd1QWBZPspiVESTDpF1yLhM',
                                                              androidGoogleMapsApiKey:
                                                                  'AIzaSyDzPNAE5mqLSyeCrnQM2KQS-6-BvyJtkrI',
                                                              webGoogleMapsApiKey:
                                                                  'AIzaSyBAdeI1GITrMTHzndOwzKecdo9zbNFVNg4',
                                                              onSelect:
                                                                  (place) async {
                                                                setState(() =>
                                                                    placePickerValue2 =
                                                                        place);
                                                              },
                                                              defaultText:
                                                                  'Select Drop Location',
                                                              buttonOptions:
                                                                  FFButtonOptions(
                                                                width: 200,
                                                                height: 50,
                                                                color: Colors
                                                                    .transparent,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: Color(
                                                                          0x8057636C),
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                                elevation: 0,
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Colors
                                                                      .transparent,
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 12, 0, 0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 4,
                                                                    12, 4),
                                                        child: FaIcon(
                                                          FontAwesomeIcons
                                                              .rupeeSign,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                          size: 16,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height: 50,
                                                          child: custom_widgets
                                                              .FareTextField(
                                                            width:
                                                                double.infinity,
                                                            height: 50,
                                                            initialValue:
                                                                FFAppState()
                                                                    .routeFare,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Divider(
                                                  height: 20,
                                                  thickness: 0.5,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 4, 12, 4),
                                                      child: Icon(
                                                        Icons.comment,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        size: 16,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: TextFormField(
                                                        controller:
                                                            textController,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          isDense: true,
                                                          hintText:
                                                              'Add extra comments for riders',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyText2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: Color(
                                                                        0x8057636C),
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              width: 1,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              width: 1,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0xFFFF0000),
                                                              width: 1,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0xFFFF0000),
                                                              width: 1,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                          ),
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText2
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 16, 0, 0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'HOME_PAGE_BOOK_NOW_BTN_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Button_update_local_state');
                                                      FFAppState().update(() {
                                                        FFAppState().date = functions
                                                            .dateTimeFormatter(
                                                                getCurrentTimestamp,
                                                                'yyyy-MM-dd');
                                                        FFAppState().time = functions
                                                            .dateTimeFormatter(
                                                                getCurrentTimestamp,
                                                                'hh:mm:ss');
                                                        FFAppState()
                                                                .pickupAddress =
                                                            placePickerValue1
                                                                .address;
                                                        FFAppState()
                                                                .destinationAddress =
                                                            placePickerValue2
                                                                .address;
                                                        FFAppState()
                                                                .startCoordinate =
                                                            placePickerValue1
                                                                .latLng;
                                                        FFAppState()
                                                                .endCoordinate =
                                                            placePickerValue2
                                                                .latLng;
                                                      });
                                                      logFirebaseEvent(
                                                          'Button_backend_call');
                                                      newRide =
                                                          await DjangoServerGroup
                                                              .newRideCall
                                                              .call(
                                                        userUid: currentUserUid,
                                                        ride: getJsonField(
                                                          FFAppState()
                                                              .selectedRide,
                                                          r'''$.name''',
                                                        ).toString(),
                                                        date: FFAppState().date,
                                                        rideTime:
                                                            FFAppState().time,
                                                        fare: functions
                                                            .stringToInt(
                                                                FFAppState()
                                                                    .routeFare),
                                                        pickupLocationLat: functions
                                                            .getLatORLngInt(
                                                                true,
                                                                false,
                                                                FFAppState()
                                                                    .startCoordinate!),
                                                        pickupLocationLong:
                                                            functions
                                                                .getLatORLngInt(
                                                                    false,
                                                                    true,
                                                                    FFAppState()
                                                                        .startCoordinate!),
                                                        dropLocationLat: functions
                                                            .getLatORLngInt(
                                                                true,
                                                                false,
                                                                FFAppState()
                                                                    .endCoordinate!),
                                                        dropLocationLong: functions
                                                            .getLatORLngInt(
                                                                false,
                                                                true,
                                                                FFAppState()
                                                                    .endCoordinate!),
                                                        address: FFAppState()
                                                            .pickupAddress,
                                                        dropAddress: FFAppState()
                                                            .destinationAddress,
                                                      );
                                                      if ((newRide?.succeeded ??
                                                          true)) {
                                                        logFirebaseEvent(
                                                            'Button_update_local_state');
                                                        FFAppState().update(() {
                                                          FFAppState().rideID =
                                                              DjangoServerGroup
                                                                  .newRideCall
                                                                  .rideId(
                                                                    (newRide?.jsonBody ??
                                                                        ''),
                                                                  )
                                                                  .toString();
                                                        });
                                                        logFirebaseEvent(
                                                            'Button_navigate_to');

                                                        context.pushNamed(
                                                            'OfferingFare');
                                                      } else {
                                                        logFirebaseEvent(
                                                            'Button_alert_dialog');
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title:
                                                                  Text('Error'),
                                                              content: Text(
                                                                  'Failed to book a ride'),
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
                                                    text: 'Book Now',
                                                    options: FFButtonOptions(
                                                      width: double.infinity,
                                                      height: 40,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle2
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 12, 0, 0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'HOME_BOOOK_FOR_LATER_CARPOOLING_BTN_ON_T');
                                                      logFirebaseEvent(
                                                          'Button_update_local_state');
                                                      FFAppState().update(() {
                                                        FFAppState()
                                                                .startCoordinate =
                                                            placePickerValue1
                                                                .latLng;
                                                        FFAppState()
                                                                .endCoordinate =
                                                            placePickerValue2
                                                                .latLng;
                                                      });
                                                      logFirebaseEvent(
                                                          'Button_update_local_state');
                                                      FFAppState().update(() {
                                                        FFAppState()
                                                                .pickupAddress =
                                                            placePickerValue1
                                                                .address;
                                                        FFAppState()
                                                                .destinationAddress =
                                                            placePickerValue2
                                                                .address;
                                                      });
                                                      logFirebaseEvent(
                                                          'Button_navigate_to');
                                                      if (Navigator.of(context)
                                                          .canPop()) {
                                                        context.pop();
                                                      }
                                                      context.pushNamed(
                                                          'SelectDateNTime');
                                                    },
                                                    text:
                                                        'Boook for later / Carpooling',
                                                    options: FFButtonOptions(
                                                      width: double.infinity,
                                                      height: 40,
                                                      color: Colors.transparent,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle2
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                      elevation: 0,
                                                      borderSide: BorderSide(
                                                        color: Colors.black,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                  ),
                                                ),
                                              ],
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
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1, -1),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(24, 24, 0, 0),
                            child: InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                    'HOME_PAGE_Container_jby9spaz_ON_TAP');
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
                      ],
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
