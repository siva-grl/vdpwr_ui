import '../../domain/entities/result.dart';

class ResultModel extends Result {
  ResultModel({
    required super.channelIndex,
    required super.startTime,
    required super.stopTime,
    required super.samples,
  });

  factory ResultModel.fromJson(Map<String, dynamic> json) {
    return ResultModel(
      channelIndex: json['channelIndex'] ?? 0,
      startTime: json['startTime'] ?? 0.0,
      stopTime: json['stopTime'] ?? 0.0,
      samples: json['samples'] ?? 0,
    );
  }
}
