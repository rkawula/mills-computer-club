class Pacvim < Formula
  homepage "https://github.com/jmoon018/PacVim"
  url "https://github.com/jmoon018/PacVim/archive/v1.1.1.tar.gz"
  sha1 "496ed02edba8dad15ade95352a7c6441f97fdf7a"
  head "https://github.com/jmoon018/PacVim.git"

  bottle do
    sha1 "72ab787738913d09abc2221f37a8ec9c6da31d5a" => :yosemite
    sha1 "8fab0bdb05fbd24bb0282e68d805fe2e0eaf0908" => :mavericks
    sha1 "c38b89d4de35684122e4ab14ca605fdf4977a7b5" => :mountain_lion
  end

  needs :cxx11

  def install
    ENV.cxx11
    system "make", "install", "PREFIX=#{prefix}"
  end
end
