import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class AndroidTWABrowser extends ChromeSafariBrowser {
  @override
  void onOpened() {
    print("Android TWA browser opened");
  }

  @override
  void onCompletedInitialLoad(didLoadSuccessfully) {
    print("Android TWA browser initial load completed");
  }

  @override
  void onClosed() {
    print("Android TWA browser closed");
  }
}

class Browser extends StatefulWidget {
  final ChromeSafariBrowser browser = AndroidTWABrowser();
  Browser({super.key});

  @override
  State<Browser> createState() => _BrowserState();
}

class _BrowserState extends State<Browser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Android TWA Example'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              await widget.browser.open(
                url: WebUri("https://flutter.dev/"),
                settings:
                    ChromeSafariBrowserSettings(isTrustedWebActivity: true),
              );
            },
            child: const Text("Open Android TWA Browser")),
      ),
    );
  }
}
