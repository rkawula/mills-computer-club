class RiemannClient < Formula
  homepage "https://github.com/algernon/riemann-c-client"
  url "https://github.com/algernon/riemann-c-client/archive/riemann-c-client-1.3.0.tar.gz"
  sha1 "0b360e12839683a3a89caf2cd58a8fb1e337e19e"

  bottle do
    cellar :any
    sha1 "348a16b5fb7d400481de3109f147cfe198cf2717" => :yosemite
    sha1 "12cd20d92512f4fb1f8b559da06fa88f78e267e5" => :mavericks
    sha1 "9c3e0cf990883eec78f9cc51f42407cc80f832cc" => :mountain_lion
  end

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "pkg-config" => :build
  depends_on "libtool" => :build

  depends_on "json-c"
  depends_on "protobuf-c"

  def install
    system "autoreconf", "-i"
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "check"
    system "make", "install"
  end

  test do
    system "#{bin}/riemann-client", "send", "-h"
  end
end
