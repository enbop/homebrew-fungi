cask "fungi-nightly" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026.07.11.071049"
  sha256 arm:   "0c73f076a2ec81d5f5a1d6a1528fdaf8fec151a111cdfa3fb44e57ba19204881",
         intel: "5ca6d6cfd42ccfcad52f89d34134ab784c443b3f82be418b95bc3f5b5949323f"

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
