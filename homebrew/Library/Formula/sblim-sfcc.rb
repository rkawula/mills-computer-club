class SblimSfcc < Formula
  homepage "https://sourceforge.net/projects/sblim/"
  url "https://downloads.sourceforge.net/project/sblim/sblim-sfcc/sblim-sfcc-2.2.8.tar.bz2"
  sha1 "794e9e15ed54f391f227427445789463560f0990"
  bottle do
    sha1 "3ee7ffa2d2daa39ae2488d9408ad8b8dafb2592f" => :yosemite
    sha1 "8cfe583a363961d6fa360b5eba800d045fb4a263" => :mavericks
    sha1 "57c0de85854ce44df4423729adb2dc433000d707" => :mountain_lion
  end

  depends_on :libtool
  depends_on :autoconf
  depends_on :automake
  depends_on "openssl"

  def install
    system "./configure", "--prefix=#{prefix}", "--disable-dependency-tracking"
    system "make", "install"
  end

  # based on the test at #https://github.com/Homebrew/homebrew/blob/master/Library/Formula/tinyxml.rb
  test do
    (testpath/"test.cpp").write <<-EOS.undent
      #include <cimc/cimc.h>
      int main()
      {
        return 0;
      }
    EOS
    system ENV.cxx, "test.cpp", "-lcimcClient", "-o", "test"
    system "./test"
  end
end
