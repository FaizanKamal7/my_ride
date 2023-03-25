import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EnterOTPWidget extends StatefulWidget {
  const EnterOTPWidget({
    Key? key,
    this.phoneNumber,
  }) : super(key: key);

  final String? phoneNumber;

  @override
  _EnterOTPWidgetState createState() => _EnterOTPWidgetState();
}

class _EnterOTPWidgetState extends State<EnterOTPWidget> {
  TextEditingController? pinCodeController;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'EnterOTP'});
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    pinCodeController?.dispose();
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
          SliverAppBar(
            pinned: false,
            floating: false,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            title: Text(
              'Enter OTP',
              style: FlutterFlowTheme.of(context).title3,
            ),
            actions: [],
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
                    width: double.infinity,
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
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                          child: Text(
                            'Enter OTP',
                            style: FlutterFlowTheme.of(context).title3.override(
                                  fontFamily: 'Montserrat',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                          child: PinCodeTextField(
                            appContext: context,
                            length: 6,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Montserrat',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            enableActiveFill: true,
                            autoFocus: true,
                            showCursor: true,
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            obscureText: false,
                            pinTheme: PinTheme(
                              fieldHeight: 50,
                              fieldWidth: 50,
                              borderWidth: 2,
                              borderRadius: BorderRadius.circular(12),
                              shape: PinCodeFieldShape.box,
                              activeColor: Color(0x3FFFFFFF),
                              inactiveColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              selectedColor: Colors.transparent,
                              activeFillColor: Color(0x3FFFFFFF),
                              inactiveFillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              selectedFillColor: Colors.transparent,
                            ),
                            controller: pinCodeController,
                            onChanged: (_) => {},
                            onCompleted: (_) async {
                              logFirebaseEvent(
                                  'ENTER_O_T_P_PinCode_1yykdnfu_ON_PINCODE_');
                              logFirebaseEvent('PinCode_auth');
                              GoRouter.of(context).prepareAuthEvent();
                              final smsCodeVal = pinCodeController!.text;
                              if (smsCodeVal == null || smsCodeVal.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                        Text('Enter SMS verification code.'),
                                  ),
                                );
                                return;
                              }
                              final phoneVerifiedUser = await verifySmsCode(
                                context: context,
                                smsCode: smsCodeVal,
                              );
                              if (phoneVerifiedUser == null) {
                                return;
                              }

                              context.goNamedAuth('Home', mounted);
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Didn\'t recieve OTP?',
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
                                    EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                                child: InkWell(
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'ENTER_O_T_P_PAGE_Text_j2ney42x_ON_TAP');
                                    logFirebaseEvent('Text_auth');
                                    final phoneNumberVal = widget.phoneNumber;
                                    if (phoneNumberVal == null ||
                                        phoneNumberVal.isEmpty ||
                                        !phoneNumberVal.startsWith('+')) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
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
                                              widget.phoneNumber,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                          ignoreRedirect: true,
                                        );
                                      },
                                    );
                                  },
                                  child: Text(
                                    'Resend Code',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          decoration: TextDecoration.underline,
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
            );
          },
        ),
      ),
    );
  }
}
