cask "fungi-nightly" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026.05.14.144337"
  sha256 arm:   "90ab7cd29a67a407e6b7479c340e734f0b81b22bfc082a2c7578934f424d1c55",
         intel: "d0e91e428e9032ce742b5f6c59cf77be7fdd9d1bec67a9e9b79b069b4793d889"

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
