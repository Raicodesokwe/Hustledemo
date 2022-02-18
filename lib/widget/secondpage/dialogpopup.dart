import 'package:flutter/material.dart';
import 'package:qrdemo/widget/secondpage/timecolumn.dart';

import 'bottombutton.dart';

class DialogService {
  popupDialog(BuildContext context, String? e) {
    //we pop up an alert dialog within a show dialog upon verifying code successfully
    return showDialog(
        context: context,
        builder: (context) {
          Size size = MediaQuery.of(context).size;
          return AlertDialog(
            title: Center(
              child: Image.asset('assets/images/success.png'),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              //this ensures the column takes up the least amount of space possible
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'Success!"Margaret Hustle" has been checked in',
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 15),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ticket code',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Colors.black54, fontSize: 12),
                        ),
                        SizedBox(
                          width: size.width * 0.5,
                          child: Text(
                            
                            //we display the code here upon successful verification
                            e.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: Colors.black54,overflow: TextOverflow.fade,fontWeight: FontWeight.w800, fontSize: 10),
                          ),
                        ),
                      ],
                    ),
                    const TimeColumn()
                    //this is the widget containing the column with time details
                  ],
                )
              ],
            ),
            actions: [
              BottomButton(size: size)
              //the bottom button that takes us back to the scanner
            ],
          );
        });
  }
}

