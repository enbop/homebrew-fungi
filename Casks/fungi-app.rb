cask "fungi-app" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.7.0+3"
  sha256 arm:   "56553abbb8dbbdaab114eff87f6680fa3d716fb98dbdf7d8c2dcf5d7966eeac8",
         intel: "3b758cdc302e7f465d51a5995a081a4c518c021db50f5797f0a5b935144b7c04"

  url "https://github.com/enbop/fungi-app/releases/download/v#{version}/fungi-app-macos-#{arch}.tar.gz",
      verified: "github.com/enbop/fungi-app/"
  name "Fungi"
  desc "Official Flutter desktop app for Fungi"
  homepage "https://github.com/enbop/fungi-app"

  app "Fungi.app"

  postflight do
    system_command "xattr",
                   args: ["-c", "#{appdir}/Fungi.app"]
  end

  zap trash: [
    "~/Library/Application Support/rs.fungi.FungiApp",
    "~/Library/Preferences/rs.fungi.FungiApp.plist",
  ]
end
