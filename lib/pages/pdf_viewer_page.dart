import 'package:flutter/material.dart';
import 'package:pdf_viewer_jk/pdf_viewer_jk.dart';

class PdfViewerPage extends StatelessWidget {
  const PdfViewerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<PDFDocument>(
          future: _incrementCounter(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              return PDFViewer(document: snapshot.data!);
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }

  Future<PDFDocument> _incrementCounter() async {
    return await PDFDocument.fromURL(
        'https://bucket-unicef-ecuador.s3.us-east-2.amazonaws.com/cores/1/expenses/receipts/kxEYUfjkLYDo6tRdh3KtJ7DpKcyHYvgoNTwqrTSf.pdf');
  }
}
