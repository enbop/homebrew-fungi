cask "fungi-nightly" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026.07.11.051145"
  sha256 arm:   "bff01fbaa5e7a1fb4317b773172af5f303556482c4d9157e596f45289da3c996",
         intel: "e2bec9d8930b130155e5e53bf5098d47d763111efc7294c0d8871e6d35a52cb9"

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
