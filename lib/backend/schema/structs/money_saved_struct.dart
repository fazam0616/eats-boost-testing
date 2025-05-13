// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MoneySavedStruct extends FFFirebaseStruct {
  MoneySavedStruct({
    DocumentReference? eateryRef,
    double? moneySaved,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _eateryRef = eateryRef,
        _moneySaved = moneySaved,
        super(firestoreUtilData);

  // "eateryRef" field.
  DocumentReference? _eateryRef;
  DocumentReference? get eateryRef => _eateryRef;
  set eateryRef(DocumentReference? val) => _eateryRef = val;

  bool hasEateryRef() => _eateryRef != null;

  // "moneySaved" field.
  double? _moneySaved;
  double get moneySaved => _moneySaved ?? 0.0;
  set moneySaved(double? val) => _moneySaved = val;

  void incrementMoneySaved(double amount) => moneySaved = moneySaved + amount;

  bool hasMoneySaved() => _moneySaved != null;

  static MoneySavedStruct fromMap(Map<String, dynamic> data) =>
      MoneySavedStruct(
        eateryRef: data['eateryRef'] as DocumentReference?,
        moneySaved: castToType<double>(data['moneySaved']),
      );

  static MoneySavedStruct? maybeFromMap(dynamic data) => data is Map
      ? MoneySavedStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'eateryRef': _eateryRef,
        'moneySaved': _moneySaved,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'eateryRef': serializeParam(
          _eateryRef,
          ParamType.DocumentReference,
        ),
        'moneySaved': serializeParam(
          _moneySaved,
          ParamType.double,
        ),
      }.withoutNulls;

  static MoneySavedStruct fromSerializableMap(Map<String, dynamic> data) =>
      MoneySavedStruct(
        eateryRef: deserializeParam(
          data['eateryRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Eateries'],
        ),
        moneySaved: deserializeParam(
          data['moneySaved'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'MoneySavedStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MoneySavedStruct &&
        eateryRef == other.eateryRef &&
        moneySaved == other.moneySaved;
  }

  @override
  int get hashCode => const ListEquality().hash([eateryRef, moneySaved]);
}

MoneySavedStruct createMoneySavedStruct({
  DocumentReference? eateryRef,
  double? moneySaved,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MoneySavedStruct(
      eateryRef: eateryRef,
      moneySaved: moneySaved,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MoneySavedStruct? updateMoneySavedStruct(
  MoneySavedStruct? moneySavedStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    moneySavedStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMoneySavedStructData(
  Map<String, dynamic> firestoreData,
  MoneySavedStruct? moneySavedStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (moneySavedStruct == null) {
    return;
  }
  if (moneySavedStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && moneySavedStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final moneySavedStructData =
      getMoneySavedFirestoreData(moneySavedStruct, forFieldValue);
  final nestedData =
      moneySavedStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = moneySavedStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMoneySavedFirestoreData(
  MoneySavedStruct? moneySavedStruct, [
  bool forFieldValue = false,
]) {
  if (moneySavedStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(moneySavedStruct.toMap());

  // Add any Firestore field values
  moneySavedStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMoneySavedListFirestoreData(
  List<MoneySavedStruct>? moneySavedStructs,
) =>
    moneySavedStructs
        ?.map((e) => getMoneySavedFirestoreData(e, true))
        .toList() ??
    [];
