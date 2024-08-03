import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _boool = false;
  bool get boool => _boool;
  set boool(bool value) {
    _boool = value;
  }

  String _allData = '';
  String get allData => _allData;
  set allData(String value) {
    _allData = value;
  }

  String _result = '';
  String get result => _result;
  set result(String value) {
    _result = value;
  }

  String _error1 = '';
  String get error1 => _error1;
  set error1(String value) {
    _error1 = value;
  }

  LatLng? _tapped;
  LatLng? get tapped => _tapped;
  set tapped(LatLng? value) {
    _tapped = value;
  }

  LatLng? _center;
  LatLng? get center => _center;
  set center(LatLng? value) {
    _center = value;
  }

  List<MarkersNumberStruct> _markers = [
    MarkersNumberStruct.fromSerializableMap(jsonDecode(
        '{\"value\":\"1000\",\"coordinates\":\"37.955654,23.698765\"}')),
    MarkersNumberStruct.fromSerializableMap(
        jsonDecode('{\"value\":\"829\",\"coordinates\":\"38.05,23.83333\"}'))
  ];
  List<MarkersNumberStruct> get markers => _markers;
  set markers(List<MarkersNumberStruct> value) {
    _markers = value;
  }

  void addToMarkers(MarkersNumberStruct value) {
    markers.add(value);
  }

  void removeFromMarkers(MarkersNumberStruct value) {
    markers.remove(value);
  }

  void removeAtIndexFromMarkers(int index) {
    markers.removeAt(index);
  }

  void updateMarkersAtIndex(
    int index,
    MarkersNumberStruct Function(MarkersNumberStruct) updateFn,
  ) {
    markers[index] = updateFn(_markers[index]);
  }

  void insertAtIndexInMarkers(int index, MarkersNumberStruct value) {
    markers.insert(index, value);
  }

  List<SongStruct> _songs = [
    SongStruct.fromSerializableMap(jsonDecode(
        '{\"artistname\":\"blupryyyy 2 title\",\"artUri\":\"https://res.cloudinary.com/dcato1y8g/image/upload/v1701558081/People_Circle23_s4sjmm.png\",\"title\":\"blupryyyy 2 title\",\"urlsong\":\"https://res.cloudinary.com/dl6aqq2yy/video/upload/v1694356080/epic_battle_music_1-6275_yx0d6i.mp3\"}')),
    SongStruct.fromSerializableMap(jsonDecode(
        '{\"artistname\":\"blupryyyy 2 title\",\"artUri\":\"https://res.cloudinary.com/dcato1y8g/image/upload/v1701558081/People_Circle23_s4sjmm.png\",\"title\":\"Hello\",\"urlsong\":\"https://res.cloudinary.com/dl6aqq2yy/video/upload/v1694356003/Powerful-Trap-_fu24m1.mp3\"}'))
  ];
  List<SongStruct> get songs => _songs;
  set songs(List<SongStruct> value) {
    _songs = value;
  }

  void addToSongs(SongStruct value) {
    songs.add(value);
  }

  void removeFromSongs(SongStruct value) {
    songs.remove(value);
  }

  void removeAtIndexFromSongs(int index) {
    songs.removeAt(index);
  }

  void updateSongsAtIndex(
    int index,
    SongStruct Function(SongStruct) updateFn,
  ) {
    songs[index] = updateFn(_songs[index]);
  }

  void insertAtIndexInSongs(int index, SongStruct value) {
    songs.insert(index, value);
  }

  String _error = '';
  String get error => _error;
  set error(String value) {
    _error = value;
  }

  int _stepss = 0;
  int get stepss => _stepss;
  set stepss(int value) {
    _stepss = value;
  }

  String _statuss = '';
  String get statuss => _statuss;
  set statuss(String value) {
    _statuss = value;
  }

  String _pedometerStatus = '';
  String get pedometerStatus => _pedometerStatus;
  set pedometerStatus(String value) {
    _pedometerStatus = value;
  }

  List<EmailStruct> _emailList = [
    EmailStruct.fromSerializableMap(jsonDecode(
        '{\"subject\":\"Hello World\",\"from\":\"Hello World\",\"deliveredTo\":\"Hello World\",\"body\":\"Hello World\"}'))
  ];
  List<EmailStruct> get emailList => _emailList;
  set emailList(List<EmailStruct> value) {
    _emailList = value;
  }

  void addToEmailList(EmailStruct value) {
    emailList.add(value);
  }

  void removeFromEmailList(EmailStruct value) {
    emailList.remove(value);
  }

  void removeAtIndexFromEmailList(int index) {
    emailList.removeAt(index);
  }

  void updateEmailListAtIndex(
    int index,
    EmailStruct Function(EmailStruct) updateFn,
  ) {
    emailList[index] = updateFn(_emailList[index]);
  }

  void insertAtIndexInEmailList(int index, EmailStruct value) {
    emailList.insert(index, value);
  }

  DateTime? _start = DateTime.fromMillisecondsSinceEpoch(1715098020000);
  DateTime? get start => _start;
  set start(DateTime? value) {
    _start = value;
  }

  DateTime? _end = DateTime.fromMillisecondsSinceEpoch(1717171620000);
  DateTime? get end => _end;
  set end(DateTime? value) {
    _end = value;
  }

  String _qrcodelink = '';
  String get qrcodelink => _qrcodelink;
  set qrcodelink(String value) {
    _qrcodelink = value;
  }
}
