cask "fungi-nightly" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026.04.13.130657"
  sha256 arm:   "0b13c28e5ceffd040f5bbaae967003da8aadeb55a1580c14e3b3feacdc2fc34f",
         intel: "e8a7839e198d790a53e974c9e16fad130bd130fa4f11f7f98df2d5a569b7554a"

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
