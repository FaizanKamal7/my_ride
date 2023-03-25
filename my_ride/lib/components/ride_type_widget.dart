import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RideTypeWidget extends StatefulWidget {
  const RideTypeWidget({
    Key? key,
    this.ride,
  }) : super(key: key);

  final dynamic ride;

  @override
  _RideTypeWidgetState createState() => _RideTypeWidgetState();
}

class _RideTypeWidgetState extends State<RideTypeWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      child: Material(
        color: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: 80,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.white,
                width: 1,
              ),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                          child: Container(
                            width: 10,
                            height: 10,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'assets/images/infoicon.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 80,
                          child: custom_widgets.CustomAssetImageViewer(
                            width: double.infinity,
                            height: 80,
                            assetImagePath: getJsonField(
                              widget.ride,
                              r'''$.image''',
                            ).toString(),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 1),
                        child: Text(
                          getJsonField(
                            widget.ride,
                            r'''$.name''',
                          ).toString(),
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (FFAppState().selectedRide == widget.ride)
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: InkWell(
                      onTap: () async {
                        logFirebaseEvent('RIDE_TYPE_COMP_Icon_minnfokq_ON_TAP');
                        logFirebaseEvent('Icon_update_local_state');
                        FFAppState().update(() {
                          FFAppState().selectedRide = null;
                        });
                      },
                      child: Icon(
                        Icons.check_circle,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        size: 50,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
