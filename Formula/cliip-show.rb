class CliipShow < Formula
  desc "Show copied clipboard text as a HUD on macOS"
  homepage "https://github.com/somei-san/cliip-show"
  url "https://github.com/somei-san/cliip-show/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "0ecbb953555d904422f09358625270411dcea7fb922e48a695360e4010e8d49c"
  license "MIT"
  head "https://github.com/somei-san/cliip-show.git", branch: "main"

  depends_on :macos
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  def caveats
    <<~EOS
      To launch cliip-show now and restart at login:
        brew services start cliip-show

      To stop:
        brew services stop cliip-show

      To restart cliip-show after an upgrade:
        brew services restart cliip-show
    EOS
  end

  service do
    run [opt_bin/"cliip-show"]
    keep_alive true
    run_at_load true
    process_type :interactive
    log_path var/"log/cliip-show.log"
    error_log_path var/"log/cliip-show.log"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/cliip-show --version").strip
  end
end
