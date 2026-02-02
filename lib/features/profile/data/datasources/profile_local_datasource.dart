import 'package:farm_game/core/constants/app_assets.dart';
import 'package:farm_game/features/profile/domain/models/user_profile.dart';

class ProfileLocalDatasource {
  UserProfile getUserProfile() {
    return const UserProfile(
      id: '1',
      name: 'ASSING JOHNSON',
      userId: '3124654846',
      avatarAsset: AppAssets.avatarPlaceholder,
      balance: 236588.00,
    );
  }
}
