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

  List<Friend> getSuggestedFriends() {
    return const [
      Friend(
        id: '101',
        name: 'DRESSIK SADJUN',
        avatarAsset: AppAssets.avatarPlaceholder,
      ),
      Friend(
        id: '102',
        name: 'DRESSIK SADJUN',
        avatarAsset: AppAssets.avatarPlaceholder,
      ),
      Friend(
        id: '103',
        name: 'DRESSIK SADJUN',
        avatarAsset: AppAssets.avatarPlaceholder,
      ),
      Friend(
        id: '104',
        name: 'DRESSIK SADJUN',
        avatarAsset: AppAssets.avatarPlaceholder,
      ),
      Friend(
        id: '105',
        name: 'DRESSIK SADJUN',
        avatarAsset: AppAssets.avatarPlaceholder,
      ),
      Friend(
        id: '106',
        name: 'DRESSIK SADJUN',
        avatarAsset: AppAssets.avatarPlaceholder,
      ),
    ];
  }
}
