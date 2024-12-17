import '../../domain/entities/result.dart';
import '../../domain/repositories/result_repository.dart';
import '../datasources/websocket_service.dart';
import '../models/result_model.dart';

class ResultRepositoryImpl implements ResultRepository {
  final WebSocketService service;

  ResultRepositoryImpl(this.service);

  @override
  Stream<Result> getResults() {
    return service.getDataStream().map((data) => ResultModel.fromJson(data));
  }
}
