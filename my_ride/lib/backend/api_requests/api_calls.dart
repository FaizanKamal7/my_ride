import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Django Server Group Code

class DjangoServerGroup {
  static String baseUrl = 'http://68.183.80.107:8000';
  static Map<String, String> headers = {};
  static TripStatusCall tripStatusCall = TripStatusCall();
  static TripStatusPatchCall tripStatusPatchCall = TripStatusPatchCall();
  static UserRideHistoryCall userRideHistoryCall = UserRideHistoryCall();
  static DriverRideHistoryCall driverRideHistoryCall = DriverRideHistoryCall();
  static UserRatingCall userRatingCall = UserRatingCall();
  static DriverRatingsCall driverRatingsCall = DriverRatingsCall();
  static UserRatingsCall userRatingsCall = UserRatingsCall();
  static CancellationReasonCall cancellationReasonCall =
      CancellationReasonCall();
  static CancellationReasonPatchCall cancellationReasonPatchCall =
      CancellationReasonPatchCall();
  static DriverRatingsPatchCall driverRatingsPatchCall =
      DriverRatingsPatchCall();
  static UsersCall usersCall = UsersCall();
  static UsersPostCall usersPostCall = UsersPostCall();
  static DriversCall driversCall = DriversCall();
  static DriversPostCall driversPostCall = DriversPostCall();
  static DriverOfferGetCall driverOfferGetCall = DriverOfferGetCall();
  static NewRideCall newRideCall = NewRideCall();
  static DriverOfferPostCall driverOfferPostCall = DriverOfferPostCall();
  static AddCarPoolCall addCarPoolCall = AddCarPoolCall();
  static OfferRidePostCall offerRidePostCall = OfferRidePostCall();
  static DriverOfferRideCall driverOfferRideCall = DriverOfferRideCall();
  static UserDataCall userDataCall = UserDataCall();
  static DriverDataCall driverDataCall = DriverDataCall();
  static RideDetailsCall rideDetailsCall = RideDetailsCall();
  static DeliveryCall deliveryCall = DeliveryCall();
  static UserMessageCall userMessageCall = UserMessageCall();
  static DriverMessageCall driverMessageCall = DriverMessageCall();
  static PickupLocationCall pickupLocationCall = PickupLocationCall();
  static UpdateFareCall updateFareCall = UpdateFareCall();
  static MiniFareCall miniFareCall = MiniFareCall();
  static LuxuryFareCall luxuryFareCall = LuxuryFareCall();
  static AcFareCall acFareCall = AcFareCall();
  static BikeRideCall bikeRideCall = BikeRideCall();
  static CustomerListsCall customerListsCall = CustomerListsCall();
  static AcceptDriverCall acceptDriverCall = AcceptDriverCall();
  static SavedDestinationCall savedDestinationCall = SavedDestinationCall();
  static AddSavedDestinationCall addSavedDestinationCall =
      AddSavedDestinationCall();
  static DriverStatsCall driverStatsCall = DriverStatsCall();
  static DriverStatsPostCall driverStatsPostCall = DriverStatsPostCall();
  static DriverImageCall driverImageCall = DriverImageCall();
}

