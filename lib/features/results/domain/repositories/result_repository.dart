import '../entities/result.dart';

abstract class ResultRepository {
  Stream<Result> getResults();
}
