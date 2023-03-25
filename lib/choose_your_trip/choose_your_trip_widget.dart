import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChooseYourTripWidget extends StatefulWidget {
  const ChooseYourTripWidget({Key? key}) : super(key: key);

  @override
  _ChooseYourTripWidgetState createState() => _ChooseYourTripWidgetState();
}

class _ChooseYourTripWidgetState extends State<ChooseYourTripWidget> {
  Completer<ApiCallResponse>? _apiRequestCompleter;
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

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ChooseYourTrip'});
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
                        'CHOOSE_YOUR_TRIP_Container_1x8s1j2a_ON_T');
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
                      child: Icon(
                        Icons.menu,
                        color: FlutterFlowTheme.of(context).secondaryColor,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
              title: Text(
                'Choose your trip',
                style: FlutterFlowTheme.of(context).title1.override(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
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
                    child: FutureBuilder<ApiCallResponse>(
                      future:
                          (_apiRequestCompleter ??= Completer<ApiCallResponse>()
                                ..complete(
                                    DjangoServerGroup.driverOfferGetCall.call(
                                  userUid: currentUserUid,
                                  date: FFAppState().date,
                                  time: FFAppState().time,
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
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                size: 50,
                              ),
                            ),
                          );
                        }
                        final columnDriverOfferGetResponse = snapshot.data!;
                        return Builder(
                          builder: (context) {
                            final offer = DjangoServerGroup.driverOfferGetCall
                                    .offers(
                                      columnDriverOfferGetResponse.jsonBody,
                                    )
                                    ?.toList() ??
                                [];
                            return RefreshIndicator(
                              onRefresh: () async {
                                logFirebaseEvent(
                                    'CHOOSE_YOUR_TRIP_Column_jynul7qh_ON_PULL');
                                logFirebaseEvent(
                                    'Column_refresh_database_request');
                                setState(() => _apiRequestCompleter = null);
                                await waitForApiRequestCompleter();
                              },
                              child: SingleChildScrollView(
                                physics: const AlwaysScrollableScrollPhysics(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children:
                                      List.generate(offer.length, (offerIndex) {
                                    final offerItem = offer[offerIndex];
                                    return Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 10),
                                        child: Container(
                                          width: 347,
                                          height: 350,
                                          decoration: BoxDecoration(
                                            color: Color(0x33FFFFFF),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              width: 1,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(12, 7, 12, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                      width: 152,
                                                      height: 17,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x33FFFFFF),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        border: Border.all(
                                                          color: Colors
                                                              .transparent,
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'Sharing ride',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(12, 7, 12, 7),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                      child: Image.asset(
                                                        'assets/images/Group.png',
                                                        width: 60,
                                                        height: 60,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 240,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Colors.transparent,
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10, 0,
                                                                    0, 0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          4),
                                                                  child: Text(
                                                                    'Honda Civic',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              17,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          4),
                                                                  child: Text(
                                                                    '~\$25',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              17,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          4),
                                                              child: Text(
                                                                'Matthew',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          13,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                  width: 14,
                                                                  height: 14,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .transparent,
                                                                    image:
                                                                        DecorationImage(
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      image: Image
                                                                          .asset(
                                                                        'assets/images/Vector.png',
                                                                      ).image,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          7,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child: Text(
                                                                    '4.9 (100)',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(7, 0, 7, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0, 0),
                                                      child: Container(
                                                        width: 83,
                                                        height: 130,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0x33FFFFFF),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            width: 1,
                                                          ),
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              '01:23 pm',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    fontSize:
                                                                        12,
                                                                  ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          7,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                '04:32 pm',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      fontSize:
                                                                          12,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0, 0),
                                                      child: Container(
                                                        width: 238,
                                                        height: 130,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0x33FFFFFF),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            width: 1,
                                                          ),
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8,
                                                                          5,
                                                                          8,
                                                                          0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Image.asset(
                                                                    'assets/images/ddd.png',
                                                                    width: 11,
                                                                    height: 8,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child: Text(
                                                                      '4 min away from you pickup location',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color:
                                                                                Color(0x70FFFFFF),
                                                                            fontSize:
                                                                                8,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8,
                                                                          2,
                                                                          0,
                                                                          0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Container(
                                                                    width: 15,
                                                                    height: 15,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xBACDD9D9D9),
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child: Text(
                                                                      'Pickup',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color:
                                                                                Color(0x70FFFFFF),
                                                                            fontSize:
                                                                                12,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          28,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child: Text(
                                                                      '86 street, G11/1, Islamabad',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            fontSize:
                                                                                11,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Divider(
                                                              height: 10,
                                                              thickness: 1,
                                                              indent: 35,
                                                              endIndent: 20,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          6,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Image.asset(
                                                                    'assets/images/map.png',
                                                                    width: 20,
                                                                    height: 20,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child: Text(
                                                                      'Drop Off',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color:
                                                                                Color(0x70FFFFFF),
                                                                            fontSize:
                                                                                12,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          28,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child: Text(
                                                                      'Kalma Chowk, Phase 5, Ghauri\ntown, Islamabad',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            fontSize:
                                                                                11,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8,
                                                                          2,
                                                                          8,
                                                                          0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Image.asset(
                                                                    'assets/images/ddd.png',
                                                                    width: 11,
                                                                    height: 8,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child: Text(
                                                                      '2 min away from you drop location',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color:
                                                                                Color(0x70FFFFFF),
                                                                            fontSize:
                                                                                8,
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
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 10, 10, 2),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Co-passengers',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            color: Colors.white,
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 2, 0),
                                                          child: Container(
                                                            width: 13,
                                                            height: 13,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                  .transparent,
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .cover,
                                                                image:
                                                                    Image.asset(
                                                                  'assets/images/Groupd.png',
                                                                ).image,
                                                              ),
                                                              shape: BoxShape
                                                                  .rectangle,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 2, 0),
                                                          child: Container(
                                                            width: 13,
                                                            height: 13,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                  .transparent,
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .cover,
                                                                image:
                                                                    Image.asset(
                                                                  'assets/images/Groupd.png',
                                                                ).image,
                                                              ),
                                                              shape: BoxShape
                                                                  .rectangle,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 2, 0),
                                                          child: Container(
                                                            width: 13,
                                                            height: 13,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                  .transparent,
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .cover,
                                                                image:
                                                                    Image.asset(
                                                                  'assets/images/Groupd.png',
                                                                ).image,
                                                              ),
                                                              shape: BoxShape
                                                                  .rectangle,
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 13,
                                                          height: 13,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors
                                                                .transparent,
                                                            image:
                                                                DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image:
                                                                  Image.asset(
                                                                'assets/images/Group.png',
                                                              ).image,
                                                            ),
                                                            shape: BoxShape
                                                                .rectangle,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 10, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Irfan Junejo',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            color: Colors.white,
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 12,
                                                          height: 12,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors
                                                                .transparent,
                                                            image:
                                                                DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image:
                                                                  Image.asset(
                                                                'assets/images/Vector.png',
                                                              ).image,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(4,
                                                                      0, 0, 0),
                                                          child: Text(
                                                            '4.5 (58)',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 10, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Kamran Ahmad',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            color: Colors.white,
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 12,
                                                          height: 12,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors
                                                                .transparent,
                                                            image:
                                                                DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image:
                                                                  Image.asset(
                                                                'assets/images/Vector.png',
                                                              ).image,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(4,
                                                                      0, 0, 0),
                                                          child: Text(
                                                            '3.8  (12)',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 10, 10),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 7, 0, 0),
                                                      child: FFButtonWidget(
                                                        onPressed: () {
                                                          print(
                                                              'Button pressed ...');
                                                        },
                                                        text: 'Book now',
                                                        options:
                                                            FFButtonOptions(
                                                          width: 155,
                                                          height: 24,
                                                          color:
                                                              Color(0xFFD9D9D9),
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .subtitle1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    fontSize:
                                                                        14,
                                                                  ),
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
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
