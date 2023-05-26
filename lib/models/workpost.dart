import 'package:equatable/equatable.dart';

class Workpost extends Equatable {
  final String id, name, description, address, openTimeUTC, closeTimeUTC;
  final double price, rating;
  final int seatsLeft;
  final List<String> reviews;

  const Workpost(
      {required this.id,
      required this.name,
      required this.address,
      required this.openTimeUTC,
      required this.closeTimeUTC,
      required this.price,
      required this.rating,
      required this.seatsLeft,
      required this.description,
      required this.reviews});

  factory Workpost.fromJson(Map<String, dynamic> json) {
    return Workpost(
        id: json['id'],
        name: json['url'],
        address: json['address'],
        openTimeUTC: json['openTimeUTC'],
        closeTimeUTC: json['closeTimeUTC'],
        price: json['price'],
        rating: json['rating'],
        seatsLeft: json['seatsLeft'],
        description: json['description'],
        reviews: json['reviews']);
  }

  @override
  List<Object?> get props => [
        id,
        name,
        address,
        openTimeUTC,
        closeTimeUTC,
        price,
        rating,
        seatsLeft,
        description,
        reviews
      ];
}
