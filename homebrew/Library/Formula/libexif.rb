require 'formula'

class Libexif < Formula
  homepage 'http://libexif.sourceforge.net/'
  url 'https://downloads.sourceforge.net/project/libexif/libexif/0.6.21/libexif-0.6.21.tar.gz'
  sha1 '4106f02eb5f075da4594769b04c87f59e9f3b931'

  bottle do
    cellar :any
    revision 1
    sha1 "7fd580b7289a4d3ace04575ed44e8005feb63691" => :yosemite
    sha1 "170009ee38c18d24a06a6ab0bf2c957cf8b378c2" => :mavericks
    sha1 "4af9a9537c52e59594d313b8decbffc0b12fbf7a" => :mountain_lion
  end

  fails_with :llvm do
    build 2334
    cause "segfault with llvm"
  end

  def install
    system "./configure", "--prefix=#{prefix}", "--disable-dependency-tracking"
    system "make install"
  end
end
