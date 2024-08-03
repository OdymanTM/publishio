// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class EmailStruct extends FFFirebaseStruct {
  EmailStruct({
    String? subject,
    String? from,
    String? deliveredTo,
    String? body,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _subject = subject,
        _from = from,
        _deliveredTo = deliveredTo,
        _body = body,
        super(firestoreUtilData);

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  set subject(String? val) => _subject = val;

  bool hasSubject() => _subject != null;

  // "from" field.
  String? _from;
  String get from => _from ?? '';
  set from(String? val) => _from = val;

  bool hasFrom() => _from != null;

  // "deliveredTo" field.
  String? _deliveredTo;
  String get deliveredTo => _deliveredTo ?? '';
  set deliveredTo(String? val) => _deliveredTo = val;

  bool hasDeliveredTo() => _deliveredTo != null;

  // "body" field.
  String? _body;
  String get body => _body ?? '';
  set body(String? val) => _body = val;

  bool hasBody() => _body != null;

  static EmailStruct fromMap(Map<String, dynamic> data) => EmailStruct(
        subject: data['subject'] as String?,
        from: data['from'] as String?,
        deliveredTo: data['deliveredTo'] as String?,
        body: data['body'] as String?,
      );

  static EmailStruct? maybeFromMap(dynamic data) =>
      data is Map ? EmailStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'subject': _subject,
        'from': _from,
        'deliveredTo': _deliveredTo,
        'body': _body,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'subject': serializeParam(
          _subject,
          ParamType.String,
        ),
        'from': serializeParam(
          _from,
          ParamType.String,
        ),
        'deliveredTo': serializeParam(
          _deliveredTo,
          ParamType.String,
        ),
        'body': serializeParam(
          _body,
          ParamType.String,
        ),
      }.withoutNulls;

  static EmailStruct fromSerializableMap(Map<String, dynamic> data) =>
      EmailStruct(
        subject: deserializeParam(
          data['subject'],
          ParamType.String,
          false,
        ),
        from: deserializeParam(
          data['from'],
          ParamType.String,
          false,
        ),
        deliveredTo: deserializeParam(
          data['deliveredTo'],
          ParamType.String,
          false,
        ),
        body: deserializeParam(
          data['body'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'EmailStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EmailStruct &&
        subject == other.subject &&
        from == other.from &&
        deliveredTo == other.deliveredTo &&
        body == other.body;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([subject, from, deliveredTo, body]);
}

EmailStruct createEmailStruct({
  String? subject,
  String? from,
  String? deliveredTo,
  String? body,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EmailStruct(
      subject: subject,
      from: from,
      deliveredTo: deliveredTo,
      body: body,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EmailStruct? updateEmailStruct(
  EmailStruct? email, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    email
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEmailStructData(
  Map<String, dynamic> firestoreData,
  EmailStruct? email,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (email == null) {
    return;
  }
  if (email.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && email.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final emailData = getEmailFirestoreData(email, forFieldValue);
  final nestedData = emailData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = email.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEmailFirestoreData(
  EmailStruct? email, [
  bool forFieldValue = false,
]) {
  if (email == null) {
    return {};
  }
  final firestoreData = mapToFirestore(email.toMap());

  // Add any Firestore field values
  email.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEmailListFirestoreData(
  List<EmailStruct>? emails,
) =>
    emails?.map((e) => getEmailFirestoreData(e, true)).toList() ?? [];
