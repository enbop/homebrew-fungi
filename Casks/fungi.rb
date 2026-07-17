cask "fungi" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.7.0"
  sha256 arm:   "2b728f8b5dc05155a01902d2934e95760f3318a88a8150928a0c79f17370a55a",
         intel: "9e794b27938bae0e4f2b01ff635e8473363627a4d6eff00b50d4d247d4242238"

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
