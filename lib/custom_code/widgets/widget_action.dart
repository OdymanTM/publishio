// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:screenshot/screenshot.dart';
import '/components/homepagee_widget.dart';

class WidgetAction extends StatefulWidget {
  const WidgetAction({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _WidgetActionState createState() => _WidgetActionState();
}

class _WidgetActionState extends State<WidgetAction> {
  final screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Screenshot(
          controller: screenshotController,
          child: HomepageeWidget(),
        ),
        ElevatedButton(
          onPressed: () {
            screenshotController
                .capture(delay: Duration(milliseconds: 10))
                .then((capturedImage) async {
              final time = DateTime.now()
                  .toIso8601String()
                  .replaceAll('.', '-')
                  .replaceAll(':', '-');

              final name = 'sceenshot_$time';
              await ImageGallerySaver.saveImage(capturedImage!, name: name);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Screenshot saved to gallery."),
                  duration: Duration(seconds: 2),
                ),
              );
            });
          },
          child: Text("Screenshot button!"),
        ),
      ],
    );
  }
} //Made by Blupry.com
//Blupry.com No-code marketplace, custom template and support!
