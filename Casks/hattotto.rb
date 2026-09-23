cask "hattotto" do
  version "0.11.0"
  sha256 "41ec6f5097eed1f6d662eb2adf73788d2d7561839c493a841f708e7c1bd005a9"

  url "https://github.com/somei-san/hattotto/releases/download/v#{version}/Hattotto_0.11.0_universal.dmg"
  name "Hattotto"
  desc "macOS Stickies-style sticky notes desktop app"
  homepage "https://github.com/somei-san/hattotto"

  app "Hattotto.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/Hattotto.app"]
  end

  caveats <<~EOS
    #{token} is not signed with an Apple Developer ID.
    The quarantine attribute has been automatically removed during installation.
  EOS

  zap trash: [
    "~/Library/Application Support/com.hattotto.app",
  ]
end
