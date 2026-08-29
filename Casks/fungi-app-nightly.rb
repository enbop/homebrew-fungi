cask "fungi-app-nightly" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026.08.29.095831"
  sha256 arm:   "93508fe85a99a2de6c4a2cbe7343ab95e4365a15df2c2f4252c8797e10981f30",
         intel: "d0b6ea9bf88639c6539fa16c9c82c276661b3bc294455427f636e2aee2cb7fb4"

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
