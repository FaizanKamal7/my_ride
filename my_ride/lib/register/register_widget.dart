import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'dart:async';
import '../custom_code/widgets/index.dart' as custom_widgets;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({Key? key}) : super(key: key);

  @override
  _RegisterWidgetState createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  bool isMediaUploading = false;
  FFLocalFile uploadedLocalFile = FFLocalFile(bytes: Uint8List.fromList([]));

  DateTime? datePicked;
  TextEditingController? displayNameController;
  String? genderSelectionValue;
  String? userTypeSelectionValue;
  TextEditingController? phoneNumberController;
  ApiCallResponse? apiResult4fb;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
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

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Register'});
    displayNameController = TextEditingController(text: currentUserDisplayName);
    phoneNumberController = TextEditingController();
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    displayNameController?.dispose();
    phoneNumberController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
              title: Text(
                'Enter Your Details',
                style: FlutterFlowTheme.of(context).title1.override(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                    ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 12,
                    borderWidth: 1,
                    buttonSize: 50,
                    fillColor: FlutterFlowTheme.of(context).primaryText,
                    icon: Icon(
                      Icons.logout,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      size: 20,
                    ),
                    onPressed: () async {
                      logFirebaseEvent('REGISTER_PAGE_logout_ICN_ON_TAP');
                      logFirebaseEvent('IconButton_auth');
                      GoRouter.of(context).prepareAuthEvent();
                      await signOut();

                      context.goNamedAuth('Login', mounted);
                    },
                  ),
                ),
              ],
              centerTitle: false,
              elevation: 0,
            )
        ],
        body: Builder(
          builder: (context) {
            return GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
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
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Form(
                      key: formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
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
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => TextFormField(
                                    controller: displayNameController,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      'displayNameController',
                                      Duration(milliseconds: 2000),
                                      () => setState(() {}),
                                    ),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'Full Name',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: Color(0x80FFFFFF),
                                            fontWeight: FontWeight.normal,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFFF0000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFFF0000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
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
                                    validator: (val) {
                                      if (val == null || val.isEmpty) {
                                        return 'Field is required';
                                      }

                                      if (val.length < 1) {
                                        return 'Requires at least 1 characters.';
                                      }

                                      return null;
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
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
                                    EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                child: InkWell(
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'REGISTER_PAGE_Container_a7mhwgoi_ON_TAP');
                                    logFirebaseEvent(
                                        'Container_date_time_picker');
                                    final _datePickedDate =
                                        await showDatePicker(
                                      context: context,
                                      initialDate: getCurrentTimestamp,
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2050),
                                    );

                                    if (_datePickedDate != null) {
                                      setState(
                                        () => datePicked = DateTime(
                                          _datePickedDate.year,
                                          _datePickedDate.month,
                                          _datePickedDate.day,
                                        ),
                                      );
                                    }
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      width: double.infinity,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Color(0x3FFFFFFF),
                                        borderRadius: BorderRadius.circular(10),
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
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 0, 12, 0),
                                            child: FaIcon(
                                              FontAwesomeIcons.calendarAlt,
                                              color: Color(0x7FFFFFFF),
                                              size: 24,
                                            ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              functions.dateTimeFormatter(
                                                  datePicked, 'yyyy-MM-dd'),
                                              'YYYY-MM-DD',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
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
                                    EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
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
                                    EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0x41FFFFFF),
                                      borderRadius: BorderRadius.circular(10),
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
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 0, 12, 0),
                                          child: Image.asset(
                                            'assets/images/gender.png',
                                            width: 25,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        Expanded(
                                          child: FlutterFlowDropDown<String>(
                                            initialOption:
                                                genderSelectionValue ??= '',
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
                                            onChanged: (val) => setState(() =>
                                                genderSelectionValue = val),
                                            width: 80,
                                            height: 50,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Montserrat',
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
                                            borderColor: Colors.transparent,
                                            borderWidth: 1,
                                            borderRadius: 0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 4, 12, 4),
                                            hidesUnderline: true,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                                child: Text(
                                  'User Type',
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
                                    EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0x41FFFFFF),
                                      borderRadius: BorderRadius.circular(10),
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
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 0, 12, 0),
                                          child: Image.asset(
                                            'assets/images/gender.png',
                                            width: 25,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        Expanded(
                                          child: FlutterFlowDropDown<String>(
                                            options: ['Driver', 'User'],
                                            onChanged: (val) async {
                                              setState(() =>
                                                  userTypeSelectionValue = val);
                                              logFirebaseEvent(
                                                  'REGISTER_UserTypeSelection_ON_FORM_WIDGE');
                                              logFirebaseEvent(
                                                  'UserTypeSelection_backend_call');

                                              final userUpdateData =
                                                  createUserRecordData(
                                                userType:
                                                    userTypeSelectionValue,
                                              );
                                              await currentUserReference!
                                                  .update(userUpdateData);
                                            },
                                            width: 80,
                                            height: 50,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                            hintText: 'Select User Type',
                                            icon: Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.white,
                                              size: 15,
                                            ),
                                            elevation: 2,
                                            borderColor: Colors.transparent,
                                            borderWidth: 1,
                                            borderRadius: 0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 4, 12, 4),
                                            hidesUnderline: true,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              if (currentPhoneNumber == null ||
                                  currentPhoneNumber == '')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 24, 0, 0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Text(
                                      'Phone Number',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: Colors.white,
                                          ),
                                    ),
                                  ),
                                ),
                              if (currentPhoneNumber == null ||
                                  currentPhoneNumber == '')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 115,
                                          height: 50,
                                          child:
                                              custom_widgets.CountryCodePicker(
                                            width: 115,
                                            height: 50,
                                          ),
                                        ),
                                        Expanded(
                                          child: TextFormField(
                                            controller: phoneNumberController,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              hintText:
                                                  'Enter your phone number',
                                              hintStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText2
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Color(0xFF37447F),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.white,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.white,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFFF0000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFFF0000),
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
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
                                            keyboardType: TextInputType.phone,
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp('[0-9]'))
                                            ],
                                          ),
                                        ),
                                      ],
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
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                child: InkWell(
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'REGISTER_PAGE_Container_r4cyo0i0_ON_TAP');
                                    logFirebaseEvent(
                                        'Container_upload_media_to_local_file');
                                    final selectedMedia =
                                        await selectMediaWithSourceBottomSheet(
                                      context: context,
                                      allowPhoto: true,
                                    );
                                    if (selectedMedia != null &&
                                        selectedMedia.every((m) =>
                                            validateFileFormat(
                                                m.storagePath, context))) {
                                      setState(() => isMediaUploading = true);
                                      var selectedLocalFiles = <FFLocalFile>[];
                                      try {
                                        showUploadMessage(
                                          context,
                                          'Uploading file...',
                                          showLoading: true,
                                        );
                                        selectedLocalFiles = selectedMedia
                                            .map((m) => FFLocalFile(
                                                  name: m.storagePath
                                                      .split('/')
                                                      .last,
                                                  bytes: m.bytes,
                                                ))
                                            .toList();
                                      } finally {
                                        ScaffoldMessenger.of(context)
                                            .hideCurrentSnackBar();
                                        isMediaUploading = false;
                                      }
                                      if (selectedLocalFiles.length ==
                                          selectedMedia.length) {
                                        setState(() => uploadedLocalFile =
                                            selectedLocalFiles.first);
                                        showUploadMessage(context, 'Success!');
                                      } else {
                                        setState(() {});
                                        showUploadMessage(
                                            context, 'Failed to upload media');
                                        return;
                                      }
                                    }
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0x40FFFFFF),
                                        borderRadius: BorderRadius.circular(10),
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
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 0, 12, 0),
                                            child: Container(
                                              width: 25,
                                              height: 25,
                                              clipBehavior: Clip.antiAlias,
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 12, 12, 12),
                                              child: Text(
                                                'Select Profile Photo',
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: Color(0x80FFFFFF),
                                                    ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 0, 12, 0),
                                            child: Container(
                                              width: 25,
                                              height: 25,
                                              clipBehavior: Clip.antiAlias,
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
                              ),
                              if (userTypeSelectionValue == 'User')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 24, 0, 0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'REGISTER_PAGE_UserButton_ON_TAP');
                                      logFirebaseEvent(
                                          'UserButton_backend_call');
                                      apiResult4fb = await DjangoServerGroup
                                          .usersPostCall
                                          .call(
                                        uId: currentUserUid,
                                        dateofbirth:
                                            functions.dateTimeFormatter(
                                                datePicked, 'yyyy-MM-dd'),
                                        gender: genderSelectionValue,
                                        name: displayNameController!.text,
                                        phonenumber: functions.stringToInt(
                                            currentPhoneNumber != null &&
                                                    currentPhoneNumber != ''
                                                ? currentPhoneNumber
                                                : '${FFAppState().countryCode}${phoneNumberController!.text}'),
                                        homeaddress: ' NA',
                                        ratings: 0.0,
                                        totalrides: 0,
                                        workaddress: 'NA',
                                      );
                                      if ((apiResult4fb?.succeeded ?? true)) {
                                        logFirebaseEvent(
                                            'UserButton_update_local_state');
                                        FFAppState().update(() {
                                          FFAppState().userdata =
                                              (apiResult4fb?.jsonBody ?? '');
                                        });
                                        logFirebaseEvent(
                                            'UserButton_navigate_to');

                                        context.pushNamed('Home');
                                      } else {
                                        logFirebaseEvent(
                                            'UserButton_alert_dialog');
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
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
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle1,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              if (userTypeSelectionValue == 'Driver')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 24, 0, 0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'REGISTER_PAGE_DriverButton_ON_TAP');
                                      logFirebaseEvent(
                                          'DriverButton_navigate_to');

                                      context.pushNamed(
                                        'VehicleDetails',
                                        queryParams: {
                                          'fullName': serializeParam(
                                            displayNameController!.text,
                                            ParamType.String,
                                          ),
                                          'dateOfBirth': serializeParam(
                                            datePicked,
                                            ParamType.DateTime,
                                          ),
                                          'gender': serializeParam(
                                            genderSelectionValue,
                                            ParamType.String,
                                          ),
                                          'phoneNumber': serializeParam(
                                            () {
                                              if (currentPhoneNumber != null &&
                                                  currentPhoneNumber != '') {
                                                return functions.stringToInt(
                                                    currentPhoneNumber);
                                              } else if ('${FFAppState().countryCode}${phoneNumberController!.text}' !=
                                                      null &&
                                                  '${FFAppState().countryCode}${phoneNumberController!.text}' !=
                                                      '') {
                                                return functions.stringToInt(
                                                    '${FFAppState().countryCode}${phoneNumberController!.text}');
                                              } else {
                                                return int.tryParse(
                                                    phoneNumberController!
                                                        .text);
                                              }
                                            }(),
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    text: 'Continue',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 40,
                                      color: Color(0xFFD9D9D9),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle1,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
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
              ),
            );
          },
        ),
      ),
    );
  }
}
