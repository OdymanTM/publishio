// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class MarkersNumberStruct extends FFFirebaseStruct {
  MarkersNumberStruct({
    String? value,
    LatLng? coordinates,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _value = value,
        _coordinates = coordinates,
        super(firestoreUtilData);

  // "value" field.
  String? _value;
  String get value => _value ?? '';
  set value(String? val) => _value = val;

  bool hasValue() => _value != null;

  // "coordinates" field.
  LatLng? _coordinates;
  LatLng? get coordinates => _coordinates;
  set coordinates(LatLng? val) => _coordinates = val;

  bool hasCoordinates() => _coordinates != null;

  static MarkersNumberStruct fromMap(Map<String, dynamic> data) =>
      MarkersNumberStruct(
        value: data['value'] as String?,
        coordinates: data['coordinates'] as LatLng?,
      );

  static MarkersNumberStruct? maybeFromMap(dynamic data) => data is Map
      ? MarkersNumberStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'value': _value,
        'coordinates': _coordinates,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'value': serializeParam(
          _value,
          ParamType.String,
        ),
        'coordinates': serializeParam(
          _coordinates,
          ParamType.LatLng,
        ),
      }.withoutNulls;

  static MarkersNumberStruct fromSerializableMap(Map<String, dynamic> data) =>
      MarkersNumberStruct(
        value: deserializeParam(
          data['value'],
          ParamType.String,
          false,
        ),
        coordinates: deserializeParam(
          data['coordinates'],
          ParamType.LatLng,
          false,
        ),
      );

  @override
  String toString() => 'MarkersNumberStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MarkersNumberStruct &&
        value == other.value &&
        coordinates == other.coordinates;
  }

  @override
  int get hashCode => const ListEquality().hash([value, coordinates]);
}

MarkersNumberStruct createMarkersNumberStruct({
  String? value,
  LatLng? coordinates,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MarkersNumberStruct(
      value: value,
      coordinates: coordinates,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MarkersNumberStruct? updateMarkersNumberStruct(
  MarkersNumberStruct? markersNumber, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    markersNumber
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMarkersNumberStructData(
  Map<String, dynamic> firestoreData,
  MarkersNumberStruct? markersNumber,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (markersNumber == null) {
    return;
  }
  if (markersNumber.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && markersNumber.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final markersNumberData =
      getMarkersNumberFirestoreData(markersNumber, forFieldValue);
  final nestedData =
      markersNumberData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = markersNumber.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMarkersNumberFirestoreData(
  MarkersNumberStruct? markersNumber, [
  bool forFieldValue = false,
]) {
  if (markersNumber == null) {
    return {};
  }
  final firestoreData = mapToFirestore(markersNumber.toMap());

  // Add any Firestore field values
  markersNumber.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMarkersNumberListFirestoreData(
  List<MarkersNumberStruct>? markersNumbers,
) =>
    markersNumbers
        ?.map((e) => getMarkersNumberFirestoreData(e, true))
        .toList() ??
    [];
