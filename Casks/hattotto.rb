cask "hattotto" do
  version "0.10.1"
  sha256 "72658c839b22f19a7322bed83676ec667d49baa94a8e2b2c5c4fea9724cee396"

  url "https://github.com/somei-san/hattotto/releases/download/v#{version}/Hattotto_0.10.1_universal.dmg"
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
