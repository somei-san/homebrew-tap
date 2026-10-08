cask "hattotto" do
  version "0.12.0"
  sha256 "353baed79bc7437d60835ddcb824ddcfe2439d46a931fb216a74126aac265e31"

  url "https://github.com/somei-san/hattotto/releases/download/v#{version}/Hattotto_0.12.0_universal.dmg"
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
