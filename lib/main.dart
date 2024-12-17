import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/results/data/datasources/websocket_service.dart';
import 'features/results/data/repositories/result_repository_impl.dart';
import 'features/results/domain/usecases/listen_results.dart';
import 'features/results/presentation/pages/results_page.dart';
import 'features/results/presentation/providers/results_provider.dart';
import 'features/connection/presentation/connection_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ResultsProvider(
            ListenResults(
              ResultRepositoryImpl(WebSocketService("ws://example.com/socket")),
            ),
          )..startListening(),
        ),
      ],
      child: MaterialApp(
        title: 'WebSocket Example',
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: Text('Connection & Results'),
              bottom: TabBar(tabs: [
                Tab(text: 'Connection Form'),
                Tab(text: 'Results'),
              ]),
            ),
            body: TabBarView(
              children: [
                ConnectionPage(),
                ResultsPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
