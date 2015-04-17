class Cbmbasic < Formula
  homepage "https://github.com/mist64/cbmbasic"
  url "https://downloads.sourceforge.net/project/cbmbasic/cbmbasic/1.0/cbmbasic-1.0.tgz"
  sha1 "54564daa7f28be98b03ae7dd1eece9e5439c95c3"
  head "https://github.com/mist64/cbmbasic.git"

  bottle do
    cellar :any
    sha1 "83830760860b56bb7c10dd301c72aae60e8172c1" => :yosemite
    sha1 "3e6da115337e59d612236113185fd29d49cd5763" => :mavericks
    sha1 "7da6d8d160c73fd00e28999ae6c6f4c89b1cacbb" => :mountain_lion
  end

  def install
    system "make", "CFLAGS=#{ENV.cflags}", "LDFLAGS=#{ENV.ldflags}"
    bin.install "cbmbasic"
  end

  test do
    assert_match(/READY.\r\n 1/, pipe_output("#{bin}/cbmbasic", "PRINT 1\n", 0))
  end
end
