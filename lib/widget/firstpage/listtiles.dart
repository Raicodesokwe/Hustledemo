import 'package:flutter/material.dart';
import 'package:qrdemo/services/hustle_api_service.dart';

import 'package:qrdemo/widget/secondpage/secondpage.dart';

class ListBlocks extends StatefulWidget {
  const ListBlocks({Key? key}) : super(key: key);

  @override
  _ListBlocksState createState() => _ListBlocksState();
}

class _ListBlocksState extends State<ListBlocks> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
      //we pass this key to the refresh indicator 
  //it isn't recommended to put api calls in a build method since this shall make frequent api calls
  //Storing the fetchTickets() result in a state variable ensures that the Future is executed only once and then cached for subsequent rebuilds.
//since initstate is called only once in it's state lifecycle,it is perfect for this purpose
  Future? futureTiles;
//we build our list of tickets here

  @override
  void initState() {
    super.initState();
    futureTiles = HustleApiConsumption().fetchTickets();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
      //we use a future builder to get the list of tickets from our api
      future: futureTiles,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          //if the snapshot has an error,we display a text widget showing the same
          return Center(
            child: Text(
              ' Something went wrong.',
              style: Theme.of(context).textTheme.headline1,
            ),
          );
        } else if (!snapshot.hasData) {
          //if we are waiting for the snapshot to return a result,we use a circularprogressindicator
          return Center(
              child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
          ));
          //expanded Creates a widget that expands a child of a [Row], [Column], or [Flex] so that the child fills the available space along the flex widget's main axis.
        }
        return Expanded(
          //we use an expanded widget to enable us display the listview builder within our column
          child: RefreshIndicator(
            //this updates the data we receive from the api thus updating our checked in status
            color: Theme.of(context).primaryColor,
            key: _refreshIndicatorKey,
            onRefresh: () async {
              setState(() {
                futureTiles = HustleApiConsumption().fetchTickets();
              });
              await futureTiles;
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 70),
              child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    var ticketData = snapshot.data![index];
                    return Card(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey.withOpacity(0.4)),
                          borderRadius: BorderRadius.circular(5)),
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ticketData.checkinStatus == 1
                                      ? Theme.of(context).primaryColor
                                      : Colors.grey.withOpacity(0.4)),
                              //we check the status so as to conditionally display the colour of our container
                            ),
                            SizedBox(
                              width: size.width * 0.05,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(ticketData.name!),
                                // ticketData
                                //we display the name of our ticket holder here
                                Row(
                                  children: [
                                    Chip(
                                      label: Text(
                                        'Status',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                color: Colors.red, fontSize: 11),
                                      ),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4)),
                                      backgroundColor:
                                          Colors.redAccent.withOpacity(0.3),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.01,
                                    ),
                                    //we conditionally render whether a user has checked in or not
                                    ticketData.checkinStatus == 1
                                        ? Text(
                                            'Checked in',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(
                                                    fontSize: 11,
                                                    color: Colors.black),
                                          )
                                        : Text(
                                            'Not checked',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(
                                                    fontSize: 11,
                                                    color: Colors.black),
                                          ),
                                    SizedBox(
                                      width: size.width * 0.01,
                                    ),
                                    ticketData.checkinStatus == 1
                                        ? Image.asset("assets/images/tick.png")
                                        : Container()
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * 0.005,
                                ),
                                Text(ticketData.phone)
                              ],
                            ),
                            const Spacer(),
                            //we conditionally render time or a chip widget taking a user to the qr scanner based on whether the user has checked in or not
                            ticketData.checkinStatus == 1
                                ? const Text(
                                    '8.15 am',
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SecondPage()));
                                    },
                                    child: Chip(
                                      label: Row(
                                        children: [
                                          Text(
                                            'Check in',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(
                                                    color: Colors.white,
                                                    fontSize: 11),
                                          ),
                                          SizedBox(
                                            width: size.width * 0.02,
                                          ),
                                          Image.asset(
                                            'assets/images/shot.png',
                                            scale: 1.5,
                                          )
                                        ],
                                      ),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4)),
                                      backgroundColor:
                                          Theme.of(context).primaryColor,
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
        );
      },
    );
  }
}
