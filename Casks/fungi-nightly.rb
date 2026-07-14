cask "fungi-nightly" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026.07.14.141928"
  sha256 arm:   "430e697961f02004c31921dcfadc445cd2d74ed3ee84c4ed3b203cb2173e715b",
         intel: "1d86b1f699c8eacc9596b47c9aceab006bb7754907867ad1cac7ef53b159077c"

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
