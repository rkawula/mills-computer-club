class Fossil < Formula
  homepage "https://www.fossil-scm.org/"
  head "https://www.fossil-scm.org/", :using => :fossil
  url "https://www.fossil-scm.org/download/fossil-src-1.32.tar.gz"
  sha256 "cd79c333eb9e86fbb8c17bf5cdf31c387e4ab768eede623aed21adfdbcad686e"

  bottle do
    cellar :any
    sha256 "48d1066ffb5380b0e6575925ac240ef1a372b182e2b5983414b45199effb2b13" => :yosemite
    sha256 "3851f9002dc1dab1a67a1bea554145d431e28f5c9f4e2aa3ab3a701c0ea17208" => :mavericks
    sha256 "ebc87b4bc8dca46bbbdc8f7e28c7b682f15d42fcb3c8dcb0f74d94d469ce2bca" => :mountain_lion
  end

  option "without-json", "Build without 'json' command support"
  option "without-tcl", "Build without the tcl-th1 command bridge"

  depends_on "openssl"

  def install
    args = []
    args << "--json" if build.with? "json"
    args << "--with-tcl" if build.with? "tcl"

    system "./configure", *args
    system "make"
    bin.install "fossil"
  end

  test do
    system "#{bin}/fossil", "init", "test"
  end
end
