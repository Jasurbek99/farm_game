import 'package:farm_game/features/friends/data/datasources/friends_local_datasource.dart';
import 'package:farm_game/features/friends/domain/models/friend.dart';

class FriendsRepositoryImpl {
  final FriendsLocalDatasource _localDatasource;

  FriendsRepositoryImpl(this._localDatasource);

  List<Friend> getFriends() {
    return _localDatasource.getFriends();
  }

  List<Friend> getSuggestedFriends() {
    return _localDatasource.getSuggestedFriends();
  }
}
