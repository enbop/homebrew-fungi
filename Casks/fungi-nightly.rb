cask "fungi-nightly" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026.04.22.162639"
  sha256 arm:   "4651f5bc94a01b35ae0aa3d0ab338326a7d63a59ae9af70d0a973beda42e495b",
         intel: "ff2f3ab7d688a0a45cd8174a55617b77cddb1daca48269b7d1472788a4dedb81"

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
