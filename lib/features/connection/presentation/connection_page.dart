import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../results/presentation/providers/results_provider.dart';

class ConnectionPage extends StatefulWidget {
  const ConnectionPage({super.key});

  @override
  State<ConnectionPage> createState() => _ConnectionPageState();
}

class _ConnectionPageState extends State<ConnectionPage> {
  final TextEditingController _urlController = TextEditingController();
  bool _isConnected = false;

  @override
  Widget build(BuildContext context) {
    final resultsProvider =
        Provider.of<ResultsProvider>(context, listen: false);

    // Get the screen size for responsive layout
    final screenSize = MediaQuery.of(context).size;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal:
                screenSize.width * 0.05, // Responsive horizontal padding
            vertical: screenSize.height * 0.02, // Responsive vertical padding
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title Section
              Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: const Text(
                    "WebSocket Connection",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: constraints.maxHeight * 0.02),

              // WebSocket URL Input Field
              SizedBox(
                width: constraints.maxWidth * 0.7,
                child: TextField(
                  controller: _urlController,
                  decoration: InputDecoration(
                    labelText: "WebSocket URL",
                    border: OutlineInputBorder(),
                    hintText: "ws://example.com/socket",
                  ),
                ),
              ),
              SizedBox(height: constraints.maxHeight * 0.03),

              // Connect/Disconnect Button with status
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(
                          constraints.maxWidth * 0.25,
                          constraints.maxHeight * 0.06,
                        ),
                      ),
                      onPressed: () {
                        if (!_isConnected) {
                          _connectWebSocket(resultsProvider);
                        } else {
                          _disconnectWebSocket(resultsProvider);
                        }
                      },
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          _isConnected ? "Disconnect" : "Connect",
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Flexible(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          _isConnected ? "Connected" : "Disconnected",
                          style: TextStyle(
                            fontSize: 16,
                            color: _isConnected ? Colors.green : Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _connectWebSocket(ResultsProvider provider) {
    if (_urlController.text.isNotEmpty) {
      provider.startListening();
      setState(() {
        _isConnected = true;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Connected to ${_urlController.text}')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid WebSocket URL')),
      );
    }
  }

  void _disconnectWebSocket(ResultsProvider provider) {
    provider.dispose();
    setState(() {
      _isConnected = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Disconnected')),
    );
  }
}
