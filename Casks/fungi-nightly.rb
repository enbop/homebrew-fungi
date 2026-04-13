cask "fungi-nightly" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026.04.09.140504"
  sha256 arm:   "3ec1c68301668536a843557f50ccb2325b23f32474eca27813c7b1abba5fae5d",
         intel: "1c348f8880b0700448ae455c4c8d56231bd44f98400926e458a80f83a77e55fc"

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
