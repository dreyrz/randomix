import 'package:url_launcher/url_launcher.dart';

abstract class IUrlLauncherService {
  Future<void> launchURL(String url);
}

class UrlLauncherService implements IUrlLauncherService {
  @override
  Future<void> launchURL(String url) async => await canLaunchUrl(Uri.parse(url))
      ? await launchUrl(Uri.parse(url))
      : throw 'Could not launch $url';
}
