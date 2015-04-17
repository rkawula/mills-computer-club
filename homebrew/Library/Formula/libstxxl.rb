require "formula"

class Libstxxl < Formula
  homepage "http://stxxl.sourceforge.net/"
  url "https://downloads.sourceforge.net/project/stxxl/stxxl/1.4.1/stxxl-1.4.1.tar.gz"
  sha1 "cb29de8d33c7603734fa86215723da676a51dbf1"

  bottle do
    cellar :any
    sha1 "2e9e956e2b3500e526a119b980c2854535d5edb0" => :yosemite
    sha1 "50fcd3bca1975e47922a986e7fba52e24e49ae55" => :mavericks
    sha1 "1d54cfe7453bc91b00dfefbe23839a61e376d6c5" => :mountain_lion
  end

  depends_on "cmake" => :build

  def install
    args = std_cmake_args - %w{-DCMAKE_BUILD_TYPE=None}
    args << "-DCMAKE_BUILD_TYPE=Release"
    mkdir "build" do
      system "cmake", "..", *args
      system "make", "install"
    end
  end
end
