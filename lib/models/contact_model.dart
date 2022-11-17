class ContactModel {
  String header_1;
  String header_2;
  String addressHeader;
  String address;
  String contactHeader;
  String contact;
  String imageMap;

  ContactModel.fromJson(Map<String, dynamic> json)
      : header_1 = json['header_1'] ?? '',
        header_2 = json['header_2'] ?? '',
        addressHeader = json['addressHeader'] ?? '',
        address = json['address'] ?? '',
        contactHeader = json['contactHeader'] ?? '',
        contact = json['contact'] ?? '',
        imageMap = json['imageMap'] ?? '';
}
