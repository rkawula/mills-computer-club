class Xrootd < Formula
  homepage "http://xrootd.org"
  url "http://xrootd.org/download/v4.1.1/xrootd-4.1.1.tar.gz"
  sha1 "ed19edf50e0c641f74a78e13b78d2d70d59410f7"
  head "https://github.com/xrootd/xrootd.git"

  bottle do
    cellar :any
    revision 1
    sha1 "9a9d65cd4671a62253bf1d270d0e7e789e4385f7" => :yosemite
    sha1 "81dc9c675bb2fff6a63079bd0d61c0a8dbad2344" => :mavericks
    sha1 "02b5631c4943e11c45d03ce75fbd133f90170265" => :mountain_lion
  end

  depends_on "cmake" => :build
  depends_on "openssl"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
    share.install prefix/"man"
  end

  test do
    system "#{bin}/xrootd", "-H"
  end
end
