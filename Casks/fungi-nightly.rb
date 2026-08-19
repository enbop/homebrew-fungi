cask "fungi-nightly" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026.08.19.152123"
  sha256 arm:   "6e0ac4f663da4eb82bb28d45fca4ccab7dcbca0078d401088e478a5c7a68594f",
         intel: "cfc2ab2ba06ec7f322a3bc21c44cf44084d93bc6c02ee38856186825d9e060da"

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
