cask "fungi-nightly" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026.05.17.122256"
  sha256 arm:   "6a9e05ea2e6e852de88345ddc3743d4051584fa34dc4646a691c95c600a5fe82",
         intel: "d7539f059c528175d26be173143380ec5ca74569316944f6a06469661257a1b3"

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
