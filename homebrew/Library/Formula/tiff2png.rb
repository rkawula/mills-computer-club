class Tiff2png < Formula
  homepage "http://www.libpng.org/pub/png/apps/tiff2png.html"
  url "https://github.com/rillian/tiff2png/archive/v0.92.tar.gz"
  sha1 "b838d0e43410a237837b46654e3fb1644fd9891f"

  bottle do
    cellar :any
    sha1 "26a1789b8993f768a39e8b205b94fbc8f16605a3" => :yosemite
    sha1 "897b3ed4ae0529dc7d71992c2b36cd05586f5cd6" => :mavericks
    sha1 "5e91908ae45ce0dda0504465e31f8e0f610feac4" => :mountain_lion
  end

  depends_on "libtiff"
  depends_on "libpng"
  depends_on "jpeg"

  def install
    bin.mkpath
    system "make", "INSTALL=#{prefix}", "CC=#{ENV.cc}", "install"
  end

  test do
    system "#{bin}/tiff2png", test_fixtures("test.tiff")
  end
end
