require 'formula'

class Bgpq3 < Formula
  homepage 'http://snar.spb.ru/prog/bgpq3/'
  url 'https://github.com/snar/bgpq3/archive/v0.1.27.tar.gz'
  sha1 'fae5f735033202ab288aef3ad7a83a0b323ae8d7'
  head "https://github.com/snar/bgpq3.git"

  bottle do
    cellar :any
    sha256 "d9af2aa66da7aecb0f86f870f8bedede3a99f68d90822a425d7de96b9bedeed9" => :yosemite
    sha256 "e82b1a638d5b0c9a1eb500311887f0221a599c0fa1be760c1cb1a7feea8d3ddd" => :mavericks
    sha256 "88e24d49eb3cc2328fcfb2fe3e455b96bd9954d8547bea3d0e1bc442e084e456" => :mountain_lion
  end

  # Makefile: upstream has been informed of the patch through email (multiple
  # times) but no plans yet to incorporate it https://github.com/snar/bgpq3/pull/2
  # there was discussion about this patch for 0.1.18 and 0.1.19 as well
  patch :DATA

  def install
    system "./configure", "--prefix=#{prefix}", "--mandir=#{man}"
    system "make", "install"
  end

  test do
    system "#{bin}/bgpq3", "AS-ANY"
  end
end

__END__
diff --git a/Makefile.in b/Makefile.in
index c2d7e96..afec780 100644
--- a/Makefile.in
+++ b/Makefile.in
@@ -29,9 +29,10 @@ clean:
 	rm -rf *.o *.core core.* core

 install: bgpq3
+	if test ! -d @prefix@/bin ; then mkdir -p @prefix@/bin ; fi
 	${INSTALL} -c -s -m 755 bgpq3 @bindir@
-	if test ! -d @prefix@/man/man8 ; then mkdir -p @prefix@/man/man8 ; fi
-	${INSTALL} -m 644 bgpq3.8 @prefix@/man/man8
+	if test ! -d @mandir@/man8 ; then mkdir -p @mandir@/man8 ; fi
+	${INSTALL} -m 644 bgpq3.8 @mandir@/man8

 depend:
 	makedepend -- $(CFLAGS) -- $(SRCS)
