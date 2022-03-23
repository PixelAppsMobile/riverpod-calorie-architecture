extension MapExt on Map<String, dynamic> {
  Map<String, dynamic> get stripDocID {
    remove("documentId");
    return this as Map<String, dynamic>;
  }
}
