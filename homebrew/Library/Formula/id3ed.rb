class Id3ed < Formula
  homepage "http://code.fluffytapeworm.com/projects/id3ed"
  url "http://code.fluffytapeworm.com/projects/id3ed/id3ed-1.10.4.tar.gz"
  sha1 "b699e645fcea2fa42658886621eb10531d24008a"

  bottle do
    cellar :any
    sha1 "ef017f7b0b088be78071487e6c39f3a3e0d43cca" => :yosemite
    sha1 "c40ca26c9c0e89f78c21f852340342063f5b82f9" => :mavericks
    sha1 "b49bc15f4ed27f61c12bc903cf2a7eb60293c65e" => :mountain_lion
  end

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          "--bindir=#{bin}/",
                          "--mandir=#{man1}"
    bin.mkpath
    man1.mkpath
    system "make", "install"
  end

  test do
    system "#{bin}/id3ed", "-r", "-q", test_fixtures("test.mp3")
  end
end
