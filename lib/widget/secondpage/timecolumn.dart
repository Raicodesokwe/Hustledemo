import 'package:flutter/material.dart';

class TimeColumn extends StatelessWidget {
  const TimeColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //column with time details in the alertdialog
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'Time',
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: Colors.black54, fontSize: 12),
        ),
        Text(
          '8.56AM',
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: Colors.black54, fontSize: 12),
        ),
      ],
    );
  }
}
