# {{ inputs.appName }}

> Scaffolded with [xo-flutter](https://github.com/betaversionio/xo-flutter)

## Stack

| Layer | Choice |
|---|---|
| Language | Dart / Flutter |
| State management | {{ inputs.stateManagement }} |
| Navigation | {{ inputs.navigation }} |
| Package | `{{ inputs.orgId }}.{{ inputs.projectName }}` |

## Features included

{{#if (includes inputs.features "theming")}}
- 🎨 Dark / Light theming
{{/if}}
{{#if (includes inputs.features "networking")}}
- 🌐 Networking — Dio + cache + interceptors
{{/if}}
{{#if (includes inputs.features "auth")}}
- 🔐 Auth screens — login & register
{{/if}}
{{#if (includes inputs.features "firebase")}}
- 🔥 Firebase — core + push messaging
{{/if}}
{{#if (includes inputs.features "storage")}}
- 🔒 Secure storage + SharedPrefs
{{/if}}
{{#if (includes inputs.features "flavors")}}
- 🏷️ Flavor support — dev / staging / prod
{{/if}}

## Getting started

```bash
# Install dependencies
flutter pub get

# Run the app
{{#if (includes inputs.features "flavors")}}
flutter run --flavor development --dart-define=FLAVOR=development --dart-define=ENVIRONMENT=development
{{else}}
flutter run
{{/if}}
```

{{#if (includes inputs.features "flavors")}}
## Flavors

| Flavor | Bundle ID | Command |
|---|---|---|
| Development | `{{ inputs.orgId }}.{{ inputs.projectName }}.dev` | `flutter run --flavor development --dart-define=FLAVOR=development` |
| Staging | `{{ inputs.orgId }}.{{ inputs.projectName }}.staging` | `flutter run --flavor staging --dart-define=FLAVOR=staging` |
| Production | `{{ inputs.orgId }}.{{ inputs.projectName }}` | `flutter run --flavor production --dart-define=FLAVOR=production` |

{{/if}}
## Project structure

```
lib/
├── main.dart                 # Entry point
├── app.dart                  # Root widget
├── utils/logger/             # App logger
{{#if (eq inputs.navigation "go_router")}}
├── routes/                   # GoRouter configuration
{{/if}}
{{#if (includes inputs.features "theming")}}
├── theme/                    # Light & dark themes
{{/if}}
{{#if (includes inputs.features "networking")}}
├── services/network/         # Dio client + interceptors
{{/if}}
{{#if (includes inputs.features "auth")}}
├── features/auth/            # Auth screens
{{/if}}
{{#if (includes inputs.features "firebase")}}
├── services/firebase/        # Firebase setup
{{/if}}
{{#if (includes inputs.features "storage")}}
├── services/storage/         # Secure storage
{{/if}}
{{#if (includes inputs.features "flavors")}}
├── config/                   # Flavor configuration
{{/if}}
└── core/initialization/      # App bootstrap
```
