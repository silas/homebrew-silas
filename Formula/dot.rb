class Dot < Formula
  desc "Another dotfile manager"
  homepage "https://github.com/silas/dot"
  version "0.1.0"
  url "https://github.com/silas/dot/archive/#{version}.tar.gz"
  sha256 "cca9669deec2ac93fe2390cff7d59ea2d40e6d4b5ce901ae49affd53b39110e4"

  def install
    bin.install "dot"
  end

  test do
    system "dot --version"
  end
end
