cask "fungi-app-nightly" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026.04.19.140609"
  sha256 arm:   "3086268f6f90d62fab9f07d9a4b6d1bc6a890fb3dd47c291e7438222a963f8a1",
         intel: "b5eff3a6e954d11af3714d801fed601cdeb54e4608f6a63e37af0e21ff631336"

  url "https://github.com/enbop/fungi-app/releases/download/nightly/fungi-app-macos-#{arch}.tar.gz",
      verified: "github.com/enbop/fungi-app/"
  name "Fungi Dev"
  desc "Nightly Flutter desktop app for Fungi"
  homepage "https://github.com/enbop/fungi-app"

  app "Fungi Dev.app"

  postflight do
    system_command "xattr",
                   args: ["-c", "#{appdir}/Fungi Dev.app"]
  end

  zap trash: [
    "~/Library/Application Support/rs.fungi.FungiApp.nightly",
    "~/Library/Preferences/rs.fungi.FungiApp.nightly.plist",
  ]
end
