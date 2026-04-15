cask "fungi-nightly" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026.04.15.145233"
  sha256 arm:   "6f527e02c99feb728f7fd14fd4022074a60fa93230ab9afc2309d23c0297172a",
         intel: "af05396c0b899e0a8b001be59b4656a86b2319f135076a7b9dae624ec60d8295"

  url "https://github.com/enbop/fungi/releases/download/nightly/fungi-macos-#{arch}.tar.gz",
      verified: "github.com/enbop/fungi/"
  name "Fungi Nightly"
  desc "Nightly CLI and daemon for multi-device service access"
  homepage "https://github.com/enbop/fungi"

  binary "fungi"

  postflight do
    system_command "xattr",
                   args: ["-d", "com.apple.quarantine", "#{staged_path}/fungi"]
  end
end
