cask "fungi" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.8.0"
  sha256 arm:   "ff676e221df2a75958fa6c784f14fe16eade4173b030b40e58c58f9b514a4325",
         intel: "051640ef64ec37af0c64c508df8a1b4cda59fee9da6c3915939ce365bb0a5d8f"

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
