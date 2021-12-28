import 'package:intl/intl.dart';

class NFTCollection {
  NFTCollection({
    required this.id,
    required this.name,
    required this.releaseDate,
    required this.moneyRaised,
    required this.charities,
  });

  final String id;
  final String name;
  final DateTime releaseDate;
  final int moneyRaised;
  final List<String> charities;

  String get formattedDate => DateFormat('MMM dd, yyyy').format(releaseDate);

  factory NFTCollection.fromMap(Map<String, dynamic> data, String id) {
    return NFTCollection(
      id: id,
      name: data['name'],
      releaseDate: DateTime.fromMillisecondsSinceEpoch(data['releaseDate']),
      moneyRaised: data['moneyRaised'],
      charities: data['charities'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'releaseDate': releaseDate.millisecondsSinceEpoch,
      'moneyRaised': moneyRaised,
      'charities': charities,
    };
  }
}