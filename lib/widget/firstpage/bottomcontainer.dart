import 'package:flutter/material.dart';
import 'package:qrdemo/widget/secondpage/secondpage.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //this is the bottom container in the firstpage
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      //sizedbox sizes our child widget and is a great alternative to container if we don't need to define background colour etcetera
      height: size.height * 0.07,
      width: size.width,
      //gesture detector enables us react to touch events
      child: Center(child: GestureDetector(onTap: (){
        //navigator push pushes a route onto a stack of routes thus enabling us go to the next page which in this case is the secondpage containing the qr scanner
            Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>const SecondPage()));
      },child: Image.asset('assets/images/baton.png'))),
    );
  }
}
