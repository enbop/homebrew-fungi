cask "fungi-nightly" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026.05.05.081140"
  sha256 arm:   "37067e8802c297f73d96433bf43772ce2a711f457af620f103eff5bd76f96c83",
         intel: "bc637792ba0c2a692a28923c036313de25fee7f08339eb2b04a34220ddb64d60"

  url "https://github.com/enbop/fungi/releases/download/nightly/fungi-macos-#{arch}.tar.gz",
      verified: "github.com/enbop/fungi/"
  name "Fungi Nightly"
  desc "Nightly CLI and daemon for multi-device service access"
  homepage "https://github.com/enbop/fungi"

  binary "fungi", target: "fungi-nightly"

  postflight do
    system_command "xattr",
                   args: ["-d", "com.apple.quarantine", "#{staged_path}/fungi"]
  end
end
