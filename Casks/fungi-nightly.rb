cask "fungi-nightly" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026.05.16.122409"
  sha256 arm:   "231714f99c3e685f46c59e860e60a94a21a884e21113bac87aae8b0a74c39762",
         intel: "6012238a0cea7d7b6d688bade6e7547b6169b89f6451ab2458e1576dd3af49ac"

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
