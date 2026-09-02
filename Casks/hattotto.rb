cask "hattotto" do
  version "0.7.0"
  sha256 "bb401f7c0eecd938f036f245ee6947761e49548c39fefe1dea8caada26935b7f"

  url "https://github.com/somei-san/hattotto/releases/download/v#{version}/Hattotto_0.7.0_universal.dmg"
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
