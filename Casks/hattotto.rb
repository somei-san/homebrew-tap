cask "hattotto" do
  version "0.9.0"
  sha256 "a61b19edd5e0a06197f0405f61e8fe1b8f8ffcb97f6c642bb13ce4f6a8609274"

  url "https://github.com/somei-san/hattotto/releases/download/v#{version}/Hattotto_0.9.0_universal.dmg"
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
