import "../entities/result.dart";
import "../repositories/result_repository.dart";
import "../../../../core/usecase.dart";

class ListenResults implements UseCase<Result, NoParams> {
  final ResultRepository repository;

  ListenResults(this.repository);

  @override
  Stream<Result> call(NoParams params) {
    return repository.getResults();
  }
}

class NoParams {}
