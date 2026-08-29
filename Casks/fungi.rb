cask "fungi" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.7.1"
  sha256 arm:   "2ee4cdda1624c37e7d447add5888bab15e789233137b0138e2a9a8d631669b5f",
         intel: "cd01fed878c412785f33fd58962f976a36914185b04b968552a33853973b41ce"

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
