cask "fungi-app-nightly" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026.07.11.100547"
  sha256 arm:   "cc6e56acb468184f6094412423c6bed86bc64a03b4b5cf8d04b5380ed04b2af3",
         intel: "9f9728c8741db8834f83cb57cf32e0e4fc955d24061b8124b5c413a7036f8577"

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
