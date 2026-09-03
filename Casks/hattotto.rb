cask "hattotto" do
  version "0.8.0"
  sha256 "54d0f25b813b1b6da74663d2bcc6e6f7363e1a071dd9e54e0a7e41db607517c5"

  url "https://github.com/somei-san/hattotto/releases/download/v#{version}/Hattotto_0.8.0_universal.dmg"
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
