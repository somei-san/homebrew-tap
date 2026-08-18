cask "cliip-show" do
  version "0.5.1"
  sha256 "b49f1031c52d715daf4e7a4c8d85b5099d6bea7d64710d27d187d64ea569ad6e"

  url "https://github.com/somei-san/cliip-show/releases/download/v#{version}/Cliip-Show-#{version}-universal.zip"
  name "Cliip Show"
  desc "Show copied clipboard text as a HUD on macOS"
  homepage "https://github.com/somei-san/cliip-show"

  depends_on macos: :big_sur

  app "Cliip Show.app"
  binary "#{appdir}/Cliip Show.app/Contents/MacOS/cliip-show"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/Cliip Show.app"]
  end

  uninstall quit:      "io.github.somei-san.cliip-show",
            launchctl: "io.github.somei-san.cliip-show"

  caveats <<~EOS
    Launch it once from Spotlight, or:
      open -a "Cliip Show"

    #{token} is not signed with an Apple Developer ID.
    The quarantine attribute has been automatically removed during installation.
  EOS

  zap trash: [
    "~/Library/Application Support/cliip-show",
    "~/Library/LaunchAgents/io.github.somei-san.cliip-show.plist",
    "~/Library/Logs/cliip-show.log",
  ]
end
