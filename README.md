# CodexIOSStarter

SwiftUI starter app (iOS 17+) with:
- Modern Observation (`@Observable`, `@State`, `@Bindable`)
- `NavigationStack`-based app shell
- Stable list identity and lightweight filtering
- A simple performance-audit checklist

## Generate the Xcode project

This workspace does not have Apple tooling installed, so the project is scaffolded with XcodeGen metadata.

On a Mac:

```bash
brew install xcodegen
cd CodexIOSStarter
xcodegen generate
open CodexIOSStarter.xcodeproj
```

Then run on an iOS 17+ simulator from Xcode.

## File structure

- `Sources/App`: app entry and root navigation
- `Sources/Core`: models and observable state
- `Sources/Features/Tasks`: feature UI
- `PERFORMANCE_AUDIT.md`: quick audit + profiling checklist

## Build unsigned IPA on GitHub (from Windows)

This repo includes `.github/workflows/unsigned-ipa.yml`.

1. Push the project to a GitHub repository.
2. Open the repository Actions tab.
3. Run the `Unsigned IPA` workflow (manual trigger).
4. Download `CodexIOSStarter-unsigned-ipa` artifact.
