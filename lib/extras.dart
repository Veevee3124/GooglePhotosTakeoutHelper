rredia> media) {
  final copy = media.toList();
  var count = 0;
  for (final m in copy) {
    final name = p.withoutExtension(p.basename(m.firstFile.path)).toLowerCase();
    for (final extra in extraFormats) {
      // MacOS uses NFD that doesn't work with our accents 🙃🙃
      // https://github.com/TheLastGimbus/GooglePhotosTakeoutHelper/pull/247
      if (unorm.nfc(name).endsWith(extra)) {
        media.remove(m);
        count++;
        break;
      }
    }
  }
  return count;
}
