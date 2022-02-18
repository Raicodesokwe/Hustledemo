//we define the ticket model here
//this is the model part of our MVVM architecture
class Tickets {
  String? code;
  String? name;
  String? phone;

  String? qr;
  String? event;
  int? checkinStatus;
  String? checkinTime;

  Tickets(
      {this.code,
      this.name,
      this.phone,
      this.qr,
      this.event,
      this.checkinStatus,
      this.checkinTime});

  Tickets.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    phone = json['phone'];

    qr = json['qr'];
    event = json['event'];
    checkinStatus = json['checkin_status'];
    checkinTime = json['checkin_time'];
  }
}
