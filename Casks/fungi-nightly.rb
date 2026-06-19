cask "fungi-nightly" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026.06.19.122405"
  sha256 arm:   "9e04f6529a839a7d2832af9ab3cb4d526f53857f41aaef67dc72f78e7628678e",
         intel: "dad887356fc20cf2418f64f92575e1e70e9dd237c5182553be6301f5b3286956"

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
