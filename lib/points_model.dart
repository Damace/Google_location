class Users {
    String fullName;
    String address;
    int phoneNumber;
    String title;
    double lat;
    double lng;
    String doc;

    Users({
        required this.fullName,
        required this.address,
        required this.phoneNumber,
        required this.title,
        required this.lat,
        required this.lng,
        required this.doc,
    });

    factory Users.fromJson(Map<String, dynamic> json) => Users(
        fullName: json["full_name"],
        address: json["address"],
        phoneNumber: json["phone_number"],
        title: json["title"],
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
        doc: json["doc"],
    );

    Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "address": address,
        "phone_number": phoneNumber,
        "title": title,
        "lat": lat,
        "lng": lng,
        "doc": doc,
    };
}
