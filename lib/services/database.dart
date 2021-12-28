import 'package:nft_charities/models/nft_collection.dart';
import 'api_path.dart';
import 'firestore_service.dart';

abstract class Database {
  Stream<List<NFTCollection>> pastCollectionsStream();
  Stream<List<NFTCollection>> futureCollectionsStream();
}

// For creating unique ids for new entries
String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

class FirestoreDatabase implements Database {
  final _service = FirestoreService.instance;

  @override
  Stream<List<NFTCollection>> pastCollectionsStream() => _service.collectionStream(
    path: APIPath.collections(),
    builder: (data, id) => NFTCollection.fromMap(data, id),
    filterSource: 'releaseDate',
    filter: 'past',
    sort: (a, b) => a.releaseDate.compareTo(b.releaseDate),
  );

  @override
  Stream<List<NFTCollection>> futureCollectionsStream() => _service.collectionStream(
    path: APIPath.collections(),
    builder: (data, id) => NFTCollection.fromMap(data, id),
    filterSource: 'releaseDate',
    filter: 'future',
    sort: (a, b) => a.releaseDate.compareTo(b.releaseDate),
  );
}
