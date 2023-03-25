// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ride_type_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RideTypeStruct> _$rideTypeStructSerializer =
    new _$RideTypeStructSerializer();

class _$RideTypeStructSerializer
    implements StructuredSerializer<RideTypeStruct> {
  @override
  final Iterable<Type> types = const [RideTypeStruct, _$RideTypeStruct];
  @override
  final String wireName = 'RideTypeStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, RideTypeStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.rideName;
    if (value != null) {
      result
        ..add('rideName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.rideImage;
    if (value != null) {
      result
        ..add('rideImage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  RideTypeStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RideTypeStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'rideName':
          result.rideName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'rideImage':
          result.rideImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$RideTypeStruct extends RideTypeStruct {
  @override
  final String? rideName;
  @override
  final String? rideImage;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$RideTypeStruct([void Function(RideTypeStructBuilder)? updates]) =>
      (new RideTypeStructBuilder()..update(updates))._build();

  _$RideTypeStruct._(
      {this.rideName, this.rideImage, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'RideTypeStruct', 'firestoreUtilData');
  }

  @override
  RideTypeStruct rebuild(void Function(RideTypeStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RideTypeStructBuilder toBuilder() =>
      new RideTypeStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RideTypeStruct &&
        rideName == other.rideName &&
        rideImage == other.rideImage &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, rideName.hashCode), rideImage.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RideTypeStruct')
          ..add('rideName', rideName)
          ..add('rideImage', rideImage)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class RideTypeStructBuilder
    implements Builder<RideTypeStruct, RideTypeStructBuilder> {
  _$RideTypeStruct? _$v;

  String? _rideName;
  String? get rideName => _$this._rideName;
  set rideName(String? rideName) => _$this._rideName = rideName;

  String? _rideImage;
  String? get rideImage => _$this._rideImage;
  set rideImage(String? rideImage) => _$this._rideImage = rideImage;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  RideTypeStructBuilder() {
    RideTypeStruct._initializeBuilder(this);
  }

  RideTypeStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _rideName = $v.rideName;
      _rideImage = $v.rideImage;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RideTypeStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RideTypeStruct;
  }

  @override
  void update(void Function(RideTypeStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RideTypeStruct build() => _build();

  _$RideTypeStruct _build() {
    final _$result = _$v ??
        new _$RideTypeStruct._(
            rideName: rideName,
            rideImage: rideImage,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'RideTypeStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
