require "formula"

class Libvoikko < Formula
  homepage "http://voikko.puimula.org/"
  url "http://www.puimula.org/voikko-sources/libvoikko/libvoikko-3.7.1.tar.gz"
  sha1 "b6d7ec669bbc33ba5f526f53b1d297f9ee315178"

  bottle do
    cellar :any
    revision 1
    sha1 "11c152b2f716a8188e7bad9ff691e279ba72b810" => :yosemite
    sha1 "2a6e8102def1ca64b0582d93cbc7d47aed515818" => :mavericks
    sha1 "77ad5d81082c547a1cc1d93465eca0571cb4dcdf" => :mountain_lion
  end

  depends_on "pkg-config" => :build
  depends_on "suomi-malaga-voikko"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          "--with-dictionary-path=#{HOMEBREW_PREFIX}/lib/voikko"
    system "make", "install"
  end
end
