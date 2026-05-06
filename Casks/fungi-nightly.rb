cask "fungi-nightly" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026.05.06.100327"
  sha256 arm:   "2b26d6c09f2c36963acdff5a55b8cf648b0068f96f6f281b1c957ffdc4bdc0ad",
         intel: "33123a05b643e31777d7219c1df037e87d493712618ef8a067532a9bcc3ffcb2"

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
