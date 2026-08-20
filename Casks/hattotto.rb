cask "hattotto" do
  version "0.3.2"
  sha256 "e293a4b02757121a6d44541f7a47177ff8fa8cceb81e71eaa06e1fd303e2c522"

  url "https://github.com/somei-san/hattotto/releases/download/v#{version}/Hattotto_0.3.2_universal.dmg"
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
