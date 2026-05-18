cask "fungi-nightly" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026.05.18.160437"
  sha256 arm:   "ed9abca158980306dad1596bcaa1d3250867b9317053bc84710867efaca0dd09",
         intel: "af905d35c5aa746e575c96a1b99a42d7dc2c4b3e4693179f7e6bcd35c6f9a6d0"

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
