import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VehicleDetailsWidget extends StatefulWidget {
  const VehicleDetailsWidget({
    Key? key,
    this.fullName,
    this.dateOfBirth,
    this.gender,
    this.phoneNumber,
  }) : super(key: key);

  final String? fullName;
  final DateTime? dateOfBirth;
  final String? gender;
  final int? phoneNumber;

  @override
  _VehicleDetailsWidgetState createState() => _VehicleDetailsWidgetState();
}

class _VehicleDetailsWidgetState extends State<VehicleDetailsWidget> {
  ApiCallResponse? apiResultmw8;
  TextEditingController? insuaranceNumberController;
  TextEditingController? licenseNumberController;
  TextEditingController? vehicleNameController;
  TextEditingController? vehicleNumberController;
  TextEditingController? vehicleRegistrationNumberController;
  LatLng? currentUserLocationValue;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    insuaranceNumberController = TextEditingController();
    licenseNumberController = TextEditingController();
    vehicleNameController = TextEditingController();
    vehicleNumberController = TextEditingController();
    vehicleRegistrationNumberController = TextEditingController();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'VehicleDetails'});
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    insuaranceNumberController?.dispose();
    licenseNumberController?.dispose();
    vehicleNameController?.dispose();
    vehicleNumberController?.dispose();
    vehicleRegistrationNumberController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: true,
        title: Text(
          'Vechile Detais',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Montserrat',
                color: FlutterFlowTheme.of(context).primaryText,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
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
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                      child: Text(
                        'Vehicle Name',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Montserrat',
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: TextFormField(
                      controller: vehicleNameController,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintStyle: FlutterFlowTheme.of(context).bodyText2,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).secondaryColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).secondaryColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Color(0x33FFFFFF),
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Field is required';
                        }

                        return null;
                      },
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                      child: Text(
                        'Vehicle Number',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Montserrat',
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: TextFormField(
                      controller: vehicleNumberController,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintStyle: FlutterFlowTheme.of(context).bodyText2,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).secondaryColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).secondaryColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Color(0x33FFFFFF),
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Field is required';
                        }

                        return null;
                      },
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                      child: Text(
                        'Vehicle Registration Number',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Montserrat',
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: TextFormField(
                      controller: vehicleRegistrationNumberController,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintStyle: FlutterFlowTheme.of(context).bodyText2,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).secondaryColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).secondaryColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Color(0x33FFFFFF),
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Field is required';
                        }

                        return null;
                      },
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                      child: Text(
                        'License Number',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Montserrat',
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: TextFormField(
                      controller: licenseNumberController,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintStyle: FlutterFlowTheme.of(context).bodyText2,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).secondaryColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).secondaryColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Color(0x33FFFFFF),
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Field is required';
                        }

                        return null;
                      },
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                      child: Text(
                        'Insurance Number',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Montserrat',
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: TextFormField(
                      controller: insuaranceNumberController,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintStyle: FlutterFlowTheme.of(context).bodyText2,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).secondaryColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).secondaryColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Color(0x33FFFFFF),
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Field is required';
                        }

                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 28, 0, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'VEHICLE_DETAILS_UPDATE_DETAILS_BTN_ON_TA');
                        currentUserLocationValue = await getCurrentUserLocation(
                            defaultLocation: LatLng(0.0, 0.0));
                        logFirebaseEvent('Button_backend_call');
                        apiResultmw8 =
                            await DjangoServerGroup.driversPostCall.call(
                          uId: currentUserUid,
                          name: widget.fullName,
                          dateofbirth: functions.dateTimeFormatter(
                              widget.dateOfBirth, 'yyyy-MM-dd'),
                          gender: widget.gender,
                          phonenumber: functions
                              .stringToInt(widget.phoneNumber!.toString()),
                          vehicleNo: vehicleNumberController!.text,
                          vichleName: vehicleNameController!.text,
                          licenseNo: licenseNumberController!.text,
                          insuranceNo: insuaranceNumberController!.text,
                          earnings: 0,
                          allRides: '0',
                          lastLocationLat: functions.getLatORLngInt(
                              true, false, currentUserLocationValue!),
                          currentLocationLat: functions.getLatORLngInt(
                              true, false, currentUserLocationValue!),
                          lastLocationLong: functions.getLatORLngInt(
                              false, true, currentUserLocationValue!),
                          currentLocationLong: functions.getLatORLngInt(
                              false, true, currentUserLocationValue!),
                        );
                        if ((apiResultmw8?.succeeded ?? true)) {
                          logFirebaseEvent('Button_update_local_state');
                          FFAppState().update(() {
                            FFAppState().userdata =
                                (apiResultmw8?.jsonBody ?? '');
                          });
                          logFirebaseEvent('Button_navigate_to');

                          context.goNamed('OnlineOffline');
                        } else {
                          logFirebaseEvent('Button_alert_dialog');
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Error Updating Details'),
                                content: Text(
                                    'Error: ${(apiResultmw8?.statusCode ?? 200).toString()}'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                        }

                        setState(() {});
                      },
                      text: 'Update Details',
                      options: FFButtonOptions(
                        width: 350,
                        height: 55,
                        color: FlutterFlowTheme.of(context).secondaryColor,
                        textStyle: FlutterFlowTheme.of(context).title1.override(
                              fontFamily: 'Montserrat',
                              fontSize: 20,
                            ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
