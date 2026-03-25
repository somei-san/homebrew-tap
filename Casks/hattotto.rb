cask "hattotto" do
  version "0.1.7"
  sha256 "7e720f810ad728a68d05ed03d3be38f141782a57fed01ff9fbac508fca16c8a0"

  url "https://github.com/somei-san/hattotto/releases/download/v#{version}/Hattotto_0.1.7_universal.dmg"
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
