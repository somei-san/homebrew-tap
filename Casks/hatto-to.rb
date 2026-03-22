cask "hatto-to" do
  version "0.1.1"
  sha256 "89e271fdd68c307ec5433c19504d3e2e5f57886f97e68f2d7ecc4b591f7c2c4d"

  url "https://github.com/somei-san/hatto-to/releases/download/v#{version}/Hatto-to_0.1.0_universal.dmg"
  name "Hatto-to"
  desc "macOS Stickies-style sticky notes desktop app"
  homepage "https://github.com/somei-san/hatto-to"

  app "Hatto-to.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/Hatto-to.app"]
  end

  caveats <<~EOS
    #{token} is not signed with an Apple Developer ID.
    The quarantine attribute has been automatically removed during installation.
  EOS

  zap trash: [
    "~/Library/Application Support/com.hatto-to.app",
  ]
end
