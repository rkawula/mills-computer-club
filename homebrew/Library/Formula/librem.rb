require "formula"

class Librem < Formula
  homepage "http://www.creytiv.com"
  url "http://www.creytiv.com/pub/rem-0.4.6.tar.gz"
  sha1 "9698b48aee5e720e56440f4c660d8bd4dbb7f8fa"

  bottle do
    cellar :any
    revision 1
    sha1 "d9e53e65a746d38c30e749ed06bde416d5c4b83d" => :yosemite
    sha1 "658296136774b5bad7b94a84d24b290ed412e1f6" => :mavericks
    sha1 "ca0405f5fd90ebbaf16dd49205c1416a823f41f7" => :mountain_lion
  end

  depends_on "libre"

  def install
    libre = Formula["libre"]
    system "make", "install", "PREFIX=#{prefix}",
                              "LIBRE_MK=#{libre.opt_share}/re/re.mk",
                              "LIBRE_INC=#{libre.opt_include}/re",
                              "LIBRE_SO=#{libre.opt_lib}"
  end

  test do
    (testpath/'test.c').write <<-EOS.undent
      #include <re/re.h>
      #include <rem/rem.h>
      int main() {
        return (NULL != vidfmt_name(VID_FMT_YUV420P)) ? 0 : 1;
      }
    EOS
    system ENV.cc, "test.c", "-L#{opt_lib}", "-lrem", "-o", "test"
    system "./test"
  end
end
