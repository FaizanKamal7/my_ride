import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../components/drawer_widget.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AllRidesWidget extends StatefulWidget {
  const AllRidesWidget({Key? key}) : super(key: key);

  @override
  _AllRidesWidgetState createState() => _AllRidesWidgetState();
}

class _AllRidesWidgetState extends State<AllRidesWidget> {
  Completer<ApiCallResponse>? _apiRequestCompleter;
  String? choiceChipsValue;
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

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'AllRides'});
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
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
                    logFirebaseEvent(
                        'ALL_RIDES_PAGE_Container_mfmk1uw1_ON_TAP');
                    logFirebaseEvent('Container_drawer');
                    scaffoldKey.currentState!.openDrawer();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      shape: BoxShape.circle,
                    ),
                    child: InkWell(
                      onTap: () async {
                        logFirebaseEvent('ALL_RIDES_PAGE_Icon_3sp77g9u_ON_TAP');
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
              actions: [],
              centerTitle: false,
              elevation: 0,
            )
        ],
        body: Builder(
          builder: (context) {
            return GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
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
                    color: Colors.transparent,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'All Rides',
                              style:
                                  FlutterFlowTheme.of(context).title1.override(
                                        fontFamily: 'Montserrat',
                                        fontSize: 40,
                                        fontWeight: FontWeight.w500,
                                      ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
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
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 24, 20, 0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Color(0x33FFFFFF),
                                          borderRadius:
                                              BorderRadius.circular(32),
                                          border: Border.all(
                                            color: Colors.black,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 4, 0, 0),
                                          child: FlutterFlowChoiceChips(
                                            initiallySelected: ['UPCOMING'],
                                            options: [
                                              ChipData('UPCOMING'),
                                              ChipData('COMPLETED\n'),
                                              ChipData('CANCELLED')
                                            ],
                                            onChanged: (val) => setState(() =>
                                                choiceChipsValue = val?.first),
                                            selectedChipStyle: ChipStyle(
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .subtitle1
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                              iconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                              iconSize: 15,
                                              elevation: 0,
                                            ),
                                            unselectedChipStyle: ChipStyle(
                                              backgroundColor:
                                                  Colors.transparent,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle1
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        fontSize: 12,
                                                      ),
                                              iconColor: Color(0xFF323B45),
                                              iconSize: 12,
                                              elevation: 0,
                                            ),
                                            chipSpacing: 0,
                                            multiselect: false,
                                            initialized:
                                                choiceChipsValue != null,
                                            alignment:
                                                WrapAlignment.spaceEvenly,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: FutureBuilder<ApiCallResponse>(
                                        future: (_apiRequestCompleter ??=
                                                Completer<ApiCallResponse>()
                                                  ..complete(DjangoServerGroup
                                                      .userRideHistoryCall
                                                      .call(
                                                    uId: currentUserUid,
                                                  )))
                                            .future,
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child: SpinKitDoubleBounce(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  size: 50,
                                                ),
                                              ),
                                            );
                                          }
                                          final columnUserRideHistoryResponse =
                                              snapshot.data!;
                                          return Builder(
                                            builder: (context) {
                                              final ride = DjangoServerGroup
                                                      .userRideHistoryCall
                                                      .rideList(
                                                        columnUserRideHistoryResponse
                                                            .jsonBody,
                                                      )
                                                      ?.where((e) =>
                                                          getJsonField(
                                                            e,
                                                            r'''$.status''',
                                                          ) ==
                                                          choiceChipsValue)
                                                      .toList()
                                                      ?.toList() ??
                                                  [];
                                              return RefreshIndicator(
                                                onRefresh: () async {
                                                  logFirebaseEvent(
                                                      'ALL_RIDES_Column_g1fres0h_ON_PULL_TO_REF');
                                                  logFirebaseEvent(
                                                      'Column_refresh_database_request');
                                                  setState(() =>
                                                      _apiRequestCompleter =
                                                          null);
                                                  await waitForApiRequestCompleter();
                                                  logFirebaseEvent(
                                                      'Column_refresh_database_request');
                                                  setState(() =>
                                                      _apiRequestCompleter =
                                                          null);
                                                  await waitForApiRequestCompleter();
                                                },
                                                child: SingleChildScrollView(
                                                  physics:
                                                      const AlwaysScrollableScrollPhysics(),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: List.generate(
                                                        ride.length,
                                                        (rideIndex) {
                                                      final rideItem =
                                                          ride[rideIndex];
                                                      return Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0, 0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24,
                                                                      10,
                                                                      24,
                                                                      10),
                                                          child: Container(
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0x33FFFFFF),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                width: 1,
                                                              ),
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.of(context)
                                                                            .size
                                                                            .width,
                                                                        height:
                                                                            134,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Colors.transparent,
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                                                                                    child: Text(
                                                                                      'Matthew',
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: Colors.white,
                                                                                            fontSize: 13,
                                                                                            fontWeight: FontWeight.w500,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Text(
                                                                                        '${getJsonField(
                                                                                          rideItem,
                                                                                          r'''$.time''',
                                                                                        ).toString()} -  ${getJsonField(
                                                                                          rideItem,
                                                                                          r'''$.date''',
                                                                                        ).toString()}',
                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                              fontFamily: 'Poppins',
                                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                              fontSize: 14,
                                                                                              fontWeight: FontWeight.w300,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 7, 0, 0),
                                                                                    child: FFButtonWidget(
                                                                                      onPressed: () {
                                                                                        print('Button pressed ...');
                                                                                      },
                                                                                      text: '${getJsonField(
                                                                                        rideItem,
                                                                                        r'''$.Fare''',
                                                                                      ).toString()} Rs (${getJsonField(
                                                                                        rideItem,
                                                                                        r'''$.Km''',
                                                                                      ).toString()})',
                                                                                      options: FFButtonOptions(
                                                                                        width: 155,
                                                                                        height: 30,
                                                                                        color: Color(0xFFD9D9D9),
                                                                                        textStyle: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                              fontFamily: 'Montserrat',
                                                                                              fontSize: 14,
                                                                                            ),
                                                                                        borderSide: BorderSide(
                                                                                          color: Colors.transparent,
                                                                                          width: 1,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(4),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              width: 100,
                                                                              height: 134,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0xFFD9D9D9),
                                                                                borderRadius: BorderRadius.circular(12),
                                                                              ),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(1, 0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 8, 0),
                                                                                      child: Container(
                                                                                        width: 10,
                                                                                        height: 10,
                                                                                        clipBehavior: Clip.antiAlias,
                                                                                        decoration: BoxDecoration(
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        child: Image.asset(
                                                                                          'assets/images/Vectordcd.png',
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                                                                      child: Container(
                                                                                        width: double.infinity,
                                                                                        height: double.infinity,
                                                                                        child: custom_widgets.CustomAssetImageViewer(
                                                                                          width: double.infinity,
                                                                                          height: double.infinity,
                                                                                          assetImagePath: 'assets/images/${getJsonField(
                                                                                            rideItem,
                                                                                            r'''$.Ride''',
                                                                                          ).toString()}.png',
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                                                                                    child: Text(
                                                                                      getJsonField(
                                                                                        rideItem,
                                                                                        r'''$.Ride''',
                                                                                      ).toString(),
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            fontSize: 11,
                                                                                            fontWeight: FontWeight.bold,
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
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
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
            );
          },
        ),
      ),
    );
  }

  Future waitForApiRequestCompleter({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = _apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
