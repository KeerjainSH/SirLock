import 'package:url_launcher/url_launcher.dart';

Function launchUrl() => () {
      _launchURLBrowser();
    };

_launchURLBrowser() async {
  const url = 'https://google.com/';
  if (await canLaunch(url)) {
    await launch(url, forceWebView: false);
  } else {
    throw 'Could not launch $url';
  }
}
