// ignore_for_file: non_constant_identifier_names, file_names

class RoomDetails {
  final room_number;
  final room_type;
  final room_price;
  final number_of_beds;
  final hotelID;
  final roomImage;

  RoomDetails({
    required this.room_number,
    required this.room_type,
    required this.room_price,
    required this.number_of_beds,
    required this.hotelID,
    required this.roomImage,
  });

  factory RoomDetails.fromJson(Map<String, dynamic> json) {
    return RoomDetails(
      room_number: json['room_number'],
      room_type: json['room_type'],
      room_price: json['room_price'],
      number_of_beds: json['number_of_beds'],
      hotelID: json['hotelID'],
      roomImage: json['roomImage'],
    );
  }

  Map<String, dynamic> toJson() => {
        'room_number': room_number,
        'room_type': room_type,
        'room_price': room_price,
        'number_of_beds': number_of_beds,
        'hotelID': hotelID,
        'roomImage': roomImage,
      };
}
