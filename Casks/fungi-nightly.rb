cask "fungi-nightly" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026.06.17.153303"
  sha256 arm:   "0c5ef1171defdba0898284500b1f07edce3501065d055b8e561119ca061094f2",
         intel: "355ca39b1a35ebf302dd0003f63dfdc8d259859d53b59b213664d4434486e687"

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
