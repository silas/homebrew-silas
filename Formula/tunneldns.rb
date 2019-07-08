class Tunneldns < Formula
  desc "DNS over HTTPS (DoH) proxy"
  homepage "https://github.com/silas/tunneldns"
  version "0.3.0"
  url "https://www.sewell.org/downloads/tunneldns/tunneldns-#{version}.tar.gz"
  sha256 "d8f139869111a712111b1e0e0c1ddf0bb6f91b244c764282f4f31625dd3cfb1a"

  def install
    sbin.install "tunneldns"
  end

  def post_install
    system "touch", etc/"tunneldns.conf"
  end

  plist_options :startup => true

  def plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>ProgramArguments</key>
        <array>
          <string>#{opt_sbin}/tunneldns</string>
          <string>--config</string>
          <string>#{etc}/tunneldns.conf</string>
        </array>
        <key>RunAtLoad</key>
        <true/>
        <key>KeepAlive</key>
        <true/>
      </dict>
    </plist>
  EOS
  end

  test do
    system "tunneldns --version"
  end
end
