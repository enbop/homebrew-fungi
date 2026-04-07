# Fungi Homebrew Tap

Homebrew tap for the Fungi ecosystem.

## Install

```bash
brew tap enbop/fungi
brew install fungi
brew install --cask fungi-app
```

`fungi` and `fungi-app` are pinned to explicit GitHub Release versions and SHA-256 values.

`fungi` and `fungi-app` are currently unsigned on macOS, so their casks clear the quarantine attribute in `postflight` for now. This is a temporary install path until proper Apple signing and notarization are added.

Expected release assets:

- `fungi-macos-aarch64.tar.gz`
- `fungi-macos-x86_64.tar.gz`
- `fungi-app-macos-aarch64.tar.gz`
- `fungi-app-macos-x86_64.tar.gz`

This tap includes GitHub Actions that refresh the cask version and SHA-256 values from the latest upstream release and commit the result back to this repository.