class TripStatusCall {
  Future<ApiCallResponse> call({
    String? tripId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'TripStatus',
      apiUrl: '${DjangoServerGroup.baseUrl}/status/${tripId}',
      callType: ApiCallType.GET,
      headers: {
        ...DjangoServerGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic statusGet(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
}

class TripStatusPatchCall {
  Future<ApiCallResponse> call({
    String? status = '',
    int? id,
  }) {
    final body = '''
{
  "status": "${status}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'TripStatusPatch',
      apiUrl: '${DjangoServerGroup.baseUrl}/status/${id}',
      callType: ApiCallType.PATCH,
      headers: {
        ...DjangoServerGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic statusPatch(dynamic response) => getJsonField(
        response,
        r'''$.status''',
        true,
      );
}

class UserRideHistoryCall {
  Future<ApiCallResponse> call({
    String? uId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'UserRideHistory',
      apiUrl: '${DjangoServerGroup.baseUrl}/ride_history/${uId}',
      callType: ApiCallType.GET,
      headers: {
        ...DjangoServerGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic fare(dynamic response) => getJsonField(
        response,
        r'''$[:].Fare''',
        true,
      );
  dynamic distance(dynamic response) => getJsonField(
        response,
        r'''$[:].Km''',
        true,
      );
  dynamic dropLocationLng(dynamic response) => getJsonField(
        response,
        r'''$[:].drop_location_long''',
        true,
      );
  dynamic dropLocationLat(dynamic response) => getJsonField(
        response,
        r'''$[:].drop_location_lat''',
        true,
      );
  dynamic pickupLocationLng(dynamic response) => getJsonField(
        response,
        r'''$[:].pickup_location_long''',
        true,
      );
  dynamic pickupLocationLat(dynamic response) => getJsonField(
        response,
        r'''$[:].pickup_location_lat''',
        true,
      );
  dynamic rideTime(dynamic response) => getJsonField(
        response,
        r'''$[:].Ride_Time''',
        true,
      );
  dynamic date(dynamic response) => getJsonField(
        response,
        r'''$[:].Date''',
        true,
      );
  dynamic driverUID(dynamic response) => getJsonField(
        response,
        r'''$[:].Driver_Uid''',
        true,
      );
  dynamic carpoolingUser3UID(dynamic response) => getJsonField(
        response,
        r'''$[:].Carpooling_User_3_Uid''',
        true,
      );
  dynamic carpoolingUser2UID(dynamic response) => getJsonField(
        response,
        r'''$[:].Carpooling_User_2_Uid''',
        true,
      );
  dynamic carpoolingUser1UID(dynamic response) => getJsonField(
        response,
        r'''$[:].Carpooling_User_1_Uid''',
        true,
      );
  dynamic ride(dynamic response) => getJsonField(
        response,
        r'''$[:].Ride''',
        true,
      );
  dynamic userUID(dynamic response) => getJsonField(
        response,
        r'''$[:].User_Uid''',
        true,
      );
  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
        true,
      );
  dynamic userRating(dynamic response) => getJsonField(
        response,
        r'''$[:].User_ratings''',
        true,
      );
  dynamic driverRatings(dynamic response) => getJsonField(
        response,
        r'''$[:].Driver_ratings''',
        true,
      );
  dynamic cancelRide(dynamic response) => getJsonField(
        response,
        r'''$[:].Cancel_Ride''',
        true,
      );
  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$[:].status''',
        true,
      );
  dynamic userDetail(dynamic response) => getJsonField(
        response,
        r'''$[:].User_Detail''',
        true,
      );
  dynamic driverDetail(dynamic response) => getJsonField(
        response,
        r'''$[:].Driver_Detail''',
        true,
      );
  dynamic rideList(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      );
}

class DriverRideHistoryCall {
  Future<ApiCallResponse> call({
    int? id,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'DriverRideHistory',
      apiUrl: '${DjangoServerGroup.baseUrl}/ride_history/driver/${id}',
      callType: ApiCallType.GET,
      headers: {
        ...DjangoServerGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic driverDetails(dynamic response) => getJsonField(
        response,
        r'''$[:].Driver_Detail''',
        true,
      );
  dynamic userDetails(dynamic response) => getJsonField(
        response,
        r'''$[:].User_Detail''',
        true,
      );
  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$[:].status''',
        true,
      );
  dynamic cancelRide(dynamic response) => getJsonField(
        response,
        r'''$[:].Cancel_Ride''',
        true,
      );
  dynamic driverRatings(dynamic response) => getJsonField(
        response,
        r'''$[:].Driver_ratings''',
        true,
      );
  dynamic userRatings(dynamic response) => getJsonField(
        response,
        r'''$[:].User_ratings''',
        true,
      );
  dynamic fare(dynamic response) => getJsonField(
        response,
        r'''$[:].Fare''',
        true,
      );
  dynamic distance(dynamic response) => getJsonField(
        response,
        r'''$[:].Km''',
        true,
      );
  dynamic dropLocationLng(dynamic response) => getJsonField(
        response,
        r'''$[:].drop_location_long''',
        true,
      );
  dynamic dropLocationLat(dynamic response) => getJsonField(
        response,
        r'''$[:].drop_location_lat''',
        true,
      );
  dynamic pickupLocationLng(dynamic response) => getJsonField(
        response,
        r'''$[:].pickup_location_long''',
        true,
      );
  dynamic pickupLocationLat(dynamic response) => getJsonField(
        response,
        r'''$[:].pickup_location_lat''',
        true,
      );
  dynamic rideTime(dynamic response) => getJsonField(
        response,
        r'''$[:].Ride_Time''',
        true,
      );
  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
        true,
      );
  dynamic userUID(dynamic response) => getJsonField(
        response,
        r'''$[:].User_Uid''',
        true,
      );
  dynamic ride(dynamic response) => getJsonField(
        response,
        r'''$[:].Ride''',
        true,
      );
  dynamic carpoolingUser1UID(dynamic response) => getJsonField(
        response,
        r'''$[:].Carpooling_User_1_Uid''',
        true,
      );
  dynamic carpoolingUser2UID(dynamic response) => getJsonField(
        response,
        r'''$[:].Carpooling_User_2_Uid''',
        true,
      );
  dynamic carpoolingUser3UID(dynamic response) => getJsonField(
        response,
        r'''$[:].Carpooling_User_3_Uid''',
        true,
      );
  dynamic driverUID(dynamic response) => getJsonField(
        response,
        r'''$[:].Driver_Uid''',
        true,
      );
  dynamic date(dynamic response) => getJsonField(
        response,
        r'''$[:].Date''',
        true,
      );
  dynamic rideList(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      );
}

class UserRatingCall {
  Future<ApiCallResponse> call({
    int? id,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'UserRating',
      apiUrl: '${DjangoServerGroup.baseUrl}/User-ratings/${id}',
      callType: ApiCallType.GET,
      headers: {
        ...DjangoServerGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic userRating(dynamic response) => getJsonField(
        response,
        r'''$.User_ratings''',
      );
}

class DriverRatingsCall {
  Future<ApiCallResponse> call({
    int? id,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'DriverRatings',
      apiUrl: '${DjangoServerGroup.baseUrl}/Driver-ratings/${id}',
      callType: ApiCallType.GET,
      headers: {
        ...DjangoServerGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic driverRating(dynamic response) => getJsonField(
        response,
        r'''$.Driver_ratings''',
      );
}

class UserRatingsCall {
  Future<ApiCallResponse> call({
    int? userRatings,
    int? id,
  }) {
    final body = '''
{
  "User_ratings": ${userRatings}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UserRatings',
      apiUrl: '${DjangoServerGroup.baseUrl}/User-ratings/${id}',
      callType: ApiCallType.PATCH,
      headers: {
        ...DjangoServerGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic userRatingPatch(dynamic response) => getJsonField(
        response,
        r'''$.User_ratings''',
      );
}

class CancellationReasonCall {
  Future<ApiCallResponse> call({
    int? id,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'cancellationReason',
      apiUrl: '${DjangoServerGroup.baseUrl}/Cancellation-Reason/${id}',
      callType: ApiCallType.GET,
      headers: {
        ...DjangoServerGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic canceRide(dynamic response) => getJsonField(
        response,
        r'''$.Cancel_Ride''',
      );
}

class CancellationReasonPatchCall {
  Future<ApiCallResponse> call({
    String? cancelRide = '',
    int? id,
  }) {
    final body = '''
{
  "Cancel_Ride": "${cancelRide}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CancellationReasonPatch',
      apiUrl: '${DjangoServerGroup.baseUrl}/Cancellation-Reason/${id}',
      callType: ApiCallType.PATCH,
      headers: {
        ...DjangoServerGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic cancelRidePatch(dynamic response) => getJsonField(
        response,
        r'''$.Cancel_Ride''',
      );
}

class DriverRatingsPatchCall {
  Future<ApiCallResponse> call({
    int? driverRatings,
    int? id,
  }) {
    final body = '''
{
  "Driver_ratings": ${driverRatings}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'DriverRatingsPatch',
      apiUrl: '${DjangoServerGroup.baseUrl}/Driver-ratings/${id}',
      callType: ApiCallType.PATCH,
      headers: {
        ...DjangoServerGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic driverRatingPatch(dynamic response) => getJsonField(
        response,
        r'''$.Driver_ratings''',
      );
}

class UsersCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Users',
      apiUrl: '${DjangoServerGroup.baseUrl}/user_api/',
      callType: ApiCallType.GET,
      headers: {
        ...DjangoServerGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic uId(dynamic response) => getJsonField(
        response,
        r'''$[:].UId''',
        true,
      );
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$[:].name''',
        true,
      );
  dynamic dateOfBirth(dynamic response) => getJsonField(
        response,
        r'''$[:].date_of_birth''',
        true,
      );
  dynamic gender(dynamic response) => getJsonField(
        response,
        r'''$[:].gender''',
        true,
      );
  dynamic phoneNumber(dynamic response) => getJsonField(
        response,
        r'''$[:].phone_number''',
        true,
      );
  dynamic homeAddress(dynamic response) => getJsonField(
        response,
        r'''$[:].home_address''',
        true,
      );
  dynamic usersList(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      );
}

class UsersPostCall {
  Future<ApiCallResponse> call({
    String? uId = '',
    String? dateofbirth = '',
    String? gender = '',
    int? phonenumber,
    String? homeaddress = '',
    String? workaddress = '',
    int? totalrides,
    String? name = '',
    double? ratings,
    String? userImage = '',
  }) {
    final body = '''
{
  "UId": "${uId}",
  "name": "${name}",
  "date_of_birth": "${dateofbirth}",
  "gender": "${gender}",
  "phone_number": ${phonenumber},
  "home_address": "${homeaddress}",
  "work_address": "${workaddress}",
  "total_rides": ${totalrides},
  "ratings": "${ratings}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UsersPost',
      apiUrl: '${DjangoServerGroup.baseUrl}/user_api/',
      callType: ApiCallType.POST,
      headers: {
        ...DjangoServerGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic uId(dynamic response) => getJsonField(
        response,
        r'''$.UId''',
      );
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.name''',
      );
  dynamic dateofbirth(dynamic response) => getJsonField(
        response,
        r'''$.date_of_birth''',
      );
  dynamic gender(dynamic response) => getJsonField(
        response,
        r'''$.gender''',
      );
  dynamic phoneNumber(dynamic response) => getJsonField(
        response,
        r'''$.phone_number''',
      );
  dynamic homeAddress(dynamic response) => getJsonField(
        response,
        r'''$.home_address''',
      );
  dynamic totalRides(dynamic response) => getJsonField(
        response,
        r'''$.total_rides''',
      );
  dynamic ratings(dynamic response) => getJsonField(
        response,
        r'''$.ratings''',
      );
}

class DriversCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Drivers',
      apiUrl: '${DjangoServerGroup.baseUrl}/drivers_api/',
      callType: ApiCallType.GET,
      headers: {
        ...DjangoServerGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic uId(dynamic response) => getJsonField(
        response,
        r'''$[:].UId''',
        true,
      );
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$[:].name''',
        true,
      );
  dynamic dateOfBirth(dynamic response) => getJsonField(
        response,
        r'''$[:].date_of_birth''',
        true,
      );
  dynamic currentLocationLat(dynamic response) => getJsonField(
        response,
        r'''$[:].current_location_lat''',
        true,
      );
  dynamic currentLocationLong(dynamic response) => getJsonField(
        response,
        r'''$[:].current_location_long''',
        true,
      );
  dynamic lastLocationLong(dynamic response) => getJsonField(
        response,
        r'''$[:].last_location_long''',
        true,
      );
  dynamic lastLocationLat(dynamic response) => getJsonField(
        response,
        r'''$[:].last_location_lat''',
        true,
      );
  dynamic earnings(dynamic response) => getJsonField(
        response,
        r'''$[:].earnings''',
        true,
      );
  dynamic insuranceNo(dynamic response) => getJsonField(
        response,
        r'''$[:].insurance_no''',
        true,
      );
  dynamic licenseNo(dynamic response) => getJsonField(
        response,
        r'''$[:].license_no''',
        true,
      );
  dynamic vehicleName(dynamic response) => getJsonField(
        response,
        r'''$[:].vehicle_name''',
        true,
      );
  dynamic vechicleNo(dynamic response) => getJsonField(
        response,
        r'''$[:].vehicle_no''',
        true,
      );
  dynamic phoneNumber(dynamic response) => getJsonField(
        response,
        r'''$[:].phone_number''',
        true,
      );
  dynamic gender(dynamic response) => getJsonField(
        response,
        r'''$[:].gender''',
        true,
      );
  dynamic driversList(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      );
}

class DriversPostCall {
  Future<ApiCallResponse> call({
    String? dateofbirth = '',
    String? gender = '',
    int? phonenumber,
    String? vehicleNo = '',
    String? vichleName = '',
    String? licenseNo = '',
    String? insuranceNo = '',
    int? earnings,
    String? allRides = '',
    double? lastLocationLat,
    double? lastLocationLong,
    double? currentLocationLat,
    double? currentLocationLong,
    String? name = '',
    String? uId = '',
    String? driverImage = '',
  }) {
    final body = '''
{
  "UId": "${uId}",
  "name": "${name}",
  "date_of_birth": "${dateofbirth}",
  "gender": "${gender}",
  "phone_number": ${phonenumber},
  "vehicle_no": "${vehicleNo}",
  "vehicle_name": "${vichleName}",
  "license_no": "${licenseNo}",
  "insurance_no": "${insuranceNo}",
  "earnings": ${earnings},
  "all_rides": "${allRides}",
  "last_location_lat": ${lastLocationLat},
  "last_location_long": ${lastLocationLong},
  "current_location_lat": ${currentLocationLat},
  "current_location_long": ${currentLocationLong}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'DriversPost',
      apiUrl: '${DjangoServerGroup.baseUrl}/drivers_api/',
      callType: ApiCallType.POST,
      headers: {
        ...DjangoServerGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic uId(dynamic response) => getJsonField(
        response,
        r'''$.UId''',
      );
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.name''',
      );
  dynamic dateOfBirth(dynamic response) => getJsonField(
        response,
        r'''$.date_of_birth''',
      );
  dynamic gender(dynamic response) => getJsonField(
        response,
        r'''$.gender''',
      );
  dynamic phoneNumber(dynamic response) => getJsonField(
        response,
        r'''$.phone_number''',
      );
  dynamic vechileNo(dynamic response) => getJsonField(
        response,
        r'''$.vehicle_no''',
      );
  dynamic vechileName(dynamic response) => getJsonField(
        response,
        r'''$.vehicle_name''',
      );
  dynamic licenseNo(dynamic response) => getJsonField(
        response,
        r'''$.license_no''',
      );
  dynamic insuranceNo(dynamic response) => getJsonField(
        response,
        r'''$.insurance_no''',
      );
  dynamic earnings(dynamic response) => getJsonField(
        response,
        r'''$.earnings''',
      );
  dynamic lastLocationLat(dynamic response) => getJsonField(
        response,
        r'''$.last_location_lat''',
      );
  dynamic lastLocationLong(dynamic response) => getJsonField(
        response,
        r'''$.last_location_long''',
      );
  dynamic currentLocationLat(dynamic response) => getJsonField(
        response,
        r'''$.current_location_lat''',
      );
  dynamic currentLocationLong(dynamic response) => getJsonField(
        response,
        r'''$.current_location_long''',
      );
}

class DriverOfferGetCall {
  Future<ApiCallResponse> call({
    String? userUid = '',
    String? date = '',
    String? time = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'DriverOfferGet',
      apiUrl:
          '${DjangoServerGroup.baseUrl}/offer_ride_get/${userUid}/${date}/${time}',
      callType: ApiCallType.GET,
      headers: {
        ...DjangoServerGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  dynamic userUid(dynamic response) => getJsonField(
        response,
        r'''$.User_Uid''',
      );
  dynamic pickUpLocation(dynamic response) => getJsonField(
        response,
        r'''$.pickup_location_lat''',
      );
  dynamic pickUpLong(dynamic response) => getJsonField(
        response,
        r'''$.pickup_location_long''',
      );
  dynamic dropLocationLat(dynamic response) => getJsonField(
        response,
        r'''$.drop_location_lat''',
      );
  dynamic dropLocationLong(dynamic response) => getJsonField(
        response,
        r'''$.drop_location_long''',
      );
  dynamic useroffer(dynamic response) => getJsonField(
        response,
        r'''$.User_offer''',
      );
  dynamic date(dynamic response) => getJsonField(
        response,
        r'''$.Date''',
      );
  dynamic rideTime(dynamic response) => getJsonField(
        response,
        r'''$.Ride_Time''',
      );
  dynamic offers(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      );
}

class NewRideCall {
  Future<ApiCallResponse> call({
    String? userUid = '',
    String? ride = '',
    String? carpoolingUser1Uid = '',
    String? carpoolingUser2Uid = '',
    String? carpoolingUser3Uid = '',
    String? date = '',
    String? rideTime = '',
    double? pickupLocationLat,
    double? pickupLocationLong,
    double? dropLocationLat,
    double? dropLocationLong,
    int? fare,
    String? address = '',
    String? dropAddress = '',
  }) {
    final body = '''
{
  "User_Uid": "${userUid}",
  "Ride": "${ride}",
  "Carpooling_User_1_Uid": "${carpoolingUser1Uid}",
  "Carpooling_User_2_Uid": "${carpoolingUser2Uid}",
  "Carpooling_User_3_Uid": "${carpoolingUser3Uid}",
  "Date": "${date}",
  "Ride_Time": "${rideTime}",
  "pickup_location_lat": "${pickupLocationLat}",
  "pickup_location_long": "${pickupLocationLong}",
  "drop_location_lat": "${dropLocationLat}",
  "drop_location_long": "${dropLocationLong}",
  "Fare": ${fare},
  "Address": "${address}",
  "Drop_Address": "${dropAddress}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'newRide',
      apiUrl: '${DjangoServerGroup.baseUrl}/new-ride/${ride}',
      callType: ApiCallType.POST,
      headers: {
        ...DjangoServerGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic carpoolingUser1Uid(dynamic response) => getJsonField(
        response,
        r'''$.Carpooling_User_1_Uid''',
      );
  dynamic carpoolingUser2Uid(dynamic response) => getJsonField(
        response,
        r'''$.Carpooling_User_2_Uid''',
      );
  dynamic carpoolingUser3Uid(dynamic response) => getJsonField(
        response,
        r'''$.Carpooling_User_3_Uid''',
      );
  dynamic date(dynamic response) => getJsonField(
        response,
        r'''$.Date''',
      );
  dynamic riseTime(dynamic response) => getJsonField(
        response,
        r'''$.Ride_Time''',
      );
  dynamic pickUpLocationLAT(dynamic response) => getJsonField(
        response,
        r'''$.pickup_location_lat''',
      );
  dynamic pickUpLocationLong(dynamic response) => getJsonField(
        response,
        r'''$.pickup_location_long''',
      );
  dynamic dropLocationLAT(dynamic response) => getJsonField(
        response,
        r'''$.drop_location_lat''',
      );
  dynamic dropLocationLong(dynamic response) => getJsonField(
        response,
        r'''$.drop_location_long''',
      );
  dynamic km(dynamic response) => getJsonField(
        response,
        r'''$.Km''',
      );
  dynamic fare(dynamic response) => getJsonField(
        response,
        r'''$.Fare''',
      );
  dynamic userRatings(dynamic response) => getJsonField(
        response,
        r'''$.User_ratings''',
      );
  dynamic driverRatings(dynamic response) => getJsonField(
        response,
        r'''$.Driver_ratings''',
      );
  dynamic cancelRide(dynamic response) => getJsonField(
        response,
        r'''$.Cancel_Ride''',
      );
  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  dynamic userUId(dynamic response) => getJsonField(
        response,
        r'''$.User_Uid''',
      );
  dynamic ride(dynamic response) => getJsonField(
        response,
        r'''$.Ride''',
      );
  dynamic address(dynamic response) => getJsonField(
        response,
        r'''$.Address''',
      );
  dynamic rideId(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
}

class DriverOfferPostCall {
  Future<ApiCallResponse> call({
    int? rideId,
    String? uId = '',
    int? offer,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'DriverOfferPost',
      apiUrl:
          '${DjangoServerGroup.baseUrl}/driver_offer_ride/${rideId}/${uId}/${offer}/',
      callType: ApiCallType.POST,
      headers: {
        ...DjangoServerGroup.headers,
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.name''',
      );
  dynamic dateOfBirth(dynamic response) => getJsonField(
        response,
        r'''$.date_of_birth''',
      );
  dynamic gender(dynamic response) => getJsonField(
        response,
        r'''$.gender''',
      );
  dynamic phoneNumber(dynamic response) => getJsonField(
        response,
        r'''$.phone_number''',
      );
  dynamic driverImage(dynamic response) => getJsonField(
        response,
        r'''$.driver_image''',
      );
  dynamic vechileNum(dynamic response) => getJsonField(
        response,
        r'''$.vehicle_no''',
      );
  dynamic vechileName(dynamic response) => getJsonField(
        response,
        r'''$.vehicle_name''',
      );
  dynamic licenseNo(dynamic response) => getJsonField(
        response,
        r'''$.license_no''',
      );
  dynamic insuranceNo(dynamic response) => getJsonField(
        response,
        r'''$.insurance_no''',
      );
  dynamic ratings(dynamic response) => getJsonField(
        response,
        r'''$.ratings''',
      );
  dynamic address(dynamic response) => getJsonField(
        response,
        r'''$.Address''',
      );
  dynamic dropAddress(dynamic response) => getJsonField(
        response,
        r'''$.Drop_Address''',
      );
  dynamic rideID(dynamic response) => getJsonField(
        response,
        r'''$.Ride_id''',
      );
  dynamic driverOffer(dynamic response) => getJsonField(
        response,
        r'''$.Driver_offer''',
      );
}

class AddCarPoolCall {
  Future<ApiCallResponse> call({
    int? id,
    String? carpoolingUser1Uid = '',
    String? carpoolingUser2Uid = '',
    String? carpoolingUser3Uid = '',
  }) {
    final body = '''
{
  "Carpooling_User_1_Uid": "${carpoolingUser1Uid}",
  "Carpooling_User_2_Uid": "${carpoolingUser2Uid}",
  "Carpooling_User_3_Uid": "${carpoolingUser3Uid}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AddCarPool',
      apiUrl: '${DjangoServerGroup.baseUrl}/add_carpool/${id}',
      callType: ApiCallType.PATCH,
      headers: {
        ...DjangoServerGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic carpoolingUser1UId(dynamic response) => getJsonField(
        response,
        r'''$.Carpooling_User_1_Uid''',
      );
  dynamic carpoolingUser2UId(dynamic response) => getJsonField(
        response,
        r'''$.Carpooling_User_2_Uid''',
      );
  dynamic carpoolingUser3UId(dynamic response) => getJsonField(
        response,
        r'''$.Carpooling_User_3_Uid''',
      );
}

class OfferRidePostCall {
  Future<ApiCallResponse> call({
    String? userUid = '',
    double? pickupLocationLat,
    double? pickupLocationLong,
    double? dropLocationLat,
    double? dropLocationLong,
    int? userOffer,
    String? rideTime = '',
    String? date = '',
    String? address = '',
    String? dropAddress = '',
  }) {
    final body = '''
{
  "User_Uid": "${userUid}",
  "pickup_location_lat": ${pickupLocationLat},
  "pickup_location_long": ${pickupLocationLong},
  "drop_location_lat": ${dropLocationLat},
  "drop_location_long": ${pickupLocationLong},
  "User_offer": ${userOffer},
  "Date": "${date}",
  "Ride_Time": "${rideTime}",
  "Driver_offer": ${userOffer},
  "Address": "${address}",
  "Drop_Address":"${dropAddress}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'OfferRidePost',
      apiUrl: '${DjangoServerGroup.baseUrl}/offer_ride_post/',
      callType: ApiCallType.POST,
      headers: {
        ...DjangoServerGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  dynamic userUID(dynamic response) => getJsonField(
        response,
        r'''$.User_Uid''',
      );
  dynamic pickupLocationLat(dynamic response) => getJsonField(
        response,
        r'''$.pickup_location_lat''',
      );
  dynamic pickupLocationLong(dynamic response) => getJsonField(
        response,
        r'''$.pickup_location_long''',
      );
  dynamic dropLocationLat(dynamic response) => getJsonField(
        response,
        r'''$.drop_location_lat''',
      );
  dynamic dropLocationLong(dynamic response) => getJsonField(
        response,
        r'''$.drop_location_long''',
      );
  dynamic userOffer(dynamic response) => getJsonField(
        response,
        r'''$.User_offer''',
      );
  dynamic date(dynamic response) => getJsonField(
        response,
        r'''$.Date''',
      );
  dynamic rideTime(dynamic response) => getJsonField(
        response,
        r'''$.Ride_Time''',
      );
  dynamic driverOffer(dynamic response) => getJsonField(
        response,
        r'''$.Driver_offer''',
      );
}

class DriverOfferRideCall {
  Future<ApiCallResponse> call({
    int? id,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'DriverOfferRide',
      apiUrl: '${DjangoServerGroup.baseUrl}/driver_offer_ride/${id}',
      callType: ApiCallType.GET,
      headers: {
        ...DjangoServerGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
      );
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$[:].name''',
      );
  dynamic dateOfBirth(dynamic response) => getJsonField(
        response,
        r'''$[:].date_of_birth''',
      );
  dynamic gender(dynamic response) => getJsonField(
        response,
        r'''$[:].gender''',
      );
  dynamic phoneNumber(dynamic response) => getJsonField(
        response,
        r'''$[:].phone_number''',
      );
  dynamic driverImage(dynamic response) => getJsonField(
        response,
        r'''$[:].driver_image''',
      );
  dynamic vehicleNo(dynamic response) => getJsonField(
        response,
        r'''$[:].vehicle_no''',
      );
  dynamic vehicleName(dynamic response) => getJsonField(
        response,
        r'''$[:].vehicle_name''',
      );
  dynamic licenseNo(dynamic response) => getJsonField(
        response,
        r'''$[:].license_no''',
      );
  dynamic insuaranceNo(dynamic response) => getJsonField(
        response,
        r'''$[:].insurance_no''',
      );
  dynamic driverOfferPrice(dynamic response) => getJsonField(
        response,
        r'''$[:].Driver_offer_price''',
      );
  dynamic rideID(dynamic response) => getJsonField(
        response,
        r'''$[:].Ride_id''',
      );
  dynamic ridesList(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      );
}

class UserDataCall {
  Future<ApiCallResponse> call({
    String? uId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'UserData',
      apiUrl: '${DjangoServerGroup.baseUrl}/user-data/${uId}',
      callType: ApiCallType.GET,
      headers: {
        ...DjangoServerGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic uId(dynamic response) => getJsonField(
        response,
        r'''$.UId''',
      );
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.name''',
      );
  dynamic dateOfBIrth(dynamic response) => getJsonField(
        response,
        r'''$.date_of_birth''',
      );
  dynamic gender(dynamic response) => getJsonField(
        response,
        r'''$.gender''',
      );
  dynamic phoneNumber(dynamic response) => getJsonField(
        response,
        r'''$.phone_number''',
      );
  dynamic homeAddress(dynamic response) => getJsonField(
        response,
        r'''$.home_address''',
      );
  dynamic ratings(dynamic response) => getJsonField(
        response,
        r'''$.ratings''',
      );
  dynamic totalRides(dynamic response) => getJsonField(
        response,
        r'''$.total_rides''',
      );
}

class DriverDataCall {
  Future<ApiCallResponse> call({
    String? uId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'DriverData',
      apiUrl: '${DjangoServerGroup.baseUrl}/driver-data/${uId}',
      callType: ApiCallType.GET,
      headers: {
        ...DjangoServerGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic uid(dynamic response) => getJsonField(
        response,
        r'''$.UId''',
      );
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.name''',
      );
  dynamic dateOfBirth(dynamic response) => getJsonField(
        response,
        r'''$.date_of_birth''',
      );
  dynamic gender(dynamic response) => getJsonField(
        response,
        r'''$.gender''',
      );
  dynamic phoneNumber(dynamic response) => getJsonField(
        response,
        r'''$.phone_number''',
      );
  dynamic vechicleNo(dynamic response) => getJsonField(
        response,
        r'''$.vehicle_no''',
      );
  dynamic vechileName(dynamic response) => getJsonField(
        response,
        r'''$.vehicle_name''',
      );
  dynamic licenseNo(dynamic response) => getJsonField(
        response,
        r'''$.license_no''',
      );
  dynamic insuranceNo(dynamic response) => getJsonField(
        response,
        r'''$.insurance_no''',
      );
  dynamic earnings(dynamic response) => getJsonField(
        response,
        r'''$.earnings''',
      );
  dynamic lastLocationLat(dynamic response) => getJsonField(
        response,
        r'''$.last_location_lat''',
      );
  dynamic lastLocationLong(dynamic response) => getJsonField(
        response,
        r'''$.last_location_long''',
      );
  dynamic currentLocationLat(dynamic response) => getJsonField(
        response,
        r'''$.current_location_lat''',
      );
  dynamic currentLocationLong(dynamic response) => getJsonField(
        response,
        r'''$.current_location_long''',
      );
  dynamic rating(dynamic response) => getJsonField(
        response,
        r'''$.ratings''',
      );
  dynamic driverImage(dynamic response) => getJsonField(
        response,
        r'''$.driver_image''',
      );
}

class RideDetailsCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'RideDetails',
      apiUrl: '${DjangoServerGroup.baseUrl}/Ride-Details/${id}',
      callType: ApiCallType.GET,
      headers: {
        ...DjangoServerGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  dynamic userUid(dynamic response) => getJsonField(
        response,
        r'''$.User_Uid''',
      );
  dynamic ride(dynamic response) => getJsonField(
        response,
        r'''$.Ride''',
      );
  dynamic driverUid(dynamic response) => getJsonField(
        response,
        r'''$.Driver_Uid''',
      );
  dynamic date(dynamic response) => getJsonField(
        response,
        r'''$.Date''',
      );
  dynamic pickerLocationLat(dynamic response) => getJsonField(
        response,
        r'''$.pickup_location_lat''',
      );
  dynamic pickUpLaong(dynamic response) => getJsonField(
        response,
        r'''$.pickup_location_long''',
      );
  dynamic dropLat(dynamic response) => getJsonField(
        response,
        r'''$.drop_location_lat''',
      );
  dynamic dropLong(dynamic response) => getJsonField(
        response,
        r'''$.drop_location_long''',
      );
  dynamic km(dynamic response) => getJsonField(
        response,
        r'''$.Km''',
      );
  dynamic fare(dynamic response) => getJsonField(
        response,
        r'''$.Fare''',
      );
  dynamic userRating(dynamic response) => getJsonField(
        response,
        r'''$.User_ratings''',
      );
  dynamic driverRating(dynamic response) => getJsonField(
        response,
        r'''$.Driver_ratings''',
      );
  dynamic canceRide(dynamic response) => getJsonField(
        response,
        r'''$.Cancel_Ride''',
      );
  dynamic satus(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  dynamic rideType(dynamic response) => getJsonField(
        response,
        r'''$.Ride_Type''',
      );
  dynamic rideTime(dynamic response) => getJsonField(
        response,
        r'''$.Ride_Time''',
      );
  dynamic address(dynamic response) => getJsonField(
        response,
        r'''$.Address''',
      );
  dynamic dropAddress(dynamic response) => getJsonField(
        response,
        r'''$.Drop_Address''',
      );
  dynamic userDetail(dynamic response) => getJsonField(
        response,
        r'''$.User_Detail''',
      );
  dynamic driverDetail(dynamic response) => getJsonField(
        response,
        r'''$.Driver_Detail''',
      );
  dynamic carpoolingUser1Uid(dynamic response) => getJsonField(
        response,
        r'''$.Carpooling_User_1_Uid''',
      );
  dynamic carpoolingUser2Uid(dynamic response) => getJsonField(
        response,
        r'''$.Carpooling_User_2_Uid''',
      );
  dynamic carpoolingUser3Uid(dynamic response) => getJsonField(
        response,
        r'''$.Carpooling_User_3_Uid''',
      );
}

class DeliveryCall {
  Future<ApiCallResponse> call({
    String? userUid = '',
    String? rideType = 'DELIVERY',
    bool? fragile = false,
    String? date = '',
    String? rideTime = '',
    double? pickupLocationLat = 0.00000,
    double? pickupLocationLong,
    double? dropLocationLat,
    double? dropLocationLong,
    int? km,
    int? fare,
    String? cancelRide = '',
    String? status = '',
  }) {
    final body = '''
{
  "User_Uid": "${userUid}",
  "Ride_Type": "${rideType}",
  "Fragile": "${fragile}",
  "Date": "${date}",
  "Ride_Time": "${rideTime}",
  "pickup_location_lat": ${pickupLocationLat},
  "pickup_location_long": ${pickupLocationLong},
  "drop_location_lat": ${dropLocationLat},
  "drop_location_long": ${dropLocationLong},
  "Km": ${km},
  "Fare": ${fare},
  "Cancel_Ride": "${cancelRide}",
  "status": "${status}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Delivery',
      apiUrl: '${DjangoServerGroup.baseUrl}/delivery',
      callType: ApiCallType.POST,
      headers: {
        ...DjangoServerGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UserMessageCall {
  Future<ApiCallResponse> call({
    String? message = '',
    String? time = '',
    int? ride,
  }) {
    final body = '''
{
  "message": "${message}",
  "Time": "${time}",
  "ride": ${ride}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UserMessage',
      apiUrl: '${DjangoServerGroup.baseUrl}/User-Message',
      callType: ApiCallType.POST,
      headers: {
        ...DjangoServerGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  dynamic time(dynamic response) => getJsonField(
        response,
        r'''$.Time''',
      );
  dynamic ride(dynamic response) => getJsonField(
        response,
        r'''$.ride''',
      );
}

class DriverMessageCall {
  Future<ApiCallResponse> call({
    String? message = '',
    String? time = '',
    int? ride,
  }) {
    final body = '''
{
  "message": "${message}",
  "Time": "${time}",
  "ride": ${ride}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Driver Message',
      apiUrl: '${DjangoServerGroup.baseUrl}/Driver-Message',
      callType: ApiCallType.POST,
      headers: {
        ...DjangoServerGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  dynamic time(dynamic response) => getJsonField(
        response,
        r'''$.Time''',
      );
  dynamic ride(dynamic response) => getJsonField(
        response,
        r'''$.ride''',
      );
}

class PickupLocationCall {
  Future<ApiCallResponse> call({
    int? id,
    String? pickupLAT = '',
    String? pickupLong = '',
    String? dropLAT = '',
    String? dropLong = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'PickupLocation',
      apiUrl:
          '${DjangoServerGroup.baseUrl}/Location/${id}/${pickupLAT}/${pickupLong}/${dropLAT}/${dropLong}',
      callType: ApiCallType.GET,
      headers: {
        ...DjangoServerGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateFareCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? ride = '',
    String? km = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Update Fare',
      apiUrl: '${DjangoServerGroup.baseUrl}/Update_Fare/${id}/${ride}/${km}/',
      callType: ApiCallType.PATCH,
      headers: {
        ...DjangoServerGroup.headers,
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class MiniFareCall {
  Future<ApiCallResponse> call({
    int? km,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Mini Fare',
      apiUrl: '${DjangoServerGroup.baseUrl}/Mini_Fare/${km}',
      callType: ApiCallType.GET,
      headers: {
        ...DjangoServerGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class LuxuryFareCall {
  Future<ApiCallResponse> call({
    int? km,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Luxury Fare',
      apiUrl: '${DjangoServerGroup.baseUrl}/Luxury_Fare/${km}',
      callType: ApiCallType.GET,
      headers: {
        ...DjangoServerGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AcFareCall {
  Future<ApiCallResponse> call({
    int? km,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Ac Fare ',
      apiUrl: '${DjangoServerGroup.baseUrl}/Ac_Fare/${km}',
      callType: ApiCallType.GET,
      headers: {
        ...DjangoServerGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class BikeRideCall {
  Future<ApiCallResponse> call({
    int? km,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Bike Ride',
      apiUrl: '${DjangoServerGroup.baseUrl}/Bike_Fare/${km}',
      callType: ApiCallType.GET,
      headers: {
        ...DjangoServerGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CustomerListsCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Customer Lists',
      apiUrl: '${DjangoServerGroup.baseUrl}/customer-list',
      callType: ApiCallType.GET,
      headers: {
        ...DjangoServerGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
        true,
      );
  dynamic userUID(dynamic response) => getJsonField(
        response,
        r'''$[:].User_Uid''',
        true,
      );
  dynamic rideType(dynamic response) => getJsonField(
        response,
        r'''$[:].Ride_Type''',
        true,
      );
  dynamic date(dynamic response) => getJsonField(
        response,
        r'''$[:].Date''',
        true,
      );
  dynamic rideTime(dynamic response) => getJsonField(
        response,
        r'''$[:].Ride_Time''',
        true,
      );
  dynamic pickupLocationLat(dynamic response) => getJsonField(
        response,
        r'''$[:].pickup_location_lat''',
        true,
      );
  dynamic pickupLocationLong(dynamic response) => getJsonField(
        response,
        r'''$[:].pickup_location_long''',
        true,
      );
  dynamic dropLocationLat(dynamic response) => getJsonField(
        response,
        r'''$[:].drop_location_lat''',
        true,
      );
  dynamic dropLocationLong(dynamic response) => getJsonField(
        response,
        r'''$[:].drop_location_long''',
        true,
      );
  dynamic km(dynamic response) => getJsonField(
        response,
        r'''$[:].Km''',
        true,
      );
  dynamic fare(dynamic response) => getJsonField(
        response,
        r'''$[:].Fare''',
        true,
      );
  dynamic userRatings(dynamic response) => getJsonField(
        response,
        r'''$[:].User_ratings''',
        true,
      );
  dynamic driverRatings(dynamic response) => getJsonField(
        response,
        r'''$[:].Driver_ratings''',
        true,
      );
  dynamic cancelRide(dynamic response) => getJsonField(
        response,
        r'''$[:].Cancel_Ride''',
        true,
      );
  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$[:].status''',
        true,
      );
  dynamic driverDetails(dynamic response) => getJsonField(
        response,
        r'''$[:].Driver_Detail''',
        true,
      );
  dynamic allRides(dynamic response) => getJsonField(
        response,
        r'''$[:]''',
        true,
      );
  dynamic dropAddress(dynamic response) => getJsonField(
        response,
        r'''$[:].Drop_Address''',
        true,
      );
}

class AcceptDriverCall {
  Future<ApiCallResponse> call({
    int? id,
    String? driverUid = '',
  }) {
    final body = '''
{
  "Driver_Uid": "${driverUid}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Accept Driver ',
      apiUrl: '${DjangoServerGroup.baseUrl}/Add-Driver/${id}',
      callType: ApiCallType.PATCH,
      headers: {
        ...DjangoServerGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class SavedDestinationCall {
  Future<ApiCallResponse> call({
    String? user = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Saved Destination',
      apiUrl: '${DjangoServerGroup.baseUrl}/saved-destination/${user}',
      callType: ApiCallType.GET,
      headers: {
        ...DjangoServerGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AddSavedDestinationCall {
  Future<ApiCallResponse> call({
    String? user = '',
    String? name = '',
    double? lat,
    double? long,
    String? address = '',
  }) {
    final body = '''
{
  "user":"${user}",
  "name":"${name}",
  "lat":${lat} ,
  "long":${long} ,
  "address": "${address}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Saved Destination',
      apiUrl: '${DjangoServerGroup.baseUrl}/add-saved-destination/',
      callType: ApiCallType.POST,
      headers: {
        ...DjangoServerGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DriverStatsCall {
  Future<ApiCallResponse> call({
    String? uid = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Driver Stats',
      apiUrl: '${DjangoServerGroup.baseUrl}/driver-stats/${uid}',
      callType: ApiCallType.GET,
      headers: {
        ...DjangoServerGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DriverStatsPostCall {
  Future<ApiCallResponse> call({
    String? uid = '',
    String? date = '',
    int? earnings,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Driver Stats Post',
      apiUrl:
          '${DjangoServerGroup.baseUrl}/driver-earning/${uid}/${date}/${earnings}',
      callType: ApiCallType.POST,
      headers: {
        ...DjangoServerGroup.headers,
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  dynamic date(dynamic response) => getJsonField(
        response,
        r'''$.date''',
      );
  dynamic earnings(dynamic response) => getJsonField(
        response,
        r'''$.earnings''',
      );
  dynamic driver(dynamic response) => getJsonField(
        response,
        r'''$.driver''',
      );
}

class DriverImageCall {
  Future<ApiCallResponse> call({
    String? uId = '',
    String? driverImage = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Driver Image',
      apiUrl: '${DjangoServerGroup.baseUrl}/driver-image',
      callType: ApiCallType.GET,
      headers: {
        ...DjangoServerGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Django Server Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
