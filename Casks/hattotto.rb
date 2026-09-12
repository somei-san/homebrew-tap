cask "hattotto" do
  version "0.10.0"
  sha256 "b19aed4c6c66fc2974cb359e794cdacd8500d428e808dc82d3eb805c0511d260"

  url "https://github.com/somei-san/hattotto/releases/download/v#{version}/Hattotto_0.10.0_universal.dmg"
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
