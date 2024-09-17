import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class MyChromeSafariBrowser extends ChromeSafariBrowser {
  @override
  void onOpened() {
    print("ChromeSafari browser opened");
  }

  @override
  void onCompletedInitialLoad(didLoadSuccessfully) {
    print("ChromeSafari browser initial load completed");
  }

  @override
  void onClosed() {
    print("ChromeSafari browser closed");
  }
}

class Browser2 extends StatefulWidget {
  const Browser2({super.key});

  @override
  State<Browser2> createState() => _Browser2State();
}

class _Browser2State extends State<Browser2> {
  final browser = MyChromeSafariBrowser();

  @override
  void initState() {
    browser.addMenuItem(ChromeSafariBrowserMenuItem(
        id: 1,
        label: 'Custom item menu 1',
        onClick: (url, title) {
          print('Custom item menu 1 clicked!');
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChromeSafariBrowser Example'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              await browser.open(
                  url: WebUri("https://flutter.dev/"),
                  settings: ChromeSafariBrowserSettings(
                      isTrustedWebActivity: true,
                      displayMode: TrustedWebActivityImmersiveDisplayMode(
                          isSticky: false),
                      shareState: CustomTabsShareState.SHARE_STATE_OFF,
                      barCollapsingEnabled: false));
            },
            child: const Text("Open Chrome Safari Browser")),
      ),
    );
  }
}
