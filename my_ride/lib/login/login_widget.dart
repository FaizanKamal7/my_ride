import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '../custom_code/widgets/index.dart' as custom_widgets;
import '../flutter_flow/permissions_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'rowOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1200.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1200.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1200.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 1200),
          end: Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 600.ms,
          begin: Offset(0, 400),
          end: Offset(0, 0),
        ),
      ],
    ),
  };
  TextEditingController? textController;
  final textFieldMask = MaskTextInputFormatter(mask: '(###) ###-##-##');
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('LOGIN_PAGE_Login_ON_PAGE_LOAD');
      if (await getPermissionStatus(locationPermission)) {
        logFirebaseEvent('Login_update_local_state');
        FFAppState().update(() {
          FFAppState().locationPermission = true;
        });
      } else {
        logFirebaseEvent('Login_update_local_state');
        FFAppState().update(() {
          FFAppState().locationPermission = false;
        });
      }
    });

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Login'});
    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    textController = TextEditingController();
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
          child: Stack(
            alignment: AlignmentDirectional(0, 1),
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(0, -1),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                            child: Image.asset(
                              'assets/images/play_store_512.png',
                              height: 80,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Text(
                            'My Ride',
                            style: FlutterFlowTheme.of(context).title1.override(
                                  fontFamily: 'Montserrat',
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                          ),
                        ],
                      ).animateOnPageLoad(
                          animationsMap['rowOnPageLoadAnimation']!),
                    ),
                  ),
                  if (!(isWeb
                      ? MediaQuery.of(context).viewInsets.bottom > 0
                      : _isKeyboardVisible))
                    Expanded(
                      flex: 3,
                      child: Image.asset(
                        'assets/images/login.png',
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  Align(
                    alignment: AlignmentDirectional(0, 1),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.5,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          ),
                        ),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation1']!),
                  ),
                ],
              ),
              Align(
                alignment: AlignmentDirectional(0, 1),
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
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.55,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 20, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                              child: Text(
                                'Welcome to My Ride',
                                style: FlutterFlowTheme.of(context)
                                    .title1
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                              ),
                            ),
                            Text(
                              'Enter your phone number to continue',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 115,
                                    height: 50,
                                    child: custom_widgets.CountryCodePicker(
                                      width: 115,
                                      height: 50,
                                    ),
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      controller: textController,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        'textController',
                                        Duration(milliseconds: 2000),
                                        () => setState(() {}),
                                      ),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: 'Enter your phone number',
                                        hintStyle: FlutterFlowTheme.of(context)
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
                                        focusedErrorBorder: OutlineInputBorder(
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
                                      keyboardType: TextInputType.phone,
                                      inputFormatters: [textFieldMask],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'LOGIN_PAGE_CONTINUE_BTN_ON_TAP');
                                  logFirebaseEvent('Button_auth');
                                  final phoneNumberVal =
                                      '+${FFAppState().countryCode}${textController!.text}';
                                  if (phoneNumberVal == null ||
                                      phoneNumberVal.isEmpty ||
                                      !phoneNumberVal.startsWith('+')) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            'Phone Number is required and has to start with +.'),
                                      ),
                                    );
                                    return;
                                  }
                                  await beginPhoneAuth(
                                    context: context,
                                    phoneNumber: phoneNumberVal,
                                    onCodeSent: () async {
                                      context.goNamedAuth(
                                        'EnterOTP',
                                        mounted,
                                        queryParams: {
                                          'phoneNumber': serializeParam(
                                            '+${FFAppState().countryCode}${textController!.text}',
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                        ignoreRedirect: true,
                                      );
                                    },
                                  );
                                },
                                text: 'Continue',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 40,
                                  color: Color(0xFFD9D9D9),
                                  textStyle:
                                      FlutterFlowTheme.of(context).subtitle1,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12, 12, 12, 12),
                              child: Text(
                                'OR',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Text(
                              'continue with',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: Color(0x7FFFFFFF),
                                    fontSize: 16,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ).animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation2']!),
              ),
              Align(
                alignment: AlignmentDirectional(0, 1),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                          child: InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'LOGIN_PAGE_Row_8bl6lhkx_ON_TAP');
                              logFirebaseEvent('Row_auth');
                              GoRouter.of(context).prepareAuthEvent();
                              final user = await signInWithFacebook(context);
                              if (user == null) {
                                return;
                              }

                              context.goNamedAuth('Home', mounted);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  height:
                                      MediaQuery.of(context).size.width * 0.1,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    'assets/images/facebook.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
                                  child: Text(
                                    'Facebook',
                                    style:
                                        FlutterFlowTheme.of(context).subtitle1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                          child: Container(
                            width: 1,
                            height: 100,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                          child: InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'LOGIN_PAGE_Row_wgd96za8_ON_TAP');
                              logFirebaseEvent('Row_auth');
                              GoRouter.of(context).prepareAuthEvent();
                              final user = await signInWithGoogle(context);
                              if (user == null) {
                                return;
                              }

                              context.goNamedAuth('Home', mounted);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  height:
                                      MediaQuery.of(context).size.width * 0.1,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    'assets/images/google.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
                                  child: Text(
                                    'Google',
                                    style:
                                        FlutterFlowTheme.of(context).subtitle1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ).animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation3']!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
