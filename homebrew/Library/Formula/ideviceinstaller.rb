require "formula"

class Ideviceinstaller < Formula
  homepage "http://www.libimobiledevice.org/"
  url "http://www.libimobiledevice.org/downloads/ideviceinstaller-1.1.0.tar.bz2"
  sha1 "5e2c47b9e6ac6d610b7bfe5186c8e84536549ce4"
  revision 1

  bottle do
    cellar :any
    sha1 "893e9e6cb97a2073bb0b42e9ae09cd5d085f6f0f" => :yosemite
    sha1 "e484976abf87bbf958c003b5f651db9329be862b" => :mavericks
    sha1 "7a8a684bb21b714c447fa484fa6cd4a8f6027313" => :mountain_lion
  end

  head do
    url "http://git.sukimashita.com/ideviceinstaller.git"
    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "libtool" => :build
  end

  depends_on "pkg-config" => :build
  depends_on "libimobiledevice"
  depends_on "libzip"

  def install
    system "./autogen.sh" if build.head?
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/ideviceinstaller --help |grep -q ^Usage"
  end
end
