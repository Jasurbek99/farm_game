import 'package:farm_game/features/store/data/datasources/store_local_datasource.dart';
import 'package:farm_game/features/store/domain/models/store_item.dart';

class StoreRepositoryImpl {
  final StoreLocalDatasource _localDatasource;

  StoreRepositoryImpl(this._localDatasource);

  List<StoreItem> getItems() {
    return _localDatasource.getItems();
  }
}
