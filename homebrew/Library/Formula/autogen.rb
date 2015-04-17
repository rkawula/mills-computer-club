class Autogen < Formula
  homepage "http://autogen.sourceforge.net"
  url "http://ftpmirror.gnu.org/autogen/rel5.18.4/autogen-5.18.4.tar.xz"
  mirror "https://ftp.gnu.org/gnu/autogen/rel5.18.4/autogen-5.18.4.tar.xz"
  sha1 "3d5aa8d99742e92098bb438c684bee5e978a8dd7"

  bottle do
    revision 1
    sha1 "caa1ffc8b0b5403586694ca15846145e731b935d" => :yosemite
    sha1 "def1fe9af81c138662c763b2527aed3f19e24f56" => :mavericks
    sha1 "c7507958613ed6dc9027037d34b117c806867434" => :mountain_lion
  end

  depends_on "pkg-config" => :build
  depends_on "guile"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"

    # make and install must be separate steps for this formula
    system "make"
    system "make", "install"
  end

  test do
    system bin/"autogen", "-v"
  end
end
