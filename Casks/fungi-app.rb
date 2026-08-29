cask "fungi-app" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.7.1+4"
  sha256 arm:   "7d59f53f6c7fe075f7606ea38a470cd4aacf641a0f04948f5edb7ecad9569dec",
         intel: "a2b9108147cd1eed1ff8233ce4fc37c4f03d5978d306e9fcd63517dc893a3710"

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
