import 'package:chatgpt_app/Network/api_manager.dart';
import 'package:chatgpt_app/Network/chat_model.dart';
import 'package:flutter/material.dart';

class GPTTestScreen extends StatefulWidget {
  static const String routeName = 'test';
  @override
  _GPTTestScreenState createState() => _GPTTestScreenState();
}

class _GPTTestScreenState extends State<GPTTestScreen> {
  final TextEditingController _promptController = TextEditingController();
  String _response = "";

  Future<void> _getGPTResponse() async {
    final prompt = _promptController.text;
    try {
      final GPTResponce response = await ApiManager.getGPTResponse(prompt);
      setState(() {
        _response = response.choices?.first.text ?? "No response received";
      });
    } catch (e) {
      setState(() {
        _response = "Error: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GPT Response Test'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _promptController,
                decoration: const InputDecoration(labelText: 'Enter a prompt'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _getGPTResponse,
                child: const Text('Get GPT Response'),
              ),
              const SizedBox(height: 16),
              const Text('GPT Response:'),
              const SizedBox(height: 8),
              Container(
                width: 300,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: SingleChildScrollView(
                  child: Text(
                    _response,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
