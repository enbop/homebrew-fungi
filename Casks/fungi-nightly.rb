cask "fungi-nightly" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026.08.02.123521"
  sha256 arm:   "306e9c9195e50eab3b6cbc6503f545aaea97316185a0272e095d38870935c6a1",
         intel: "1b48316467d41faa9c3fe9b802aa4b1630be05de0cbe5ad4b34d5a7f43d4791c"

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
