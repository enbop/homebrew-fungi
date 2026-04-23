cask "fungi-nightly" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026.04.23.133433"
  sha256 arm:   "f37b844fef45a37d046254662aca438183c28b901fd3c30363047dd2027569fa",
         intel: "d0d6b49a52878a07aa07e01d2325f8ec344d66b1cbec9b4e6d1d1e02ee9878e1"

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
