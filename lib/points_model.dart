class Users {
    String fullName;
    String email;
    int phoneNumber;
    String title;
    double lat;
    double lng;

    Users({
        required this.fullName,
        required this.email,
        required this.phoneNumber,
        required this.title,
        required this.lat,
        required this.lng,
    });

    factory Users.fromJson(Map<String, dynamic> json) => Users(
        fullName: json["full_name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        title: json["title"],
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "email": email,
        "phone_number": phoneNumber,
        "title": title,
        "lat": lat,
        "lng": lng,
    };
}
