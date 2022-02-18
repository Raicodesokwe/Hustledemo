import 'package:flutter/material.dart';

import 'package:qrdemo/widget/firstpage/appbaricon.dart';
import 'package:qrdemo/widget/firstpage/appbartext.dart';
import 'package:qrdemo/widget/firstpage/bottomcontainer.dart';
import 'package:qrdemo/widget/firstpage/firstpagebody.dart';

class FirstPage extends StatelessWidget {
  //we use a stateless widget since state isn't updating within this widget
  const FirstPage({Key? key}) : super(key: key);
//this is the view part of our first page in our MVVM architecture
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //we define the Appbar widget
      appBar: AppBar(
        //We outsource logic to other widgets to keep our code clean and readable
        //You can hover over the widget to see in which file it is located
        leading: const AppIcon(),
        title: const AppText()
        //we pass an icon to the leading argument
        //we use fonts from the google fonts package to style our text
      ),
      //we pass padding as the root widget to our body and we pass a horizontal padding that shall apply to our whole body
      body:const FirstPageBody(),
      bottomSheet:const BottomContainer(),
      //our bottomsheet contains theqr code button that takes us to the qr scanner page
    );
  }
}

