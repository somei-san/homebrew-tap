cask "hatto-to" do
  version "0.1.0"
  sha256 "f2c5209288895758e7dae850dd6339ad5f188945d88482486379471b9a126eed"

  url "https://github.com/somei-san/hatto-to/releases/download/v#{version}/Hatto-to_0.1.0_universal.dmg"
  name "Hatto-to"
  desc "macOS Stickies-style sticky notes desktop app"
  homepage "https://github.com/somei-san/hatto-to"

  app "Hatto-to.app"

  caveats <<~EOS
    #{token} is not signed with an Apple Developer ID.
    On first launch, you need to remove the quarantine attribute:
      xattr -cr /Applications/Hatto-to.app
  EOS

  zap trash: [
    "~/Library/Application Support/com.hatto-to.app",
  ]
end
