require "formula"

class Getdns < Formula
  homepage "http://getdnsapi.net"
  url "http://getdnsapi.net/dist/getdns-0.1.6.tar.gz"
  sha1 "675fe336b98de78d3b0f25c5d5e0005dc14021ca"

  head "https://github.com/getdnsapi/getdns.git"

  bottle do
    sha1 "86879ca8d95414125287abc89393781bcd801f88" => :yosemite
    sha1 "c826c175dc647cf68bd8ba12dcc9c78da232fb87" => :mavericks
    sha1 "1c393a248ef0633265f1e40c335a6ddf1fd7794e" => :mountain_lion
  end

  depends_on "ldns"
  depends_on "unbound"
  depends_on "libidn"
  depends_on "libevent" => :optional
  depends_on "libuv" => :optional
  depends_on "libev" => :optional

  def install
    args = []
    args << "--with-libevent" if build.with? "libevent"
    args << "--with-libev" if build.with? "libev"
    args << "--with-libuv" if build.with? "libuv"

    system "./configure", "--prefix=#{prefix}", *args
    system "make", "install"
  end

  test do
    (testpath/"test.c").write <<-EOS.undent
      #include <getdns/getdns.h>

      int main(int argc, char *argv[]) {
        getdns_context *context;
        getdns_dict *api_info;
        char *pp;
        getdns_return_t r = getdns_context_create(&context, 0);
        if (r != GETDNS_RETURN_GOOD) {
            return -1;
        }
        api_info = getdns_context_get_api_information(context);
        if (!api_info) {
            return -1;
        }
        pp = getdns_pretty_print_dict(api_info);
        if (!pp) {
            return -1;
        }
        puts(pp);
        free(pp);
        getdns_dict_destroy(api_info);
        getdns_context_destroy(context);
        return 0;
      }
    EOS
    system ENV.cc, "-I#{include}", "-o", "test", "test.c", "-lgetdns"
    system "./test"
  end
end
