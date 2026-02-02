import 'package:farm_game/features/profile/data/datasources/profile_local_datasource.dart';
import 'package:farm_game/features/profile/domain/models/user_profile.dart';

class ProfileRepositoryImpl {
  final ProfileLocalDatasource _localDatasource;

  ProfileRepositoryImpl(this._localDatasource);

  UserProfile getUserProfile() {
    return _localDatasource.getUserProfile();
  }
}
