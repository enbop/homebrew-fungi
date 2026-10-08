cask "fungi-app" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.8.0+5"
  sha256 arm:   "64f6de2e7ab824dc484a553aab9b772e278ba30e35893738b122a27848297af3",
         intel: "3d9e2dd3441fc8bff204759d7cb7f90c2c308f8e1a5f9f57ba39e41ac2ce4143"

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
