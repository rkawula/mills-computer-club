require 'formula'

class Libestr < Formula
  homepage 'http://libestr.adiscon.com'
  url "http://libestr.adiscon.com/files/download/libestr-0.1.9.tar.gz"
  sha1 "55fb6ad347f987c45d98b422b0436d6ae50d86aa"

  bottle do
    cellar :any
    revision 1
    sha1 "6527f1d2444b2d9b77977bdd445425930bbcc172" => :yosemite
    sha1 "d419d2e778300f56e5ec8b473c436c12e0d81920" => :mavericks
    sha1 "3561f90f17cb8d8b339b8c0f7ead0a17b5bbe243" => :mountain_lion
  end

  depends_on 'pkg-config' => :build

  option :universal

  def install
    ENV.universal_binary if build.universal?
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make"
    system "make install"
  end
end
