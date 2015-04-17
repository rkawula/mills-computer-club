class Daemonlogger < Formula
  homepage "http://sourceforge.net/projects/daemonlogger/"
  url "https://downloads.sourceforge.net/project/daemonlogger/daemonlogger-1.2.1.tar.gz"
  sha1 "ce0aa20b38f18eca94a6d00fe9126d441fe2818a"

  bottle do
    cellar :any
    sha1 "8c88dd9ba6264227b0f05de526249c22f6debb1c" => :yosemite
    sha1 "3c377a7f673133d801d45be03ef4ce818dfbec8c" => :mavericks
    sha1 "25f74a1590770350f4bc2edba21bdc94cfc2142f" => :mountain_lion
  end

  depends_on "libdnet"

  def install
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/daemonlogger", "-h"
  end
end
