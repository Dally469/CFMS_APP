class DonationModel {
  int id;
  String donationId;
  String donationName;
  int amount;

  DonationModel(
    this.id,
    this.donationId,
    this.donationName,
    this.amount,
  );

  DonationModel.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'],
        donationId = json['donationId'],
        donationName = json['donationName'],
        amount = json['amount'];

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'donationId': donationId,
      'donationName': donationName,
      'amount': amount,
    };
  }
}
