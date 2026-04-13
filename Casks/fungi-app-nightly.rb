cask "fungi-app-nightly" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026.04.13.133801"
  sha256 arm:   "47a55620b98b78b488d0bd910d3447e98adbc9b3276878657e9061c6ddf9f8d0",
         intel: "4be5692fbbf296896ea1b28a2249896e8b05185b4f9c4b8e406cf1b21153ccf0"

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
