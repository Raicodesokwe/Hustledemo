import 'package:flutter/material.dart';
import 'package:qrdemo/widget/firstpage/listtiles.dart';

import 'firstrow.dart';

class FirstPageBody extends StatelessWidget {
  const FirstPageBody({Key? key}) : super(key: key);
//this is the bdy of the first page
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //we use mediaquery to get the screen size that varies among different devices
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      //column allows us to pass various widgets in a vertical manner
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //aligns column children horizontally
        children: [
          //sizedbox adds a box with dimensions

          SizedBox(
            height: size.height * 0.05,
          ),
          FirstRow(size: size),
          //firstrow widget contains a row with texts
          SizedBox(
            height: size.height * 0.05,
          ),
          Text(
            '300 of 342 attendees checked in',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontWeight: FontWeight.w800, color: Colors.black),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Search e.g +254701425881',
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontWeight: FontWeight.w400, color: Colors.black45),
              //we use the null safe navigation operator !. to ensure we don't call a method/getter on a null object
              //we also obtain our global theme with theme.of(context) and use copywith to add our custom arguments
              suffixIcon: const Icon(
                Icons.search,
                color: Colors.black45,
              ),
              filled: true,
              fillColor: Colors.grey[300],
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(4.0),
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          const ListBlocks(),
           
          //this is where we build the list of tickets in a listview builder
        ],
      ),
    );
  }
}

