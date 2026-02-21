class Netscout < Formula
  desc "10-in-1 network diagnostics toolkit written in Rust"
  homepage "https://github.com/redbasecap-buiss/netscout"
  url "https://github.com/redbasecap-buiss/netscout/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "d3dc40e7f5cb46e9be5219bf1d2f6b6230e4dd6cd86a7b635a96462cd58ed676"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "netscout-cli")
  end

  test do
    output = shell_output("#{bin}/netscout dns google.com 2>&1", 0)
    assert_match "google.com", output
  end
end
