import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../components/drawer_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetailsWidget extends StatefulWidget {
  const DetailsWidget({Key? key}) : super(key: key);

  @override
  _DetailsWidgetState createState() => _DetailsWidgetState();
}

class _DetailsWidgetState extends State<DetailsWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'columnOnPageLoadAnimation': AnimationInfo(
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
  };
  ApiCallResponse? apiResult4fb;
  DateTime? datePicked1;
  TextEditingController? textController1;
  String? dropDownValue1;
  ApiCallResponse? driverData;
  DateTime? datePicked2;
  TextEditingController? textController2;
  String? dropDownValue2;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Details'});
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    textController1?.dispose();
    textController2?.dispose();
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
      body: NestedScrollView(
        headerSliverBuilder: (context, _) => [
          if (!(isWeb
              ? MediaQuery.of(context).viewInsets.bottom > 0
              : _isKeyboardVisible))
            SliverAppBar(
              pinned: false,
              floating: false,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              leading: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                child: InkWell(
                  onTap: () async {
                    logFirebaseEvent('DETAILS_PAGE_Container_6kdfh00f_ON_TAP');
                    logFirebaseEvent('Container_drawer');
                    scaffoldKey.currentState!.openDrawer();
                  },
                  child: Material(
                    color: Colors.transparent,
                    elevation: 5,
                    shape: const CircleBorder(),
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        shape: BoxShape.circle,
                      ),
                      child: InkWell(
                        onTap: () async {
                          logFirebaseEvent('DETAILS_PAGE_Icon_opd3ipgm_ON_TAP');
                          logFirebaseEvent('Icon_drawer');
                          scaffoldKey.currentState!.openDrawer();
                        },
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
              title: Text(
                'Details',
                style: FlutterFlowTheme.of(context).title1.override(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                    ),
              ),
              actions: [],
              centerTitle: false,
              toolbarHeight: 80,
              elevation: 0,
            )
        ],
        body: Builder(
          builder: (context) {
            return GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (valueOrDefault(currentUserDocument?.userType, '') ==
                      'User')
                    Expanded(
                      child: AuthUserStreamWidget(
                        builder: (context) => Material(
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
                              width: MediaQuery.of(context).size.width,
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
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24, 24, 24, 0),
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
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            size: 50,
                                          ),
                                        ),
                                      );
                                    }
                                    final columnUserDataResponse =
                                        snapshot.data!;
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Name',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color: Colors.white,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 8, 0, 0),
                                          child: TextFormField(
                                            controller: textController1 ??=
                                                TextEditingController(
                                              text:
                                                  DjangoServerGroup.userDataCall
                                                      .name(
                                                        columnUserDataResponse
                                                            .jsonBody,
                                                      )
                                                      .toString(),
                                            ),
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              hintText: 'Full Name',
                                              hintStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText2
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Color(0x80FFFFFF),
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.white,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.white,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFFF0000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFFF0000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              filled: true,
                                              fillColor: Color(0x40FFFFFF),
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(12, 0, 0, 0),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                            keyboardType: TextInputType.name,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 24, 0, 0),
                                          child: Text(
                                            'Date of Birth',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.white,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 8, 0, 0),
                                          child: InkWell(
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'DETAILS_PAGE_Container_b9w7qoyx_ON_TAP');
                                              logFirebaseEvent(
                                                  'Container_date_time_picker');
                                              final _datePicked1Date =
                                                  await showDatePicker(
                                                context: context,
                                                initialDate:
                                                    functions.dateTimeParser(
                                                        DjangoServerGroup
                                                            .userDataCall
                                                            .dateOfBIrth(
                                                              columnUserDataResponse
                                                                  .jsonBody,
                                                            )
                                                            .toString()),
                                                firstDate: DateTime(1900),
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
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Container(
                                                width: double.infinity,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: Color(0x3FFFFFFF),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                    color: Colors.white,
                                                    width: 1,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12, 0, 12, 0),
                                                      child: FaIcon(
                                                        FontAwesomeIcons
                                                            .calendarAlt,
                                                        color:
                                                            Color(0x7FFFFFFF),
                                                        size: 24,
                                                      ),
                                                    ),
                                                    Text(
                                                      valueOrDefault<String>(
                                                        functions.dateTimeFormatter(
                                                            datePicked1 != null
                                                                ? datePicked1
                                                                : functions.dateTimeParser(DjangoServerGroup.userDataCall
                                                                    .dateOfBIrth(
                                                                      columnUserDataResponse
                                                                          .jsonBody,
                                                                    )
                                                                    .toString()),
                                                            'yyyy-MM-dd'),
                                                        'YYYY-MM-DD',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 24, 0, 0),
                                          child: Text(
                                            'Gender',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.white,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 8, 0, 0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: Color(0x41FFFFFF),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                  color: Colors.white,
                                                  width: 1,
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                12, 0, 12, 0),
                                                    child: Image.asset(
                                                      'assets/images/gender.png',
                                                      width: 25,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: FlutterFlowDropDown<
                                                        String>(
                                                      initialOption:
                                                          dropDownValue1 ??=
                                                              DjangoServerGroup
                                                                  .userDataCall
                                                                  .gender(
                                                                    columnUserDataResponse
                                                                        .jsonBody,
                                                                  )
                                                                  .toString(),
                                                      options: [
                                                        'MALE',
                                                        'FEMALE',
                                                        'OTHER'
                                                      ],
                                                      optionLabels: [
                                                        'Male',
                                                        'Female',
                                                        'Other'
                                                      ],
                                                      onChanged: (val) =>
                                                          setState(() =>
                                                              dropDownValue1 =
                                                                  val),
                                                      width: 80,
                                                      height: 50,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                      hintText: 'Select Gender',
                                                      icon: Icon(
                                                        Icons.arrow_drop_down,
                                                        color: Colors.white,
                                                        size: 15,
                                                      ),
                                                      elevation: 2,
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderWidth: 1,
                                                      borderRadius: 0,
                                                      margin:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12, 4, 12, 4),
                                                      hidesUnderline: true,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        if (false)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 24, 0, 0),
                                            child: Text(
                                              'Upload Photo',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color: Colors.white,
                                                      ),
                                            ),
                                          ),
                                        if (false)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 8, 0, 0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Container(
                                                width: double.infinity,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: Color(0x40FFFFFF),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                    color: Colors.white,
                                                    width: 1,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12, 0, 12, 0),
                                                      child: Container(
                                                        width: 25,
                                                        height: 25,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.asset(
                                                          'assets/images/profile.png',
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(12,
                                                                    12, 12, 12),
                                                        child: Text(
                                                          'Select Profile Photo',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0x80FFFFFF),
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12, 0, 12, 0),
                                                      child: Container(
                                                        width: 25,
                                                        height: 25,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.asset(
                                                          'assets/images/upload.png',
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 24, 0, 0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'DETAILS_PAGE_CONTINUE_BTN_ON_TAP');
                                              logFirebaseEvent(
                                                  'Button_backend_call');
                                              apiResult4fb =
                                                  await DjangoServerGroup
                                                      .usersPostCall
                                                      .call(
                                                uId: currentUserUid,
                                                dateofbirth:
                                                    functions.dateTimeFormatter(
                                                        datePicked1,
                                                        'yyyy-MM-dd'),
                                                gender: dropDownValue1,
                                                name:
                                                    textController2?.text ?? '',
                                                phonenumber:
                                                    functions.stringToInt(
                                                        currentPhoneNumber),
                                                homeaddress: ' NA',
                                              );
                                              if ((apiResult4fb?.succeeded ??
                                                  true)) {
                                                logFirebaseEvent(
                                                    'Button_update_local_state');
                                                FFAppState().update(() {
                                                  FFAppState().userdata =
                                                      (apiResult4fb?.jsonBody ??
                                                          '');
                                                });
                                                logFirebaseEvent(
                                                    'Button_navigate_to');

                                                context.goNamed('Home');
                                              } else {
                                                logFirebaseEvent(
                                                    'Button_alert_dialog');
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'Error Updating Details'),
                                                      content: Text(
                                                          'Error: ${(apiResult4fb?.statusCode ?? 200).toString()}'),
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

                                              setState(() {});
                                            },
                                            text: 'Continue',
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 40,
                                              color: Color(0xFFD9D9D9),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle1,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
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
                      ),
                    ),
                  Expanded(
                    child: Material(
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
                          width: MediaQuery.of(context).size.width,
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
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(24, 24, 24, 0),
                            child: FutureBuilder<ApiCallResponse>(
                              future: DjangoServerGroup.driverDataCall.call(
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
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        size: 50,
                                      ),
                                    ),
                                  );
                                }
                                final columnDriverDataResponse = snapshot.data!;
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Name',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: Colors.white,
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 0),
                                      child: TextFormField(
                                        controller: textController2 ??=
                                            TextEditingController(
                                          text: DjangoServerGroup.driverDataCall
                                              .name(
                                                columnDriverDataResponse
                                                    .jsonBody,
                                              )
                                              .toString(),
                                        ),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: 'Full Name',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText2
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Color(0x80FFFFFF),
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.white,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.white,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFFF0000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFFF0000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          filled: true,
                                          fillColor: Color(0x40FFFFFF),
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 0, 0, 0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        keyboardType: TextInputType.name,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 24, 0, 0),
                                      child: Text(
                                        'Date of Birth',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color: Colors.white,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 0),
                                      child: InkWell(
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'DETAILS_PAGE_Container_a3kzakxx_ON_TAP');
                                          logFirebaseEvent(
                                              'Container_date_time_picker');
                                          final _datePicked2Date =
                                              await showDatePicker(
                                            context: context,
                                            initialDate:
                                                functions.dateTimeParser(
                                                    DjangoServerGroup
                                                        .driverDataCall
                                                        .dateOfBirth(
                                                          columnDriverDataResponse
                                                              .jsonBody,
                                                        )
                                                        .toString()),
                                            firstDate: DateTime(1900),
                                            lastDate: DateTime(2050),
                                          );

                                          if (_datePicked2Date != null) {
                                            setState(
                                              () => datePicked2 = DateTime(
                                                _datePicked2Date.year,
                                                _datePicked2Date.month,
                                                _datePicked2Date.day,
                                              ),
                                            );
                                          }
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Container(
                                            width: double.infinity,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: Color(0x3FFFFFFF),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 1,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(12, 0, 12, 0),
                                                  child: FaIcon(
                                                    FontAwesomeIcons
                                                        .calendarAlt,
                                                    color: Color(0x7FFFFFFF),
                                                    size: 24,
                                                  ),
                                                ),
                                                Text(
                                                  valueOrDefault<String>(
                                                    functions.dateTimeFormatter(
                                                        datePicked2 != null
                                                            ? datePicked2
                                                            : functions.dateTimeParser(
                                                                DjangoServerGroup
                                                                    .driverDataCall
                                                                    .dateOfBirth(
                                                                      columnDriverDataResponse
                                                                          .jsonBody,
                                                                    )
                                                                    .toString()),
                                                        'yyyy-MM-dd'),
                                                    'YYYY-MM-DD',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 24, 0, 0),
                                      child: Text(
                                        'Gender',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color: Colors.white,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Color(0x41FFFFFF),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 1,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(12, 0, 12, 0),
                                                child: Image.asset(
                                                  'assets/images/gender.png',
                                                  width: 25,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              Expanded(
                                                child:
                                                    FlutterFlowDropDown<String>(
                                                  initialOption:
                                                      dropDownValue2 ??=
                                                          DjangoServerGroup
                                                              .driverDataCall
                                                              .gender(
                                                                columnDriverDataResponse
                                                                    .jsonBody,
                                                              )
                                                              .toString(),
                                                  options: [
                                                    'MALE',
                                                    'FEMALE',
                                                    'OTHER'
                                                  ],
                                                  optionLabels: [
                                                    'Male',
                                                    'Female',
                                                    'Other'
                                                  ],
                                                  onChanged: (val) => setState(
                                                      () =>
                                                          dropDownValue2 = val),
                                                  width: 80,
                                                  height: 50,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                  hintText: 'Select Gender',
                                                  icon: Icon(
                                                    Icons.arrow_drop_down,
                                                    color: Colors.white,
                                                    size: 15,
                                                  ),
                                                  elevation: 2,
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderWidth: 1,
                                                  borderRadius: 0,
                                                  margin: EdgeInsetsDirectional
                                                      .fromSTEB(12, 4, 12, 4),
                                                  hidesUnderline: true,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (false)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 24, 0, 0),
                                        child: Text(
                                          'Upload Photo',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color: Colors.white,
                                              ),
                                        ),
                                      ),
                                    if (false)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 8, 0, 0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Container(
                                            width: double.infinity,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: Color(0x40FFFFFF),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 1,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(12, 0, 12, 0),
                                                  child: Container(
                                                    width: 25,
                                                    height: 25,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.asset(
                                                      'assets/images/profile.png',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                12, 12, 12, 12),
                                                    child: Text(
                                                      'Select Profile Photo',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
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
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(12, 0, 12, 0),
                                                  child: Container(
                                                    width: 25,
                                                    height: 25,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.asset(
                                                      'assets/images/upload.png',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 24, 0, 0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'DETAILS_PAGE_CONTINUE_BTN_ON_TAP');
                                          logFirebaseEvent(
                                              'Button_backend_call');
                                          driverData = await DjangoServerGroup
                                              .driversPostCall
                                              .call();
                                          if ((driverData?.succeeded ?? true)) {
                                            logFirebaseEvent(
                                                'Button_update_local_state');
                                            FFAppState().update(() {
                                              FFAppState().userdata =
                                                  (driverData?.jsonBody ?? '');
                                            });
                                            logFirebaseEvent(
                                                'Button_navigate_to');

                                            context.goNamed('OnlineOffline');
                                          } else {
                                            logFirebaseEvent(
                                                'Button_alert_dialog');
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text(
                                                      'Error Updating Details'),
                                                  content: Text(
                                                      'Error: ${(driverData?.jsonBody ?? '').toString()}'),
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

                                          setState(() {});
                                        },
                                        text: 'Continue',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 40,
                                          color: Color(0xFFD9D9D9),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .subtitle1,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                  ),
                ],
              ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!),
            );
          },
        ),
      ),
    );
  }
}
