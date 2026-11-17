cask "fungi" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.8.1"
  sha256 arm:   "4ca966bbe1ad3f7d2cd571b8c0ed544508d8946ebc375e28bfd50bb9700d1349",
         intel: "8469e359c87b72e8f2bb3cce8b9eee8dc35b9f15b7c3bf7b2fa43e0e0e377977"

  url "https://github.com/enbop/fungi/releases/download/v#{version}/fungi-macos-#{arch}.tar.gz",
      verified: "github.com/enbop/fungi/"
  name "Fungi"
  desc "CLI and daemon for multi-device service access"
  homepage "https://github.com/enbop/fungi"

  binary "fungi"

  postflight do
    system_command "xattr",
                   args: ["-d", "com.apple.quarantine", "#{staged_path}/fungi"]
  end
end
