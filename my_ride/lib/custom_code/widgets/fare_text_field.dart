// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '../../flutter_flow/instant_timer.dart';
import 'package:easy_debounce/easy_debounce.dart';

class FareTextField extends StatefulWidget {
  const FareTextField({
    Key? key,
    this.width,
    this.height,
    this.initialValue,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? initialValue;

  @override
  _FareTextFieldState createState() => _FareTextFieldState();
}

class _FareTextFieldState extends State<FareTextField> {
  TextEditingController? textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: widget.initialValue);
    final instantTimer = InstantTimer.periodic(
      duration: Duration(milliseconds: 1000),
      callback: (timer) async {
        setState(() {
          textController!.text = textController!.text;
        });
      },
      startImmediately: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    textController?.text = FFAppState().routeFare;
    return TextFormField(
      controller: textController,
      obscureText: false,
      decoration: InputDecoration(
        isDense: true,
        hintText: 'Offer a fare (Recommended fare)',
        hintStyle: FlutterFlowTheme.of(context).bodyText2,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).primaryText,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).primaryText,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFFF0000),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFFF0000),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      style: FlutterFlowTheme.of(context).bodyText1,
    );
  }
}
