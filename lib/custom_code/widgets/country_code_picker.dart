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

import 'package:google_fonts/google_fonts.dart';
import 'package:country_list_pick/country_list_pick.dart';

class CountryCodePicker extends StatefulWidget {
  const CountryCodePicker({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _CountryCodePickerState createState() => _CountryCodePickerState();
}

class _CountryCodePickerState extends State<CountryCodePicker> {
  String dialCode = "+1";

  @override
  Widget build(BuildContext context) {
    return CountryListPick(
      initialSelection: "+1",
      pickerBuilder: (context, countryCode) {
        print(countryCode);
        print(countryCode!.name);
        return SizedBox(
          child: Center(
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 22,
                  child: Image.asset(
                    countryCode.flagUri!,
                    fit: BoxFit.fill,
                    package: 'country_list_pick',
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Icon(
                  Icons.arrow_drop_down,
                  size: 11,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 7,
                ),
                Text(
                  countryCode.dialCode!,
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      appBar: AppBar(
        backgroundColor: const Color(0xFF37B44E),
        title: Text(
          "Select your country",
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 19,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      onChanged: (CountryCode? code) {
        print(code!.dialCode);
        if (code.dialCode != null) {
          setState(() {
            // code.dialCode = dialCode;
            dialCode = code.dialCode!;
            FFAppState()
                .update(() => FFAppState().countryCode = code.dialCode!);
          });
        }
      },
      theme: CountryTheme(
        isShowTitle: false,
        alphabetTextColor: Colors.white,
        labelColor: Colors.white,
        alphabetSelectedTextColor: Colors.white,
        alphabetSelectedBackgroundColor: Colors.white,
      ),
    );
  }
}
