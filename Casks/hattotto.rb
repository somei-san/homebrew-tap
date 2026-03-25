cask "hattotto" do
  version "0.1.9"
  sha256 "5e33aa04eaf689192b67ff6c72466f05435d219760b94e689da7f49cfbacd6a6"

  url "https://github.com/somei-san/hattotto/releases/download/v#{version}/Hattotto_0.1.9_universal.dmg"
  name "Hattotto"
  desc "macOS Stickies-style sticky notes desktop app"
  homepage "https://github.com/somei-san/hattotto"

  app "Hattotto.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/Hattotto.app"]
  end

  caveats <<~EOS
    #{token} is not signed with an Apple Developer ID.
    The quarantine attribute has been automatically removed during installation.
  EOS

  zap trash: [
    "~/Library/Application Support/com.hattotto.app",
  ]
end
