import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //this is the title text in the first page
    return Text('Love & harmony Fest 2022',
        style: Theme.of(context).textTheme.headline1);
        //we access the style we defined globally down the widget tree through Theme.of context
  }
}
