cask "fungi" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.8.1"
  sha256 arm:   "267fdcdc7329b54dfcc8ef8c38e5bac83689fbe4d71eb25e179f30ec91e81be4",
         intel: "0eb89afdede06e613ab9001e38fad38838042efb1251cd688ea5080f56355ef0"

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
