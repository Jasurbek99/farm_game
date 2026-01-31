import 'package:farm_game/core/constants/app_assets.dart';
import 'package:farm_game/features/friends/domain/models/friend.dart';

class FriendsLocalDatasource {
  List<Friend> getFriends() {
    return const [
      Friend(
        id: '1',
        name: 'DKESSIK SAJMIN',
        avatarAsset: AppAssets.avatarPlaceholder,
      ),
    ];
  }
}
