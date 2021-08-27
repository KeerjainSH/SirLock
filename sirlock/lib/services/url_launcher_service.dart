import 'package:url_launcher/url_launcher.dart';

Function launchUrl() => () {
      _launchURLBrowser();
    };

void _launchURLBrowser() async {
  const url = 'http://192.168.0.120:5000';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
