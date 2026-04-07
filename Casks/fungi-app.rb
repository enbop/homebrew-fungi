cask "fungi-app" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.6.1"
  sha256 arm:   "26c8f55cce41e32d6007571e453cda6de0247cd5ad44a71dab8077885165efe8",
         intel: "c27342c58f51a253cc022cdc2e93c77962f5bdad35131ac0777a4804bebfab49"

  url "https://github.com/enbop/fungi-app/releases/download/v#{version}/fungi-app-macos-#{arch}.tar.gz",
      verified: "github.com/enbop/fungi-app/"
  name "Fungi App"
  desc "Official Flutter desktop app for Fungi"
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
