import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/stripe/payment_manager.dart';
import '../components/drawer_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PayWidget extends StatefulWidget {
  const PayWidget({Key? key}) : super(key: key);

  @override
  _PayWidgetState createState() => _PayWidgetState();
}

class _PayWidgetState extends State<PayWidget> {
  ApiCallResponse? statusUpdate;
  String? paymentId;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Pay'});
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
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
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 50,
              ),
            ),
          );
        }
        final payUserDataResponse = snapshot.data!;
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
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: custom_widgets.RouteViewStatic(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.9,
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
                      height: 150,
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                            child: Container(
                              width: double.infinity,
                              height: 350,
                              decoration: BoxDecoration(
                                color: Color(0xFFD9D9D9),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                  topLeft: Radius.circular(36),
                                  topRight: Radius.circular(36),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        25, 14, 18, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'You Pay',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Montserrat',
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        Text(
                                          'Rs. ${FFAppState().routeFare}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Montserrat',
                                                fontSize: 18,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 25, 20, 0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'PAY_PAGE_PAY_NOW_BTN_ON_TAP');
                                        logFirebaseEvent(
                                            'Button_stripe_payment');
                                        final paymentResponse =
                                            await processStripePayment(
                                          context,
                                          amount: functions.stringToInt(
                                              '${FFAppState().routeFare}00'),
                                          currency: 'PKR',
                                          customerEmail: currentUserEmail,
                                          customerName: DjangoServerGroup
                                              .userDataCall
                                              .name(
                                                payUserDataResponse.jsonBody,
                                              )
                                              .toString(),
                                          description: 'Ride Payment',
                                          allowGooglePay: true,
                                          allowApplePay: false,
                                          themeStyle: ThemeMode.system,
                                        );
                                        if (paymentResponse.paymentId == null) {
                                          if (paymentResponse.errorMessage !=
                                              null) {
                                            showSnackbar(
                                              context,
                                              'Error: ${paymentResponse.errorMessage}',
                                            );
                                          }
                                          return;
                                        }
                                        paymentId = paymentResponse.paymentId!;

                                        if (paymentId != null &&
                                            paymentId != '') {
                                          logFirebaseEvent(
                                              'Button_backend_call');
                                          statusUpdate = await DjangoServerGroup
                                              .tripStatusPatchCall
                                              .call(
                                            status: 'COMPLETED',
                                          );
                                          if ((statusUpdate?.succeeded ??
                                              true)) {
                                            logFirebaseEvent(
                                                'Button_navigate_to');
                                            if (Navigator.of(context)
                                                .canPop()) {
                                              context.pop();
                                            }
                                            context.pushNamed('Home');
                                          }
                                        }

                                        setState(() {});
                                      },
                                      text: 'Pay Now',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 48,
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
                          ),
                        ],
                      ),
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
                      logFirebaseEvent('PAY_PAGE_Container_rgwr7q1i_ON_TAP');
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
        );
      },
    );
  }
}
