require "formula"

class Exempi < Formula
  homepage "http://libopenraw.freedesktop.org/wiki/Exempi"
  url "http://libopenraw.freedesktop.org/download/exempi-2.2.2.tar.bz2"
  sha1 "c0a0014e18f05aa7fac210c84788ef073718a9d8"

  bottle do
    cellar :any
    sha1 "c8d68d4bba7682029828eae8140f2e4612411ff1" => :mavericks
    sha1 "97517b6dcf56680855be22f0c0521b9ae498613f" => :mountain_lion
    sha1 "9d047f2558f28bfa9e008e4f4ec11939b74ec99d" => :lion
  end

  depends_on "boost"

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--with-boost=#{HOMEBREW_PREFIX}"
    system "make", "install"
  end
end
