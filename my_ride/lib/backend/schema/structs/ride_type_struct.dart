import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'ride_type_struct.g.dart';

abstract class RideTypeStruct
    implements Built<RideTypeStruct, RideTypeStructBuilder> {
  static Serializer<RideTypeStruct> get serializer =>
      _$rideTypeStructSerializer;

  String? get rideName;

  String? get rideImage;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(RideTypeStructBuilder builder) => builder
    ..rideName = ''
    ..rideImage = ''
    ..firestoreUtilData = FirestoreUtilData();

  RideTypeStruct._();
  factory RideTypeStruct([void Function(RideTypeStructBuilder) updates]) =
      _$RideTypeStruct;
}

RideTypeStruct createRideTypeStruct({
  String? rideName,
  String? rideImage,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RideTypeStruct(
      (r) => r
        ..rideName = rideName
        ..rideImage = rideImage
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

RideTypeStruct? updateRideTypeStruct(
  RideTypeStruct? rideType, {
  bool clearUnsetFields = true,
}) =>
    rideType != null
        ? (rideType.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addRideTypeStructData(
  Map<String, dynamic> firestoreData,
  RideTypeStruct? rideType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (rideType == null) {
    return;
  }
  if (rideType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && rideType.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final rideTypeData = getRideTypeFirestoreData(rideType, forFieldValue);
  final nestedData = rideTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = rideType.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getRideTypeFirestoreData(
  RideTypeStruct? rideType, [
  bool forFieldValue = false,
]) {
  if (rideType == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(RideTypeStruct.serializer, rideType);

  // Add any Firestore field values
  rideType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRideTypeListFirestoreData(
  List<RideTypeStruct>? rideTypes,
) =>
    rideTypes?.map((r) => getRideTypeFirestoreData(r, true)).toList() ?? [];
