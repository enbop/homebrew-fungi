cask "fungi-app" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.7.0+3"
  sha256 arm:   "e37c7975b25711cf9a34abc99468bb556b66ef5298b9a4a2ce8060ffc029c8b0",
         intel: "b3727884189a81838ca2d2fc7331db5a1e32df483202492f4035a74b1f360e55"

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
