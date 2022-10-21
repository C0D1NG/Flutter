import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:nano_news/features/side_menu/pages/settings_webview_page_widget.dart';
import 'package:nano_news/network/reachability_manager.dart';
import 'package:nano_news/utility/app_theme.dart';
import 'package:nano_news/utility/error_banner_widget.dart';
import 'package:share/share.dart';

class SideMenuPageWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _reachabilityManagerProvider = ref.watch(reachabilityManagerProvider);
    final _isVisible =
        (_reachabilityManagerProvider == ReachabilityState.noInternet)
            ? true
            : false;
    final _deviceType = (Platform.isIOS == false) ? 'NanoNews' : 'NanoNewz';
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: AppTheme.primaryColor,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
              visible: _isVisible,
              child: ErrorBannerWidget(),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
              child: Text(
                'The data for our is strictly used from \'New York Times application programming interfaces (the "NYT APIs")\'. We do not show any information related to health or medicine here.',
                style: TextStyle(color: Colors.grey, fontSize: 14.0),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(
                  bottom: 10.0,
                  left: 10.0,
                  right: 10.0,
                ),
                children: [
                  Card(
                    child: ListTile(
                      title: Text('Attributions / (News Publisher)'),
                      trailing: Icon(Icons.arrow_right),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SettingsWebviewPage(
                              sourceURL:
                                  'https://developer.nytimes.com/branding',
                              title: 'Attributions',
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text('Terms of Use'),
                      trailing: Icon(Icons.arrow_right),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SettingsWebviewPage(
                              sourceURL: 'https://developer.nytimes.com/terms',
                              title: 'Terms of Use',
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text('Share this app'),
                      trailing: Icon(Icons.arrow_right),
                      onTap: () {
                        final _messsge =
                            'Check out $_deviceType app. I found it best for reading news. Replace with YOUR app store / playstore / smart url';
                        Share.share(_messsge);
                      },
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text('Rate this app'),
                      trailing: Icon(Icons.arrow_right),
                      onTap: () => _openAppRating(),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text('Feedback'),
                      trailing: Icon(Icons.arrow_right),
                      onTap: () {
                        //Open Mail here
                        _openEmail(deviceType: _deviceType);
                      },
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.width / 8,
                width: MediaQuery.of(context).size.width / 2,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SettingsWebviewPage(
                          sourceURL: 'https://developer.nytimes.com/',
                          title: 'The New York Times Developer Network',
                        ),
                      ),
                    );
                  },
                  child: Image.asset(
                    'assets/images/the-new-york-times-logo.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // example@gmail.com is sample email
  void _openEmail({String deviceType}) async {
    final _email = Email(
      body: 'Hey Team.',
      subject: 'Feedback for $deviceType app.',
      recipients: ['example@gmail.com'],
      isHTML: false,
    );

    await FlutterEmailSender.send(_email);
  }

// XX-yyy-sss is sample iOS app store app id
  void _openAppRating() {
    final _inAppReview = InAppReview.instance;
    _inAppReview.openStoreListing(appStoreId: 'XX-yyy-sss');
  }
}
