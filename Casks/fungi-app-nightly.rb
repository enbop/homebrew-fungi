cask "fungi-app-nightly" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026.04.13.125708"
  sha256 arm:   "97d119611b81cedccf6028c020b4762d7fdde232ec350814700d72fe02d5ece5",
         intel: "746cdfed5f79b8aff27deb8b6a5bc0abfb15f573df1d443b4f75c17c88aac3c2"

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
