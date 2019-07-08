class Tunneldns < Formula
  desc "DNS over HTTPS (DoH) proxy"
  homepage "https://github.com/silas/tunneldns"
  version "0.1.0"
  url "https://www.sewell.org/downloads/tunneldns/tunneldns-#{version}.tar.gz"
  sha256 "60b197a9371f0570a87f318009dc945dc90d1ce78c211eab5093df1bb3b91230"

  def install
    bin.install "tunneldns"
  end

  test do
    system "tunneldns --version"
  end
end
