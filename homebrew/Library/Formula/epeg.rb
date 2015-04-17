require "formula"

class Epeg < Formula
  homepage "https://github.com/mattes/epeg"
  url "https://github.com/mattes/epeg/archive/v0.9.1.042.tar.gz"
  sha1 "51ef8a55c9567e75c64bf3390fe7c92aa76ac306"

  head "https://github.com/mattes/epeg.git"

  bottle do
    cellar :any
    sha1 "a12a4553bd78bff070f01be5d3e7062372383e31" => :yosemite
    sha1 "ce665a144c3c355ae745067e686465f1f6dfafc3" => :mavericks
    sha1 "24ca70477748c42a71a31df9facc1b21a400c1e1" => :mountain_lion
  end

  depends_on "automake" => :build
  depends_on "jpeg"
  depends_on "libexif"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "epeg", "--width=1",
                   "--height=1",
                   test_fixtures("test.jpg")
                   "out.jpg"
  end
end
