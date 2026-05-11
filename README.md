# xo-flutter

Flutter scaffolding generator for [xo](https://github.com/betaversionio/xocode). Replaces `flutter create` with a production-ready starting point — picks up where Flutter leaves off.

## Usage

```bash
# In a new empty directory
mkdir my_app && cd my_app
xo create @github/betaversionio/xo-flutter
```

The generator asks 5 questions then builds your project:

| Prompt | Options |
|---|---|
| App display name | Any string (e.g. `My App`) |
| Project name | snake_case (e.g. `my_app`) |
| Organization ID | Bundle prefix (e.g. `com.example`) |
| State management | Riverpod + Hooks · BLoC · None |
| Navigation | GoRouter · Flutter Navigator |
| Features | multiselect — pick any combination |

## Features

| Feature | What's included |
|---|---|
| 🎨 Theming | `lightTheme` + `darkTheme`, `AppColors`, `AppTypography` |
| 🌐 Networking | Dio client, cache interceptor, `ApiException` factory |
| 🔐 Auth screens | Login + register forms, wired to Riverpod |
| 🔥 Firebase | `FirebaseService.initialize()` with graceful failure |
| 🔒 Storage | `FlutterSecureStorage` + `SharedPreferences` helpers |
| 🏷️ Flavors | dev / staging / prod — `build.gradle.kts`, `FlavorConfig`, launch configs |

## What gets generated

```
my_app/
├── lib/
│   ├── main.dart                 # ProviderScope or plain runApp
│   ├── app.dart                  # MaterialApp(.router), theming, system UI
│   ├── utils/logger/             # AppLogger
│   ├── routes/                   # GoRouter (if selected)
│   ├── theme/                    # light + dark themes (if selected)
│   ├── services/network/         # Dio (if selected)
│   ├── features/auth/            # Login + register (if selected)
│   ├── services/firebase/        # Firebase init (if selected)
│   ├── services/storage/         # Secure storage (if selected)
│   ├── config/                   # Flavor config (if selected)
│   └── core/initialization/      # AppInitializer bootstrap
├── android/app/build.gradle.kts  # namespace, applicationId, productFlavors
├── pubspec.yaml                  # only the deps you actually need
├── analysis_options.yaml
├── README.md
└── .vscode/
    ├── extensions.json
    ├── settings.json
    ├── launch.json               # flavor-aware run configs
    └── tasks.json                # flavor-aware build tasks
```

## Local development

```bash
git clone https://github.com/betaversionio/xo-flutter
cd xo-flutter
xo link flutter

# then from any project dir:
xo create flutter
```

## Related

- [xo](https://github.com/betaversionio/xocode) — the workflow engine powering this generator
- [betaversionio/ui](https://github.com/betaversionio/ui) — shadcn-style component registry (`xo add @github/betaversionio/ui`)
