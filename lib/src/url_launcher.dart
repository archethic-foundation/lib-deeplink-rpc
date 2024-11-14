import 'package:url_launcher/url_launcher.dart' as urlLauncher;

class UrlLauncher {
  const UrlLauncher();

  /// Passes [url] to the underlying platform for handling.
  Future<bool> launchUrl(
    Uri url,
  ) =>
      urlLauncher.launchUrl(
        url,
        mode: urlLauncher.LaunchMode.externalApplication,
      );

  /// Checks whether the specified URL can be handled by some app installed on the
  /// device.
  Future<bool> canLaunchUrl(Uri url) => urlLauncher.canLaunchUrl(url);
}
