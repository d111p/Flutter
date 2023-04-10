class customerid {
  final id;
  final firstName;
  final lastName;
  final city;
  final state;
  final PhoneNumber;

  customerid(
      {required this.id,
      this.firstName,
      this.lastName,
      this.city,
      this.state,
      this.PhoneNumber});

  factory customerid.fromJson(Map<dynamic, dynamic> json) {
    return customerid(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      city: json['city'],
      state: json['state'],
      PhoneNumber: ['PhoneNumber'],
    );
  }
}
