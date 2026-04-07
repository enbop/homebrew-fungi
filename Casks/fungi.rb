cask "fungi" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.6.1"
  sha256 arm:   "892dac5c1e2bbd90985e6c9d870df56ee449a6022af21a613e02aaebc451e808",
         intel: "dc4be963cb07c06cf0e6bba5a01884d42ebf8284397ccf5e93abd0c8d7aec3f8"

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
