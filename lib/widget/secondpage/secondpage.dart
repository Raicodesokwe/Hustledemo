import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qrdemo/services/hustle_post_verify.dart';
import 'package:qrdemo/widget/secondpage/dialogpopup.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  //we create a qr code scanner with the qr code scanner package
  QRViewController? controller;
  Barcode? barcode;
  final qrKey = GlobalKey(debugLabel: 'QR');
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            'Scan ticket',
            style: Theme.of(context).textTheme.headline1,
          )),
          actions: [
            //this takes us back to the first page
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'close',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Colors.red),
                ))
          ],
        ),
        body: QRView(
          key: qrKey,
          onQRViewCreated: onQRViewCreated,
          overlay: QrScannerOverlayShape(
              borderColor: Theme.of(context).primaryColor,
              borderLength: 20,
              borderWidth: 10,
              cutOutSize: size.width * 0.5),
        ));
  }

  void onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);
    controller.scannedDataStream.listen((barcode) => setState(() {
          this.barcode = barcode;
          HustlePostVerify().verifyTickets(barcode.code);
          //we post our ticket code for verification and if successful,this updates our status to checked in
          secondPageRoute();
        }));
  }

  secondPageRoute() async {
    controller?.pauseCamera();
//we pass the code to the alertdialog
    await DialogService()
        .popupDialog(context, barcode!.code)
        .then((value) => controller!.resumeCamera());
  }
}
