class Libssh2 < Formula
  homepage "http://www.libssh2.org/"
  url "http://www.libssh2.org/download/libssh2-1.5.0.tar.gz"
  sha256 "83196badd6868f5b926bdac8017a6f90fb8a90b16652d3bf02df0330d573d0fc"

  option "with-libressl", "build with LibreSSL instead of OpenSSL"

  head do
    url "git://git.libssh2.org/libssh2.git"

    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "libtool" => :build
  end

  bottle do
    cellar :any
    sha256 "f069fcc2533778dae3fbfbfd0b9d3a9a310437dde6e06983efc3a7dbe2630f08" => :yosemite
    sha256 "471c1a336daf133a0c34f257ec0df3652b4b22d9646738483e29d026e9bf75eb" => :mavericks
    sha256 "632f4e13eb4a8c4e8cc72de7733b2304e42d364c89e381ac557eee701c9034c0" => :mountain_lion
  end

  depends_on "openssl" => :recommended
  depends_on "libressl" => :optional

  def install
    args = %W[
      --prefix=#{prefix}
      --disable-debug
      --disable-dependency-tracking
      --disable-silent-rules
      --disable-examples-build
      --with-openssl
      --with-libz
    ]

    if build.with? "libressl"
      args << "--with-libssl-prefix=#{Formula["libressl"].opt_prefix}"
    else
      args << "--with-libssl-prefix=#{Formula["openssl"].opt_prefix}"
    end

    system "./buildconf" if build.head?
    system "./configure", *args
    system "make", "install"
  end

  test do
    (testpath/"test.c").write <<-EOS.undent
      #include <libssh2.h>

      int main(void)
      {
      libssh2_exit();
      return 0;
      }
    EOS

    system ENV.cc, "test.c", "-L#{lib}", "-lssh2", "-o", "test"
    system "./test"
  end
end
