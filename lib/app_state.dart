import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'flutter_flow/lat_lng.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    if (await secureStorage.read(key: 'ff_userdata') != null) {
      try {
        _userdata =
            jsonDecode(await secureStorage.getString('ff_userdata') ?? '');
      } catch (e) {
        print("Can't decode persisted json. Error: $e.");
      }
    }

    _rideID = await secureStorage.getString('ff_rideID') ?? _rideID;
    _declinedRidesId =
        await secureStorage.getStringList('ff_declinedRidesId') ??
            _declinedRidesId;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _countryCode = '';
  String get countryCode => _countryCode;
  set countryCode(String _value) {
    _countryCode = _value;
  }

  String _routeDistance = '';
  String get routeDistance => _routeDistance;
  set routeDistance(String _value) {
    _routeDistance = _value;
  }

  String _routeDuration = '';
  String get routeDuration => _routeDuration;
  set routeDuration(String _value) {
    _routeDuration = _value;
  }

  List<dynamic> _allRideTypes = [
    jsonDecode('{\"name\":\"Luxury\",\"image\":\"assets/images/luxury.png\"}'),
    jsonDecode(
        '{\"name\":\"Ride Mini\",\"image\":\"assets/images/ridemini.png\"}'),
    jsonDecode('{\"name\":\"Ride AC\",\"image\":\"assets/images/rideac.png\"}'),
    jsonDecode('{\"name\":\"Bike\",\"image\":\"assets/images/bike.png\"}')
  ];
  List<dynamic> get allRideTypes => _allRideTypes;
  set allRideTypes(List<dynamic> _value) {
    _allRideTypes = _value;
  }

  void addToAllRideTypes(dynamic _value) {
    _allRideTypes.add(_value);
  }

  void removeFromAllRideTypes(dynamic _value) {
    _allRideTypes.remove(_value);
  }

  dynamic _userdata;
  dynamic get userdata => _userdata;
  set userdata(dynamic _value) {
    _userdata = _value;
    secureStorage.setString('ff_userdata', jsonEncode(_value));
  }

  void deleteUserdata() {
    secureStorage.delete(key: 'ff_userdata');
  }

  String _routeFare = '';
  String get routeFare => _routeFare;
  set routeFare(String _value) {
    _routeFare = _value;
  }

  dynamic _selectedRide;
  dynamic get selectedRide => _selectedRide;
  set selectedRide(dynamic _value) {
    _selectedRide = _value;
  }

  String _destinationAddress = '';
  String get destinationAddress => _destinationAddress;
  set destinationAddress(String _value) {
    _destinationAddress = _value;
  }

  String _pickupAddress = '';
  String get pickupAddress => _pickupAddress;
  set pickupAddress(String _value) {
    _pickupAddress = _value;
  }

  LatLng? _startCoordinate;
  LatLng? get startCoordinate => _startCoordinate;
  set startCoordinate(LatLng? _value) {
    _startCoordinate = _value;
  }

  LatLng? _endCoordinate;
  LatLng? get endCoordinate => _endCoordinate;
  set endCoordinate(LatLng? _value) {
    _endCoordinate = _value;
  }

  String _date = '';
  String get date => _date;
  set date(String _value) {
    _date = _value;
  }

  String _time = '';
  String get time => _time;
  set time(String _value) {
    _time = _value;
  }

  String _rideID = '';
  String get rideID => _rideID;
  set rideID(String _value) {
    _rideID = _value;
    secureStorage.setString('ff_rideID', _value);
  }

  void deleteRideID() {
    secureStorage.delete(key: 'ff_rideID');
  }

  List<String> _declinedRidesId = ['0'];
  List<String> get declinedRidesId => _declinedRidesId;
  set declinedRidesId(List<String> _value) {
    _declinedRidesId = _value;
    secureStorage.setStringList('ff_declinedRidesId', _value);
  }

  void deleteDeclinedRidesId() {
    secureStorage.delete(key: 'ff_declinedRidesId');
  }

  void addToDeclinedRidesId(String _value) {
    _declinedRidesId.add(_value);
    secureStorage.setStringList('ff_declinedRidesId', _declinedRidesId);
  }

  void removeFromDeclinedRidesId(String _value) {
    _declinedRidesId.remove(_value);
    secureStorage.setStringList('ff_declinedRidesId', _declinedRidesId);
  }

  bool _locationPermission = false;
  bool get locationPermission => _locationPermission;
  set locationPermission(bool _value) {
    _locationPermission = _value;
  }

  List<int> _driverAvailableRideIds = [];
  List<int> get driverAvailableRideIds => _driverAvailableRideIds;
  set driverAvailableRideIds(List<int> _value) {
    _driverAvailableRideIds = _value;
  }

  void addToDriverAvailableRideIds(int _value) {
    _driverAvailableRideIds.add(_value);
  }

  void removeFromDriverAvailableRideIds(int _value) {
    _driverAvailableRideIds.remove(_value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await write(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await write(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await write(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await write(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await write(key: key, value: ListToCsvConverter().convert([value]));
}
