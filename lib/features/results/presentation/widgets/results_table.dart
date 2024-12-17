import 'package:flutter/material.dart';
import '../../domain/entities/result.dart';

class ResultsTable extends StatelessWidget {
  final List<Result> results;

  const ResultsTable({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const [
        DataColumn(label: Text('Channel Index')),
        DataColumn(label: Text('Start Time')),
        DataColumn(label: Text('Stop Time')),
        DataColumn(label: Text('Samples')),
      ],
      rows: results.map((r) {
        return DataRow(cells: [
          DataCell(Text(r.channelIndex.toString())),
          DataCell(Text(r.startTime.toString())),
          DataCell(Text(r.stopTime.toString())),
          DataCell(Text(r.samples.toString())),
        ]);
      }).toList(),
    );
  }
}
