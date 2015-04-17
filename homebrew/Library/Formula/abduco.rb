class Abduco < Formula
  homepage "http://www.brain-dump.org/projects/abduco"
  url "http://www.brain-dump.org/projects/abduco/abduco-0.4.tar.gz"
  sha1 "ccd576eb57d9481d5f372e31ce84b3020f661b68"
  head "git://repo.or.cz/abduco.git"

  bottle do
    cellar :any
    sha256 "d7dde9fc66e7681927e1d871ab13bc78f2fc1561509ce8037c5b96ef020cb086" => :yosemite
    sha256 "1d04d33ff81e970c2f709d33cd3ec24dc91aa2a892635d0e1d85f46bec1e7cba" => :mavericks
    sha256 "ba4005c688b6e9a1d67c0de127ee67e6ffe011c98436f2f2c1480fe551caa94d" => :mountain_lion
  end

  def install
    ENV.append_to_cflags "-D_DARWIN_C_SOURCE"
    system "make", "PREFIX=#{prefix}", "install"
  end

  test do
    result = shell_output("#{bin}/abduco -v")
    result.force_encoding("UTF-8") if result.respond_to?(:force_encoding)
    assert_match /^abduco-#{version}/, result
  end
end
