cask "hattotto" do
  version "0.1.11"
  sha256 "23cc1dcd147a1b6c8da7419b32c3ebb63433aa93289c31f1b37cf352ee6ac754"

  url "https://github.com/somei-san/hattotto/releases/download/v#{version}/Hattotto_0.1.11_universal.dmg"
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
