cask "hattotto" do
  version "0.3.1"
  sha256 "9f5f172ea8784bed8912734babf8ae4784a8adf583f7b91ab5e7627a6f1e2955"

  url "https://github.com/somei-san/hattotto/releases/download/v#{version}/Hattotto_0.3.1_universal.dmg"
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
