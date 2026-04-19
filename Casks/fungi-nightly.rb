cask "fungi-nightly" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026.04.19.094016"
  sha256 arm:   "c21186e38f38582227a2e5a0e1042e24af8cf10b81de5a739f6cfb17ae915a7d",
         intel: "74eed1ad1b77d518b6eadc5d43a51d6dcc2cfa543ce93bec8713120f5ba8d650"

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
