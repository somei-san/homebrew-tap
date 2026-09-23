cask "hattotto" do
  version "0.11.1"
  sha256 "fb1ab0a3425865f829cf31171c6fc7949fdf5e66b9f571eada7083984b720264"

  url "https://github.com/somei-san/hattotto/releases/download/v#{version}/Hattotto_0.11.1_universal.dmg"
  name "Hattotto"
  desc "Stickies-style sticky notes desktop app"
  homepage "https://github.com/somei-san/hattotto"

  depends_on :macos

  app "Hattotto.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/Hattotto.app"]
  end

  zap trash: "~/Library/Application Support/com.hattotto.app"

  caveats <<~EOS
    #{token} is not signed with an Apple Developer ID.
    The quarantine attribute has been automatically removed during installation.
  EOS
end
