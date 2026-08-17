class CliipShow < Formula
  desc "Show copied clipboard text as a HUD on macOS"
  homepage "https://github.com/somei-san/cliip-show"
  url "https://github.com/somei-san/cliip-show/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "78a76442cc21ff353fd51f12160c361df365c816ce5bcb7caa75c333cc036d51"
  license "MIT"
  head "https://github.com/somei-san/cliip-show.git", branch: "main"

  depends_on :macos
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  def caveats
    <<~EOS
      cliip-show manages its own auto-start. Launch it once:
        #{opt_bin}/cliip-show

      Then open the menu bar icon > Settings... and check
      "Automatically start at login" to enable auto-start.
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/cliip-show --version").strip
  end
end
