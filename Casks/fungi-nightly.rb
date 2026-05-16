cask "fungi-nightly" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026.05.16.134327"
  sha256 arm:   "67c3df9f02f1529177f5ce940dbba0177bfe12c88397bc8f82f1c8ee3808dada",
         intel: "9708b9a9c587c1332568127fb37c7dfd2ef7e86546ab6984ca44862deca3c0aa"

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
