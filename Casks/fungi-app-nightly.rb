cask "fungi-app-nightly" do
  arch arm: "aarch64", intel: "x86_64"

  version "2026.05.07.142653"
  sha256 arm:   "694db812217c71ac1b957bd8180dc61caed30a20d2ae6a851efc4249be3edc9d",
         intel: "4c07d61e6f2e70e742693d7711706c907c8d75919d8a1af7e4fd079d45becbbc"

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
