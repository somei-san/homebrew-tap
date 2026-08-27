cask "hattotto" do
  version "0.5.0"
  sha256 "d89240400a71288894b8407dd5b1111d3db1a4e874f65c0e82a3d51f2cc78728"

  url "https://github.com/somei-san/hattotto/releases/download/v#{version}/Hattotto_0.5.0_universal.dmg"
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
