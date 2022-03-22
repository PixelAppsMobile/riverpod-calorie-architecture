import 'package:cloud_firestore/cloud_firestore.dart';

extension DocSnapshotExt on DocumentSnapshot {
  Map<String, dynamic> get dataWithDocID =>
      (data() as Map<String, dynamic>)..addAll({'documentID': id});
}
