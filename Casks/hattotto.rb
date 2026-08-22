cask "hattotto" do
  version "0.4.0"
  sha256 "651fde0e975402725c2b75faaa2c7f4a0457d3c0aebd5f614bcea514415e7555"

  url "https://github.com/somei-san/hattotto/releases/download/v#{version}/Hattotto_0.4.0_universal.dmg"
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
