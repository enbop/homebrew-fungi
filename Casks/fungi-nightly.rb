cask "fungi-nightly" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026.04.15.155446"
  sha256 arm:   "608150d6f63f1bead96e2334e3ff0b74ae61ba2d37fe3bfd75aa754dee4d0c92",
         intel: "323431fcb4de0bdf574c13f3bfdd0e379683b08984d9eef0270d60b39431ef88"

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
