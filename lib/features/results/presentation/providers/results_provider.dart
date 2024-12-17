import 'package:flutter/material.dart';
import '../../domain/entities/result.dart';
import '../../domain/usecases/listen_results.dart';

class ResultsProvider with ChangeNotifier {
  final ListenResults listenResults;
  final List<Result> _results = [];

  List<Result> get results => _results;

  ResultsProvider(this.listenResults);

  void startListening() {
    listenResults(NoParams()).listen((result) {
      _results.add(result);
      notifyListeners();
    });
  }
}
