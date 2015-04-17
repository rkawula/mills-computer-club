class Debianutils < Formula
  homepage "http://anonscm.debian.org/gitweb/?p=users/clint/debianutils.git"
  url "http://ftp.de.debian.org/debian/pool/main/d/debianutils/debianutils_4.4.tar.gz"
  sha1 "019b969ab698c83117254b50fc8f469f10a5d8d6"

  bottle do
    cellar :any
    sha1 "398ac6655a7d27ddcd1d7fd03591982496608d1b" => :yosemite
    sha1 "794a83a5c92785c3b867fece70cf6b1c3646ba04" => :mavericks
    sha1 "b2ea1e5f9f1a0bfa57e0179799da1cf427762c1c" => :mountain_lion
  end

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make"

    # some commands are Debian Linux specific and we don't want them, so install specific tools
    bin.install "run-parts", "ischroot", "tempfile"
    man1.install "ischroot.1", "tempfile.1"
    man8.install "run-parts.8"
  end

  test do
    assert File.exist?(shell_output("#{bin}/tempfile -d #{Dir.pwd}").strip)
  end
end
