require "formula"

class Evas < Formula
  homepage "http://trac.enlightenment.org/e/wiki/Evas"
  url "http://download.enlightenment.org/releases/evas-1.7.10.tar.gz"
  sha1 "ad1002eded75ea0e90d80b3b6813b3278d9f4228"

  bottle do
    sha1 "2d46e4ae7cbd297b1937c6a0776cc0008f6c35f6" => :yosemite
    sha1 "f13c2631054365b846063b1cf760aae5116afae8" => :mavericks
    sha1 "2609ecbe2a0be5843674f59606d15ce1ee097699" => :mountain_lion
  end

  option "with-docs", "Install development libraries/headers and HTML docs"

  depends_on "pkg-config" => :build
  depends_on "eina"
  depends_on "eet"
  depends_on "freetype"
  depends_on "fontconfig"
  depends_on "fribidi"
  depends_on "harfbuzz"
  depends_on "doxygen" => :build if build.with? "docs"

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
    system "make", "install-doc" if build.with? "docs"
  end
end
