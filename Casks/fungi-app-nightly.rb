cask "fungi-app-nightly" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026.04.19.144148"
  sha256 arm:   "f2d9b500275114e3ce7d3cc46ec70906c5d3a8d382f16725abe6450197c9cd8e",
         intel: "d65c749f2c236d85376594857aad3442806f1bbe54fc7b4599eb74ce33df9693"

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
