import 'package:flutter/material.dart';


class AppIcon extends StatelessWidget {
  const AppIcon({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //this is the leading appbar icon in the first page
    return const Icon(
          Icons.arrow_back,
          color: Colors.black,
        );
  }
}