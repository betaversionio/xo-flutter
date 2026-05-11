import 'package:{{ inputs.projectName }}/app.dart';
import 'package:{{ inputs.projectName }}/core/initialization/app_initializer.dart';
import 'package:flutter/material.dart';
{{#if (eq inputs.stateManagement "riverpod")}}
import 'package:flutter_riverpod/flutter_riverpod.dart';
{{/if}}
{{#if (eq inputs.stateManagement "bloc")}}
// Add BLoC observers here if needed
{{/if}}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitializer.initialize();
  runApp(
{{#if (eq inputs.stateManagement "riverpod")}}
    const ProviderScope(child: App()),
{{else}}
    const App(),
{{/if}}
  );
}
