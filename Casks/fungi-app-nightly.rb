cask "fungi-app-nightly" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026.04.10.115445"
  sha256 arm:   "89150ac1a2eab4e81dd6cefd1a262a0fce292d583c21e2a0a84fa0bb5e62bdb0",
         intel: "36d32211d1a340e23fadc04dfeff0abccefd3f7f9f1da53e8880576074faded0"

  url "https://github.com/enbop/fungi-app/releases/download/nightly/fungi-app-macos-#{arch}.tar.gz",
      verified: "github.com/enbop/fungi-app/"
  name "Fungi App Nightly"
  desc "Nightly Flutter desktop app for Fungi"
  homepage "https://github.com/enbop/fungi-app"

  app "Fungi App.app"

  postflight do
    system_command "xattr",
                   args: ["-c", "#{appdir}/Fungi App.app"]
  end

  zap trash: [
    "~/Library/Application Support/rs.fungi.FungiApp",
    "~/Library/Preferences/rs.fungi.FungiApp.plist",
  ]
end
