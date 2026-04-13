# Fungi Homebrew Tap

Homebrew tap for the Fungi ecosystem.

## Install

```bash
brew tap enbop/fungi
brew install fungi
brew install --cask fungi-app
```

Nightly channel:

```bash
brew tap enbop/fungi
brew install fungi-nightly
brew install --cask fungi-app-nightly
```

If `fungi-app` was previously installed manually from GitHub Releases by dragging `Fungi App.app` into `/Applications`, remove that existing app first before installing the cask. Homebrew will not overwrite an app that is already present there.

Stable `fungi` and `fungi-app` are pinned to explicit GitHub Release versions and SHA-256 values.

`fungi-nightly` and `fungi-app-nightly` track the mutable `nightly` GitHub release tag, but the tap still records a generated version plus pinned SHA-256 values so Homebrew can detect upgrades cleanly.

`fungi` and `fungi-app` are currently unsigned on macOS, so their casks clear the quarantine attribute in `postflight` for now. This is a temporary install path until proper Apple signing and notarization are added.

Expected release assets:

- `fungi-macos-aarch64.tar.gz`
- `fungi-macos-x86_64.tar.gz`
- `fungi-app-macos-aarch64.tar.gz`
- `fungi-app-macos-x86_64.tar.gz`

This tap includes GitHub Actions that refresh both stable and nightly casks from the upstream GitHub releases and commit the result back to this repository.
