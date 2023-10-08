class ThumbnailStoragePayload {
  final String thumbnailFileUID;
  final String thumbStorageID;
  final String originalFileStorageID;
  final String thumbnailURLRef;
  final String originalFileURLRef;
  ThumbnailStoragePayload({
    required this.thumbnailFileUID,
    required this.thumbStorageID,
    required this.originalFileStorageID,
    required this.thumbnailURLRef,
    required this.originalFileURLRef,
  });
}
