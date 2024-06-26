// ignore_for_file: avoid_web_libraries_in_flutter, file_names

import 'dart:html';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class GMapsHtml extends StatefulWidget {
  final String url;
  const GMapsHtml({super.key, required this.url});

  @override
  State<GMapsHtml> createState() => _GMapsHtmlState();
}

class _GMapsHtmlState extends State<GMapsHtml> {
  late Widget iframeWidget;
  final IFrameElement iframeElement = IFrameElement();

  @override
  void initState() {
    super.initState();

    iframeElement.src = widget.url;
    iframeElement.style.border = 'none';

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      widget.url,
      (int viewId) => iframeElement,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return HtmlElementView(
          viewType: widget.url,
        );
      },
    );
  }
}
