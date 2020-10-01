class Imapbackup3 < Formula
  include Language::Python::Virtualenv

  desc "Incremental backups of IMAP mailboxes"
  homepage "https://github.com/DavidMStraub/imapbackup3"
  url "https://files.pythonhosted.org/packages/75/e9/099bb265ff033ea35782a03e878c4e28d3566604108c16cc9d92a9224538/imapbackup3-0.2.1.1.tar.gz"
  sha256 "fe1b936d51f57d037e4b9bebdbf1bb4026962adb56c536ede4c6645e9cc7b6bd"
  license "MIT"

  depends_on "python@3.8"

  def install
    virtualenv_install_with_resources
  end

  # Avoid relative paths
  def post_install
    lib_python_path = Pathname.glob(libexec/"lib/python*").first
    lib_python_path.each_child do |f|
      next unless f.symlink?

      realpath = f.realpath
      rm f
      ln_s realpath, f
    end
  end

  test do
    ENV["LC_ALL"] = "en_US.UTF-8"
    assert_match "Commands", shell_output("#{bin}/imapbackup3")
  end
end
