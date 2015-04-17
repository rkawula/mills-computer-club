class Cowsay < Formula
  homepage "https://web.archive.org/web/20120225123719/http://www.nog.net/~tony/warez/cowsay.shtml"
  url "http://ftp.acc.umu.se/mirror/cdimage/snapshot/Debian/pool/main/c/cowsay/cowsay_3.03.orig.tar.gz"
  sha1 "cc65a9b13295c87df94a58caa8a9176ce5ec4a27"

  bottle do
    sha1 "50dcf6ac955d2644d2543728bda2ee02abafcb67" => :yosemite
    sha1 "79131dfcab303271d332bf69373f11433401f1b3" => :mavericks
    sha1 "65f118084f895e553faf2eac15335fc23e331b77" => :mountain_lion
  end

  # Official download is 404:
  # url "http://www.nog.net/~tony/warez/cowsay-3.03.tar.gz"

  def install
    system "/bin/sh", "install.sh", prefix
    mv prefix/"man", share
  end

  test do
    output = shell_output("#{bin}/cowsay moo")
    assert output.include?("moo")  # bubble
    assert output.include?("^__^") # cow
  end
end
