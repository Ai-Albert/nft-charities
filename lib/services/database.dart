import 'package:nft_charities/models/milestone.dart';
import 'package:nft_charities/models/nft_collection.dart';
import 'api_path.dart';
import 'firestore_service.dart';

abstract class Database {
  Stream<List<Milestone>> milestonesStream();
  Stream<List<NFTCollection>> collectionsStream();
}

class FirestoreDatabase implements Database {
  final _service = FirestoreService.instance;

  @override
  Stream<List<Milestone>> milestonesStream() => _service.collectionStream(
    path: APIPath.milestones(),
    builder: (data, id) => Milestone.fromMap(data, id),
    sort: (a, b) => a.number.compareTo(b.number),
  );

  @override
  Stream<List<NFTCollection>> collectionsStream() => _service.collectionStream(
    path: APIPath.collections(),
    builder: (data, id) => NFTCollection.fromMap(data, id),
    sort: (a, b) => a.releaseDate.compareTo(b.releaseDate),
  );
}
