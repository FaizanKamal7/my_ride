import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_place_picker.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/place.dart';
import 'dart:io';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DeliveryWidget extends StatefulWidget {
  const DeliveryWidget({Key? key}) : super(key: key);

  @override
  _DeliveryWidgetState createState() => _DeliveryWidgetState();
}

class _DeliveryWidgetState extends State<DeliveryWidget> {
  ApiCallResponse? apiResultvi1;
  TextEditingController? textController;
  var placePickerValue1 = FFPlace();
  var placePickerValue2 = FFPlace();
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Delivery'});
    textController = TextEditingController();
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            logFirebaseEvent('DELIVERY_arrow_back_rounded_ICN_ON_TAP');
            logFirebaseEvent('IconButton_navigate_to');
            if (Navigator.of(context).canPop()) {
              context.pop();
            }
            context.pushNamed(
              'Home',
              extra: <String, dynamic>{
                kTransitionInfoKey: TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.rightToLeft,
                ),
              },
            );
          },
        ),
        title: Text(
          'Set up your task',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Montserrat',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 24, 12, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.15,
                  decoration: BoxDecoration(
                    color: Color(0xD137447F),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                              child: Text(
                                'Sending high value/fragile',
                                style: FlutterFlowTheme.of(context)
                                    .subtitle1
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      fontSize: 16,
                                    ),
                              ),
                            ),
                            Text(
                              'items are not recomended',
                              style: FlutterFlowTheme.of(context)
                                  .subtitle1
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    fontSize: 14,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 24),
                        child: Container(
                          width: 120,
                          height: 120,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/images/play_store_512.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                child: TextFormField(
                  controller: textController,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Add task details...',
                    hintStyle: FlutterFlowTheme.of(context).bodyText2,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primaryText,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primaryText,
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
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1,
                  maxLines: 4,
                ),
              ),
              Expanded(
                child: Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).lineColor,
                                width: 1,
                              ),
                            ),
                            child: FlutterFlowPlacePicker(
                              iOSGoogleMapsApiKey:
                                  'AIzaSyCLcb0RVCdYgd1QWBZPspiVESTDpF1yLhM',
                              androidGoogleMapsApiKey:
                                  'AIzaSyDzPNAE5mqLSyeCrnQM2KQS-6-BvyJtkrI',
                              webGoogleMapsApiKey:
                                  'AIzaSyBAdeI1GITrMTHzndOwzKecdo9zbNFVNg4',
                              onSelect: (place) async {
                                setState(() => placePickerValue1 = place);
                              },
                              defaultText: 'Select Pickup Location',
                              icon: Icon(
                                Icons.place,
                                color: Colors.white,
                                size: 16,
                              ),
                              buttonOptions: FFButtonOptions(
                                width: 200,
                                height: 40,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).lineColor,
                                width: 1,
                              ),
                            ),
                            child: FlutterFlowPlacePicker(
                              iOSGoogleMapsApiKey:
                                  'AIzaSyCLcb0RVCdYgd1QWBZPspiVESTDpF1yLhM',
                              androidGoogleMapsApiKey:
                                  'AIzaSyDzPNAE5mqLSyeCrnQM2KQS-6-BvyJtkrI',
                              webGoogleMapsApiKey:
                                  'AIzaSyBAdeI1GITrMTHzndOwzKecdo9zbNFVNg4',
                              onSelect: (place) async {
                                setState(() => placePickerValue2 = place);
                              },
                              defaultText: 'Select Delivery Location',
                              icon: Icon(
                                Icons.place,
                                color: Colors.white,
                                size: 16,
                              ),
                              buttonOptions: FFButtonOptions(
                                width: 200,
                                height: 40,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('DELIVERY_PAGE_PROCEED_BTN_ON_TAP');
                    logFirebaseEvent('Button_backend_call');
                    apiResultvi1 = await DjangoServerGroup.deliveryCall.call(
                      userUid: currentUserUid,
                      rideType: 'DELIVERY',
                      fragile: false,
                      date: functions.dateTimeFormatter(
                          getCurrentTimestamp, 'yyyy-MM-dd'),
                      rideTime: functions.dateTimeFormatter(
                          getCurrentTimestamp, 'hh:mm:ss'),
                      pickupLocationLat: functions.getLatORLngInt(
                          true, false, placePickerValue1.latLng),
                      pickupLocationLong: functions.getLatORLngInt(
                          false, true, placePickerValue1.latLng),
                      dropLocationLat: functions.getLatORLngInt(
                          true, false, placePickerValue2.latLng),
                      dropLocationLong: functions.getLatORLngInt(
                          false, true, placePickerValue2.latLng),
                      status: 'BOOKED',
                    );
                    if ((apiResultvi1?.succeeded ?? true)) {
                      logFirebaseEvent('Button_navigate_to');

                      context.goNamed('ContactDriver');
                    }

                    setState(() {});
                  },
                  text: 'Proceed',
                  options: FFButtonOptions(
                    width: 240,
                    height: 40,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                        ),
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
      ),
    );
  }
}
