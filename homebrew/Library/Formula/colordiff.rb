class Colordiff < Formula
  homepage "http://www.colordiff.org/"
  url "http://www.colordiff.org/colordiff-1.0.13.tar.gz"
  sha1 "64e369aed2230f3aa5f1510b231fcac270793c09"

  bottle do
    cellar :any
    sha1 "b4715b46336a19e8580a1978be0efa815f4f0f3d" => :yosemite
    sha1 "724512050ef11d4b0f99eb46b2fa98a44520e5a6" => :mavericks
    sha1 "7cf723ad9a524e8b7159c57e7a7d97687c3df067" => :mountain_lion
    sha1 "37447591b2cea0958f2f695ad9a56012cc4cba9b" => :lion
  end

  patch :DATA

  def install
    man1.mkpath
    system "make", "INSTALL_DIR=#{bin}",
                   "ETC_DIR=#{etc}",
                   "MAN_DIR=#{man1}",
                   "install"
  end

  test do
    cp HOMEBREW_PREFIX+"bin/brew", "brew1"
    cp HOMEBREW_PREFIX+"bin/brew", "brew2"
    system "#{bin}/colordiff", "brew1", "brew2"
  end
end

__END__
diff --git a/Makefile b/Makefile
index 6ccbfc7..e5d64e7 100644
--- a/Makefile
+++ b/Makefile
@@ -8,6 +8,7 @@ DIST_FILES=COPYING INSTALL Makefile README \
 TMPDIR=colordiff-${VERSION}
 TARBALL=${TMPDIR}.tar.gz

+.PHONY: install

 doc: colordiff.xml cdiff.xml
 	xmlto -vv man colordiff.xml
@@ -28,8 +29,8 @@ install:
 	if [ ! -f ${DESTDIR}${INSTALL_DIR}/cdiff ] ; then \
 	  install cdiff.sh ${DESTDIR}${INSTALL_DIR}/cdiff; \
 	fi
-	install -Dm 644 colordiff.1 ${DESTDIR}${MAN_DIR}/colordiff.1
-	install -Dm 644 cdiff.1 ${DESTDIR}${MAN_DIR}/cdiff.1
+	install -m 644 colordiff.1 ${DESTDIR}${MAN_DIR}/colordiff.1
+	install -m 644 cdiff.1 ${DESTDIR}${MAN_DIR}/cdiff.1
 	if [ -f ${DESTDIR}${ETC_DIR}/colordiffrc ]; then \
 	  mv -f ${DESTDIR}${ETC_DIR}/colordiffrc \
 	    ${DESTDIR}${ETC_DIR}/colordiffrc.old; \
@@ -37,7 +38,6 @@ install:
 	  install -d ${DESTDIR}${ETC_DIR}; \
 	fi
 	cp colordiffrc ${DESTDIR}${ETC_DIR}/colordiffrc
-	-chown root.root ${DESTDIR}${ETC_DIR}/colordiffrc
 	chmod 644 ${DESTDIR}${ETC_DIR}/colordiffrc

 uninstall:
