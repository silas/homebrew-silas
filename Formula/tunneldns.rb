class Tunneldns < Formula
  desc "DNS over HTTPS (DoH) proxy"
  homepage "https://github.com/silas/tunneldns"
  version "0.2.0"
  url "https://www.sewell.org/downloads/tunneldns/tunneldns-#{version}.tar.gz"
  sha256 "220bbfa148d6cdc57063b84fb983a1d115e76133295a477495504304b7497ce1"

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
