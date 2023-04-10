class customerDetails {
  final firstName;
  final lastName;
  final city;
  final state;
  final PhoneNumber;

  customerDetails(
      {this.firstName, this.lastName, this.city, this.state, this.PhoneNumber});

  factory customerDetails.fromJson(Map<String, dynamic> json) {
    return customerDetails(
      firstName: json['firstName'],
      lastName: json['lastName'],
      city: json['city'],
      state: json['state'],
      PhoneNumber: ['PhoneNumber'],
    );
  }
  Map<String, dynamic> toJson() => {
        'PhoneNumber': PhoneNumber,
        'firstName': firstName,
        'lastName': lastName,
        'city': city,
        'state': state,
      };
}
