// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SongStruct extends FFFirebaseStruct {
  SongStruct({
    String? artistname,
    String? artUri,
    String? title,
    String? urlsong,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _artistname = artistname,
        _artUri = artUri,
        _title = title,
        _urlsong = urlsong,
        super(firestoreUtilData);

  // "artistname" field.
  String? _artistname;
  String get artistname => _artistname ?? '';
  set artistname(String? val) => _artistname = val;

  bool hasArtistname() => _artistname != null;

  // "artUri" field.
  String? _artUri;
  String get artUri => _artUri ?? '';
  set artUri(String? val) => _artUri = val;

  bool hasArtUri() => _artUri != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "urlsong" field.
  String? _urlsong;
  String get urlsong => _urlsong ?? '';
  set urlsong(String? val) => _urlsong = val;

  bool hasUrlsong() => _urlsong != null;

  static SongStruct fromMap(Map<String, dynamic> data) => SongStruct(
        artistname: data['artistname'] as String?,
        artUri: data['artUri'] as String?,
        title: data['title'] as String?,
        urlsong: data['urlsong'] as String?,
      );

  static SongStruct? maybeFromMap(dynamic data) =>
      data is Map ? SongStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'artistname': _artistname,
        'artUri': _artUri,
        'title': _title,
        'urlsong': _urlsong,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'artistname': serializeParam(
          _artistname,
          ParamType.String,
        ),
        'artUri': serializeParam(
          _artUri,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'urlsong': serializeParam(
          _urlsong,
          ParamType.String,
        ),
      }.withoutNulls;

  static SongStruct fromSerializableMap(Map<String, dynamic> data) =>
      SongStruct(
        artistname: deserializeParam(
          data['artistname'],
          ParamType.String,
          false,
        ),
        artUri: deserializeParam(
          data['artUri'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        urlsong: deserializeParam(
          data['urlsong'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SongStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SongStruct &&
        artistname == other.artistname &&
        artUri == other.artUri &&
        title == other.title &&
        urlsong == other.urlsong;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([artistname, artUri, title, urlsong]);
}

SongStruct createSongStruct({
  String? artistname,
  String? artUri,
  String? title,
  String? urlsong,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SongStruct(
      artistname: artistname,
      artUri: artUri,
      title: title,
      urlsong: urlsong,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SongStruct? updateSongStruct(
  SongStruct? song, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    song
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSongStructData(
  Map<String, dynamic> firestoreData,
  SongStruct? song,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (song == null) {
    return;
  }
  if (song.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && song.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final songData = getSongFirestoreData(song, forFieldValue);
  final nestedData = songData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = song.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSongFirestoreData(
  SongStruct? song, [
  bool forFieldValue = false,
]) {
  if (song == null) {
    return {};
  }
  final firestoreData = mapToFirestore(song.toMap());

  // Add any Firestore field values
  song.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSongListFirestoreData(
  List<SongStruct>? songs,
) =>
    songs?.map((e) => getSongFirestoreData(e, true)).toList() ?? [];
