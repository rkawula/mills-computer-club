require 'formula'

class Libnet < Formula
  homepage 'https://github.com/sam-github/libnet'
  url 'https://downloads.sourceforge.net/project/libnet-dev/libnet-1.1.6.tar.gz'
  sha1 'dffff71c325584fdcf99b80567b60f8ad985e34c'

  bottle do
    cellar :any
    revision 1
    sha1 "4fde2d99706c15ca126f6f5ac83226288d0de5d0" => :yosemite
    sha1 "8bcb8736a1264d1ec6c44312e36f81ec7a7720c6" => :mavericks
    sha1 "14f7d1d0c595c08c0bbcc4182ff6eabca6df5c8a" => :mountain_lion
  end

  # MacPorts does an autoreconf to get raw sockets working
  depends_on "automake" => :build
  depends_on "autoconf" => :build
  depends_on "libtool" => :build

  # Fix raw sockets support
  patch :p0 do
    url "https://trac.macports.org/export/95336/trunk/dports/net/libnet11/files/patch-configure.in.diff"
    sha1 "f315227dbb205098c6aab92ee9ea17ce87e91384"
  end

  def install
    system "autoreconf", "-fvi"
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    inreplace "src/libnet_link_bpf.c", "#include <net/bpf.h>", "" # Per MacPorts
    system "make install"
  end
end

