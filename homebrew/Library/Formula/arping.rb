class Arping < Formula
  homepage "https://github.com/ThomasHabets/arping"
  url "https://github.com/ThomasHabets/arping/archive/arping-2.15.tar.gz"
  sha1 "ed0b08a8c425a03b3ea52f0fb36be1a34d015b6c"

  bottle do
    cellar :any
    sha1 "26495a7b0026c0299e83117199910caffc85a5b0" => :yosemite
    sha1 "5214549465ff73bf0514b36249b9ceac4fba2903" => :mavericks
    sha1 "14d70651ab3cb56b74a397c590fb5080e82c48df" => :mountain_lion
  end

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libnet"

  def install
    system "./bootstrap.sh"
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{sbin}/arping", "--help"
  end
end
