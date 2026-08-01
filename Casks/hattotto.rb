cask "hattotto" do
  version "0.2.0"
  sha256 "12d1752c017e61776d117ab040d1767f884883c4ca1e2ce9ce5869458ee6daad"

  url "https://github.com/somei-san/hattotto/releases/download/v#{version}/Hattotto_0.2.0_universal.dmg"
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
