import 'package:url_launcher/url_launcher.dart' as url_launcher;

class UrlLauncher {
  const UrlLauncher();

  /// Passes [url] to the underlying platform for handling.
  Future<bool> launchUrl(
    Uri url,
  ) =>
      url_launcher.launchUrl(
        url,
        mode: url_launcher.LaunchMode.externalApplication,
      );

  /// Checks whether the specified URL can be handled by some app installed on the
  /// device.
  Future<bool> canLaunchUrl(Uri url) => url_launcher.canLaunchUrl(url);
}
