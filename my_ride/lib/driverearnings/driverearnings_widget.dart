import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DriverearningsWidget extends StatefulWidget {
  const DriverearningsWidget({Key? key}) : super(key: key);

  @override
  _DriverearningsWidgetState createState() => _DriverearningsWidgetState();
}

class _DriverearningsWidgetState extends State<DriverearningsWidget> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Driverearnings'});
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
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
          onPressed: () {
            print('IconButton pressed ...');
          },
        ),
        title: Text(
          'Earnings',
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
          child: FutureBuilder<ApiCallResponse>(
            future: DjangoServerGroup.driverStatsCall.call(),
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
              final columnDriverStatsResponse = snapshot.data!;
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: MediaQuery.of(context).size.height * 0.05,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).lineColor,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).lineColor,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Total Earnings :',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                                Text(
                                  '\$200',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: MediaQuery.of(context).size.height * 0.05,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).lineColor,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).lineColor,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Total Rides :',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                                Text(
                                  '220',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: MediaQuery.of(context).size.height * 0.05,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).lineColor,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).lineColor,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Today Earning :',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                                Text(
                                  '\$20',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: MediaQuery.of(context).size.height * 0.05,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).lineColor,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).lineColor,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Today Rides :',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                                Text(
                                  '2',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
