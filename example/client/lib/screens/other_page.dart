import 'dart:convert';

import 'package:deeplink_rpc_client_example/main.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _SendRequestButton(),
      appBar: AppBar(
        title: const Text('Client example - Other page'),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Center(
            child: Text('DeeplinkRPCClient example'),
          ),
        ),
      ),
    );
  }
}

class _SendRequestButton extends StatelessWidget {
  _SendRequestButton();

  final _logger = Logger('OtherPage');

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.send),
      onPressed: () async {
        final response = await peer.sendRequest(
          'command_2',
          {
            'command': 'command_2',
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
      },
    );
  }
}
