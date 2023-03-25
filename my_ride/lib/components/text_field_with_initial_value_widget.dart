import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TextFieldWithInitialValueWidget extends StatefulWidget {
  const TextFieldWithInitialValueWidget({
    Key? key,
    this.initialValue,
  }) : super(key: key);

  final String? initialValue;

  @override
  _TextFieldWithInitialValueWidgetState createState() =>
      _TextFieldWithInitialValueWidgetState();
}

class _TextFieldWithInitialValueWidgetState
    extends State<TextFieldWithInitialValueWidget> {
  TextEditingController? textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: FFAppState().routeFare);
  }

  @override
  void dispose() {
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return TextFormField(
      controller: textController,
      onChanged: (_) => EasyDebounce.debounce(
        'textController',
        Duration(milliseconds: 2000),
        () => setState(() {}),
      ),
      obscureText: false,
      decoration: InputDecoration(
        isDense: true,
        hintText: '[Some hint text...]',
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
