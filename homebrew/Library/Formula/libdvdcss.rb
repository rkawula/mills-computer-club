class Libdvdcss < Formula
  homepage "https://www.videolan.org/developers/libdvdcss.html"
  url "https://download.videolan.org/pub/videolan/libdvdcss/1.3.99/libdvdcss-1.3.99.tar.bz2"
  sha1 "4da6ae5962a837f47a915def2cd64e685ea72668"

  head do
    url "git://git.videolan.org/libdvdcss"
    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "libtool" => :build
  end

  bottle do
    cellar :any
    sha1 "21e2c0560bfa1f83f08b2e7a8fc614e2b0226e8e" => :yosemite
    sha1 "ed34b81016c034c1f713848a1e787984890e59d2" => :mavericks
    sha1 "3f9e50d90d73539176075d5ce71d1329437745ed" => :mountain_lion
  end

  def install
    system "autoreconf", "-if" if build.head?
    system "./configure", "--prefix=#{prefix}", "--disable-dependency-tracking"
    system "make", "install"
  end
end
