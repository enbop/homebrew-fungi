cask "fungi-nightly" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026.06.11.145516"
  sha256 arm:   "6f8bf11b53e8c72a35639ed271dfeaf298b6952e7296ff2814972969a1c8e37b",
         intel: "22b15c3df109b7121a5720f522da4e9e3b2297c5afa8c6a472ea8e022a5c81c0"

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
