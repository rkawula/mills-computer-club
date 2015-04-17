require 'formula'

class Libcuefile < Formula
  homepage 'http://www.musepack.net/'
  url 'http://files.musepack.net/source/libcuefile_r475.tar.gz'
  sha1 'd7363882384ff75809dc334d3ced8507b81c6051'
  version 'r475'

  bottle do
    cellar :any
    revision 1
    sha1 "94ce9119cf192c06749060b884ed4cab915b65bb" => :yosemite
    sha1 "99d877483270168cbaad5e655f6bad25fe597417" => :mavericks
    sha1 "ed1826e08384d65caced5d38d4c8ad9b6b972e4b" => :mountain_lion
  end

  depends_on 'cmake' => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "make install"
    include.install 'include/cuetools/'
  end
end
