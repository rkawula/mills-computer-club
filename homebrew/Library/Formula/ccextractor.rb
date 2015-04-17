class Ccextractor < Formula
  homepage "http://ccextractor.sourceforge.net/"
  url "https://downloads.sourceforge.net/project/ccextractor/ccextractor/0.75/ccextractor.src.0.75.zip"
  sha1 "c36f8eadb2074d88782d6628e07c762e80e4c31c"
  head "https://github.com/ccextractor/ccextractor.git"
  revision 1

  depends_on "cmake" => :build
  depends_on "libpng"

  bottle do
    cellar :any
    sha1 "2bd02af2ba9c80f8cdf6871eaaf2daac5fdbf4ae" => :yosemite
    sha1 "3a8e49c088e63b8d3b20e7819265c59d35b970cb" => :mavericks
    sha1 "1d77c07e0c5477c813219b4fd44e8479e720ce92" => :mountain_lion
  end

  def install
    system "cmake", "src", *std_cmake_args
    system "make"
    system "make", "install"
    (share/"examples").install "docs/ccextractor.cnf.sample"
  end

  test do
    touch testpath/"test"
    system "ccextractor", "test"
    assert File.exist? "test.srt"
  end
end
