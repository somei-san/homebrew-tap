cask "cliip-show" do
  version "0.5.0"
  sha256 "b5c10d4e9fec70e1530d183b4b75ea9a7eb0e61b20dcf2b126fd9b6943b415f9"

  url "https://github.com/somei-san/cliip-show/releases/download/v#{version}/Cliip-Show-#{version}-universal.zip"
  name "Cliip Show"
  desc "Show copied clipboard text as a HUD on macOS"
  homepage "https://github.com/somei-san/cliip-show"

  depends_on macos: ">= :big_sur"

  app "Cliip Show.app"
  binary "#{appdir}/Cliip Show.app/Contents/MacOS/cliip-show"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/Cliip Show.app"]
  end

  uninstall quit:      "io.github.somei-san.cliip-show",
            launchctl: "io.github.somei-san.cliip-show"

  caveats <<~EOS
    #{token} is not signed with an Apple Developer ID.
    The quarantine attribute has been automatically removed during installation.

    Launch it from Spotlight or:
      open -a "Cliip Show"
  EOS

  zap trash: [
    "~/Library/Application Support/cliip-show",
    "~/Library/LaunchAgents/io.github.somei-san.cliip-show.plist",
    "~/Library/Logs/cliip-show.log",
  ]
end
