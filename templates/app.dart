import 'package:flutter/material.dart';
{{#if (eq inputs.stateManagement "riverpod")}}
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
{{/if}}
{{#if (eq inputs.navigation "go_router")}}
import 'package:{{ inputs.projectName }}/routes/app_router.dart';
{{/if}}
{{#if (includes inputs.features "theming")}}
import 'package:{{ inputs.projectName }}/theme/theme.dart';
{{/if}}

{{#if (eq inputs.stateManagement "riverpod")}}
class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
{{else}}
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
{{/if}}
    return MaterialApp{{#if (eq inputs.navigation "go_router")}}.router{{/if}}(
{{#if (eq inputs.navigation "go_router")}}
      routerConfig: router,
{{/if}}
      debugShowCheckedModeBanner: false,
      title: '{{ inputs.appName }}',
{{#if (includes inputs.features "theming")}}
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
{{else}}
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
{{/if}}
{{#unless (eq inputs.navigation "go_router")}}
      home: const Scaffold(
        body: Center(child: Text('{{ inputs.appName }}')),
      ),
{{/unless}}
    );
  }
}
