cask "fungi-nightly" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026.05.15.145312"
  sha256 arm:   "6db04046e34dd6cfc45945da8c760c1895545dc78c2a51dcc20573ce1a0fdbf3",
         intel: "6686e06a3453da93728e7eea1ee2dc99ef2e0ae068edc48534d5735a87a1c950"

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
