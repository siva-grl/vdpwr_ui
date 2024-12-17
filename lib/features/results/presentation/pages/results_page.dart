import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/results_provider.dart';
import '../widgets/results_table.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ResultsProvider>(context);

    return Column(
      children: [
        const SizedBox(height: 16),
        ResultsTable(results: provider.results),
      ],
    );
  }
}
