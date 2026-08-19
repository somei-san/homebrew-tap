cask "cliip-show" do
  version "0.5.3"
  sha256 "0921d3ccb51ea753b25bba3aefa8b98ad47908dcd1541bfbb671e89aab8067b0"

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

  # launchctl: は指定しない。読み込みの有無に関わらず LaunchAgent の plist を消すうえ、
  # uninstall は upgrade でも走るため、更新のたびに自動起動が無効になる。
  # plist の後始末は zap に任せる。
  uninstall quit: "io.github.somei-san.cliip-show"

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
