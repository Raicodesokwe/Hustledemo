import 'package:qrdemo/model/tickets.dart';

//we use a lowercase underscore naming convention for class models in dart
//we define the model for the Api that we shall consume here for the model view viewmodel(MVVM) architecture
//the use of mvvm architecture makes code readability better and also makes testing easier
class HustleApiModel {
  List<Tickets>? tickets;

  HustleApiModel({this.tickets});
//we map the list of tickets
  factory HustleApiModel.fromJson(Map<String, dynamic> json) {
    List list = json['tickets'];
    List<Tickets> ticketsList =
        list.map((tara) => Tickets.fromJson(tara)).toList();
    return HustleApiModel(tickets: ticketsList);
  }
}
