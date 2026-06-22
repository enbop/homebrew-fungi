cask "fungi-nightly" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026.06.22.150527"
  sha256 arm:   "ee1f5ed784a49aeebdd713a72fed88e4277e5dfd03646175e725f9e07c8f8dc3",
         intel: "0604cf802dda4a33da4b5ffe10d0ea1dc779a61f00d47d9d904cfe79aad72070"

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
