import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GiveWidget extends StatefulWidget {
  const GiveWidget({Key? key}) : super(key: key);

  @override
  _GiveWidgetState createState() => _GiveWidgetState();
}

class _GiveWidgetState extends State<GiveWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            'assets/images/45551-men-relaxing-on-working-chair_1.jpg',
            width: 163,
            height: 129,
            fit: BoxFit.contain,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Give',
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Poppins',
                      fontSize: 21,
                    ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sit back and relax, we’ll notify you before ride.',
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12, 16, 12, 0),
            child: FFButtonWidget(
              onPressed: () {
                print('Button pressed ...');
              },
              text: 'Check up coming rides',
              options: FFButtonOptions(
                width: double.infinity,
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
    );
  }
}
