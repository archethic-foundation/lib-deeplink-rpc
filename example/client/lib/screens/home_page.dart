import 'dart:convert';

import 'package:deeplink_rpc_client_example/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:json_rpc_2/json_rpc_2.dart';
import 'package:logging/logging.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _SendRequestButton(),
      appBar: AppBar(
        title: const Text('Client example - Home page'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: TextButton(
              onPressed: () => context.go('/other_page'),
              child: const Text('Go to other page'),
            ),
          ),
        ),
      ),
    );
  }
}

class _SendRequestButton extends StatelessWidget {
  _SendRequestButton();

  final _logger = Logger('HomePage');

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.send),
      onPressed: () async {
        try {
          final response = await peer.sendRequest(
            'command_12',
            {
              'param1': 'value1',
              'param2': 'value2',
            },
          );

          _logger.info(
            'RPC request succeed : ${json.encode(response)}',
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(json.encode(response))),
          );
        } on RpcException catch (e) {
          _logger.severe(
            'RPC request failed : ${e.message}',
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.message)),
          );
        }
      },
    );
  }
}
