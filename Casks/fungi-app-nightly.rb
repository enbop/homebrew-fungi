cask "fungi-app-nightly" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026.04.23.140838"
  sha256 arm:   "caee7950cd0d07f2a900f468aeb9fc079b8978a8923c0453fcda87aaa1a733a2",
         intel: "b0d689e8c4da918c9df6cef79f52378cddb29ef107c543c35c6b06e46cb556f6"

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
