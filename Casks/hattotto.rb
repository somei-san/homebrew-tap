cask "hattotto" do
  version "0.13.1"
  sha256 "e1bef3965bf7c5eb6542e99e6f2fd590396772c2755c67bd9a759e981ddf7d2d"

  url "https://github.com/somei-san/hattotto/releases/download/v#{version}/Hattotto_0.13.1_universal.dmg"
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
