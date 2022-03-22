extension MapExt on Map {
  Map<String, dynamic> get stripDocID {
    remove("documentId");
    return this as Map<String, dynamic>;
  }
}
