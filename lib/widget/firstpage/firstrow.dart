import 'package:flutter/material.dart';
class FirstRow extends StatelessWidget {
  const FirstRow({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    //this is a row in the first page
    //rows fit their children horizontally
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //spaces out the children of the row to the furthest extent
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //aligns the children of a column from the beginning vertically
          children: [
            Text(
              'Total tickets',
              //we import the fontfamily within the pubspec yaml file
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(
              '500',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.w800, color: Colors.black),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Tickets sold',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(
              '342',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.w800, color: Colors.black),
            )
          ],
        ),
      ],
    );
  }
}
