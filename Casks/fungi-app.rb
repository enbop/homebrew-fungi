cask "fungi-app" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.6.1+2"
  sha256 arm:   "713b709d23d7a83dd7953aaf56b619bac60295db307e698218b1ecaa6bd6ff36",
         intel: "b9fcb0270cb9436eae8814789efd73211245341ca41379d50de86c4b2db8f6ef"

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
