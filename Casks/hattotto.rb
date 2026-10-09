cask "hattotto" do
  version "0.13.0"
  sha256 "5e2e001100e05416daa9050982281faf999f68a0f37bd1818287387f088c30ef"

  url "https://github.com/somei-san/hattotto/releases/download/v#{version}/Hattotto_0.13.0_universal.dmg"
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
