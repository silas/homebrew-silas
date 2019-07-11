class Tunneldns < Formula
  desc "DNS over HTTPS (DoH) proxy"
  homepage "https://github.com/silas/tunneldns"
  version "0.4.0"
  url "https://www.sewell.org/downloads/tunneldns/tunneldns-#{version}.tar.gz"
  sha256 "9bf9acc01f8b6483524e10d179bc63e59988b542bb2b4326965ec184bf16758c"

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
