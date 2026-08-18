cask "hattotto" do
  version "0.3.0"
  sha256 "cbec40dafb187a2d60761425cdf357f03b5d8de8bc88c9c8919ffdeba245226e"

  url "https://github.com/somei-san/hattotto/releases/download/v#{version}/Hattotto_0.3.0_universal.dmg"
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
