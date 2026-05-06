import 'dart:html' as html;

class FileDownloader {
  static void downloadAsset({
    required String assetPath,
    required String fileName,
  }) {
    final anchor = html.AnchorElement(
      href: 'assets/$assetPath',
    )
      ..setAttribute('download', fileName)
      ..click();
  }

  static void openAsset({
    required String assetPath,
  }) {
    html.window.open(
      'assets/$assetPath',
      '_blank',
    );
  }
}
