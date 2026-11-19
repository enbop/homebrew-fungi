cask "fungi-app" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.8.1+6"
  sha256 arm:   "eda200fcba6c4f530b12b452407655c0db52de1f0991957e949929feaf9fc086",
         intel: "6c85b3c96b524b6061620784741b9138586663584a7b3ec0f1e18ecbd9b97ad0"

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
