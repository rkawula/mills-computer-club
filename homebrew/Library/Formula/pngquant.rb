class Pngquant < Formula
  homepage "http://pngquant.org/"
  url "https://github.com/pornel/pngquant/archive/2.3.5.tar.gz"
  sha256 "8907787afca9b83aefe7e29dbf29f4d107255160d0f32c43e7c159ebc2b8d1a7"

  head "https://github.com/pornel/pngquant.git"

  bottle do
    cellar :any
    sha256 "ee92d8a4cacf08c1e6c3b9f1b4ec0b1c404e82c89e649c89e4f04d48f2640ae7" => :yosemite
    sha256 "f868262676416817559699006d2d3d1eb2458a0b94dd8d123d611fa8eda0d131" => :mavericks
    sha256 "cd3e53b48e29ddbd1315d5913da6de693e543e6e341e8d42ff5d54c76291faf9" => :mountain_lion
  end

  depends_on "pkg-config" => :build
  depends_on "libpng"

  def install
    ENV.append_to_cflags "-DNDEBUG" # Turn off debug
    system "make", "PREFIX=#{prefix}", "CC=#{ENV.cc}"
    bin.install "pngquant"
    man1.install "pngquant.1"
  end

  test do
    system "#{bin}/pngquant", test_fixtures("test.png"), "-o" "out.png"
  end
end
