cask "hattotto" do
  version "0.1.2"
  sha256 "9a02ac551131b0016b285afbb0d528e088aed681f9646616c4227ff0b3047b48"

  url "https://github.com/somei-san/hattotto/releases/download/v#{version}/Hattotto_0.1.0_universal.dmg"
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
