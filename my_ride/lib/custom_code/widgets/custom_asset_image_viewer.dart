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

class CustomAssetImageViewer extends StatefulWidget {
  const CustomAssetImageViewer({
    Key? key,
    this.width,
    this.height,
    required this.assetImagePath,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String assetImagePath;

  @override
  CustomAssetImageViewerState createState() => CustomAssetImageViewerState();
}

class CustomAssetImageViewerState extends State<CustomAssetImageViewer> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      widget.assetImagePath,
      height: widget.height,
      width: widget.width,
      fit: BoxFit.contain,
    );
  }
}
