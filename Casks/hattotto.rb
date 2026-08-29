cask "hattotto" do
  version "0.6.0"
  sha256 "fbd3a8f01eed0977e5ea02d3ae0f98a4730b45cbaff2d3cf6d1e3c918786bad3"

  url "https://github.com/somei-san/hattotto/releases/download/v#{version}/Hattotto_0.6.0_universal.dmg"
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
