class Asciidoc < Formula
  homepage "http://www.methods.co.nz/asciidoc"
  url "https://downloads.sourceforge.net/project/asciidoc/asciidoc/8.6.9/asciidoc-8.6.9.tar.gz"
  sha1 "82e574dd061640561fa0560644bc74df71fb7305"

  bottle do
    cellar :any
    revision 1
    sha1 "14ff65fa337658acf5011b24a728a2f6f413fd3c" => :yosemite
    sha1 "84793575a498025283f81295feeee74103386b70" => :mavericks
    sha1 "7c932bea7c4d3e56072a7adb5cd4914cd5972414" => :mountain_lion
  end

  head do
    url "https://code.google.com/p/asciidoc/", :using => :hg
    depends_on "autoconf" => :build
  end

  depends_on "docbook"

  def install
    system "autoconf" if build.head?
    system "./configure", "--prefix=#{prefix}"

    # otherwise OS X's xmllint bails out
    inreplace "Makefile", "-f manpage", "-f manpage -L"
    system "make", "install"
  end

  def caveats; <<-EOS.undent
      If you intend to process AsciiDoc files through an XML stage
      (such as a2x for manpage generation) you need to add something
      like:

        export XML_CATALOG_FILES=#{HOMEBREW_PREFIX}/etc/xml/catalog

      to your shell rc file so that xmllint can find AsciiDoc's
      catalog files.

      See `man 1 xmllint' for more.
    EOS
  end

  test do
    (testpath/"test.txt").write("== Hello World!")
    system "#{bin}/asciidoc", "-b", "html5", "-o", "test.html", "test.txt"
    assert_match /\<h2 id="_hello_world"\>Hello World!\<\/h2\>/, File.read("test.html")
  end
end
