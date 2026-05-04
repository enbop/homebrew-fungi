cask "fungi-nightly" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026.05.04.020220"
  sha256 arm:   "abbbf385f79e252c7f58e6497d9cce2481c9b6d702b989198271a6b22970a464",
         intel: "034774c027a7762e4001f5f0dbdebe96afecc6e0a985dcdc8928c6fa24b4acb4"

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
